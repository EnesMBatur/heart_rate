import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:async';
import '../models/heart_rate_measurement.dart';
import '../services/heart_rate_service.dart';
import '../locale/lang/locale_keys.g.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen>
    with TickerProviderStateMixin {
  CameraController? _cameraController;
  bool _isInitialized = false;
  bool _isMeasuring = false;

  final List<double> _heartRateValues = [];
  int _currentHeartRate = 0;
  int _countdown = 0;

  late AnimationController _pulseAnimationController;
  late Animation<double> _pulseAnimation;

  Timer? _measurementTimer;
  Timer? _countdownTimer;

  final HeartRateService _heartRateService = HeartRateService();

  @override
  void initState() {
    super.initState();
    _initializeAnimation();
    _requestPermissions();
  }

  void _initializeAnimation() {
    _pulseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _pulseAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> _requestPermissions() async {
    try {
      // Doğrudan camera paketinin kendi izin sistemini kullan
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await _initializeCamera();
      } else {
        _showPermissionDialog();
      }
    } catch (e) {
      debugPrint('Camera permission error: $e');
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.camera_permission_required.tr()),
        content: Text(LocaleKeys.camera_permission_description.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.cancel.tr()),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              openAppSettings();
            },
            child: Text(LocaleKeys.settings.tr()),
          ),
        ],
      ),
    );
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        _showPermissionDialog();
        return;
      }

      // Use back camera for heart rate measurement
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      _cameraController = CameraController(
        backCamera,
        ResolutionPreset.low,
        enableAudio: false,
      );

      await _cameraController!.initialize();

      if (mounted) {
        setState(() {
          _isInitialized = true;
        });
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
      // Bu hata kamera izni olmadığını gösterebilir
      if (e.toString().contains('permission') ||
          e.toString().contains('authorization')) {
        _showPermissionDialog();
      }
    }
  }

  Future<void> _startMeasurement() async {
    if (!_isInitialized || _isMeasuring) return;

    try {
      // Keep screen on during measurement
      await WakelockPlus.enable();

      // Turn on flash
      await _cameraController!.setFlashMode(FlashMode.torch);

      setState(() {
        _isMeasuring = true;
        _heartRateValues.clear();
        _currentHeartRate = 0;
        _countdown = 30; // 30 second measurement
      });

      // Start pulse animation
      _pulseAnimationController.repeat(reverse: true);

      // Start countdown
      _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _countdown--;
        });

        if (_countdown <= 0) {
          _stopMeasurement();
        }
      });

      // Start image stream processing
      await _cameraController!.startImageStream(_processImage);
    } catch (e) {
      debugPrint('Error starting measurement: $e');
      _stopMeasurement();
    }
  }

  void _processImage(CameraImage image) {
    if (!_isMeasuring) return;

    // Process the camera image to detect heart rate
    final avg = _calculateAverageIntensity(image);
    _heartRateValues.add(avg);

    // Calculate heart rate every few samples
    if (_heartRateValues.length >= 60) {
      final heartRate = _heartRateService.calculateHeartRate(_heartRateValues);

      if (mounted) {
        setState(() {
          _currentHeartRate = heartRate;
        });

        // Update pulse animation speed based on heart rate
        if (heartRate > 0) {
          final bpm = heartRate / 60.0;
          _pulseAnimationController.duration = Duration(
            milliseconds: (1000 / bpm).round(),
          );
        }
      }

      // Keep only recent values
      if (_heartRateValues.length > 120) {
        _heartRateValues.removeRange(0, _heartRateValues.length - 120);
      }
    }
  }

  double _calculateAverageIntensity(CameraImage image) {
    // Calculate average intensity from camera image
    // This is a simplified version - in a real app, you'd want more sophisticated processing

    if (image.planes.isEmpty) return 0.0;

    final plane = image.planes[0];
    final bytes = plane.bytes;

    if (bytes.isEmpty) return 0.0;

    int sum = 0;
    for (int i = 0; i < bytes.length; i += 10) {
      // Sample every 10th pixel for performance
      sum += bytes[i];
    }

    return sum / (bytes.length / 10);
  }

  Future<void> _stopMeasurement() async {
    if (!_isMeasuring) return;

    try {
      // Stop timers
      _countdownTimer?.cancel();
      _measurementTimer?.cancel();

      // Stop camera stream
      await _cameraController?.stopImageStream();

      // Turn off flash
      await _cameraController?.setFlashMode(FlashMode.off);

      // Stop pulse animation
      _pulseAnimationController.stop();

      // Disable wakelock
      await WakelockPlus.disable();

      setState(() {
        _isMeasuring = false;
      });

      // Save measurement if we have a valid heart rate
      if (_currentHeartRate > 40 && _currentHeartRate < 200) {
        await _saveMeasurement();
        _showResults();
      } else {
        _showErrorDialog();
      }
    } catch (e) {
      debugPrint('Error stopping measurement: $e');
    }
  }

  Future<void> _saveMeasurement() async {
    final measurement = HeartRateMeasurement(
      heartRate: _currentHeartRate,
      timestamp: DateTime.now(),
      stress: _getStressLevel(_currentHeartRate),
      tension: _getTensionLevel(_currentHeartRate),
      energy: _getEnergyLevel(_currentHeartRate),
    );

    final prefs = await SharedPreferences.getInstance();

    // Save last measurement
    await prefs.setInt('last_heart_rate', _currentHeartRate);
    await prefs.setString(
      'last_timestamp',
      measurement.timestamp.toIso8601String(),
    );

    // Save to history
    final history = prefs.getStringList('heart_rate_history') ?? [];
    history.add(
      '${measurement.timestamp.toIso8601String()}|$_currentHeartRate',
    );
    await prefs.setStringList('heart_rate_history', history);
  }

  int _getStressLevel(int heartRate) {
    if (heartRate < 60) return 1;
    if (heartRate < 80) return 2;
    if (heartRate < 100) return 3;
    if (heartRate < 120) return 4;
    return 5;
  }

  int _getTensionLevel(int heartRate) {
    if (heartRate < 70) return 1;
    if (heartRate < 90) return 2;
    if (heartRate < 110) return 3;
    if (heartRate < 130) return 4;
    return 5;
  }

  int _getEnergyLevel(int heartRate) {
    if (heartRate < 60) return 2;
    if (heartRate < 80) return 5;
    if (heartRate < 100) return 4;
    if (heartRate < 120) return 3;
    return 2;
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.measurement_complete.tr()),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite,
              color: Theme.of(context).primaryColor,
              size: 48,
            ),
            const SizedBox(height: 16),
            Text(
              '$_currentHeartRate BPM',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              LocaleKeys.heart_rate_category.tr(
                args: [_getHeartRateCategory(_currentHeartRate)],
              ),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildResultItem(
                  LocaleKeys.stress.tr(),
                  _getStressLevel(_currentHeartRate),
                ),
                _buildResultItem(
                  LocaleKeys.tension.tr(),
                  _getTensionLevel(_currentHeartRate),
                ),
                _buildResultItem(
                  LocaleKeys.energy.tr(),
                  _getEnergyLevel(_currentHeartRate),
                ),
              ],
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem(String label, int value) {
    return Column(
      children: [
        Text(
          '$value/5',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  String _getHeartRateCategory(int heartRate) {
    if (heartRate < 60) return LocaleKeys.heart_rate_low.tr();
    if (heartRate <= 100) return LocaleKeys.heart_rate_normal.tr();
    if (heartRate <= 120) return LocaleKeys.heart_rate_elevated.tr();
    return LocaleKeys.heart_rate_high.tr();
  }

  void _showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.measurement_failed.tr()),
        content: Text(LocaleKeys.measurement_failed_description.tr()),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.heart_rate_measurement.tr()),
        elevation: 0,
      ),
      body: _isInitialized ? _buildMeasurementBody() : _buildLoadingBody(),
    );
  }

  Widget _buildLoadingBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          const SizedBox(height: 16),
          Text(LocaleKeys.initializing_camera.tr()),
        ],
      ),
    );
  }

  Widget _buildMeasurementBody() {
    return Column(
      children: [
        // Instructions
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
          child: Column(
            children: [
              Icon(
                Icons.info_outline,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
              const SizedBox(height: 8),
              Text(
                LocaleKeys.instruction_place_finger.tr(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
        ),

        // Camera preview (small)
        Expanded(
          flex: 1,
          child: Container(
            width: double.infinity,
            color: Colors.black,
            child: _cameraController != null
                ? CameraPreview(_cameraController!)
                : Center(
                    child: Text(
                      LocaleKeys.camera_not_available.tr(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
          ),
        ),

        // Measurement area
        Expanded(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Heart rate display
                AnimatedBuilder(
                  animation: _pulseAnimation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _isMeasuring ? _pulseAnimation.value : 1.0,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(
                            context,
                          ).primaryColor.withValues(alpha: 0.1),
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 3,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Theme.of(context).primaryColor,
                              size: 48,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _isMeasuring ? '$_currentHeartRate' : '--',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            const Text(
                              'BPM',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // Countdown or status
                if (_isMeasuring) ...[
                  Text(
                    LocaleKeys.measuring_countdown.tr(args: ['$_countdown']),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: (30 - _countdown) / 30,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ] else ...[
                  Text(
                    LocaleKeys.ready_to_measure.tr(),
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                ],

                const SizedBox(height: 32),

                // Start/Stop button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isMeasuring
                        ? _stopMeasurement
                        : _startMeasurement,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isMeasuring
                          ? Colors.red
                          : Theme.of(context).primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      _isMeasuring
                          ? LocaleKeys.stop_measurement.tr()
                          : LocaleKeys.start_measurement.tr(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _measurementTimer?.cancel();
    _pulseAnimationController.dispose();
    _cameraController?.dispose();
    WakelockPlus.disable();
    super.dispose();
  }
}
