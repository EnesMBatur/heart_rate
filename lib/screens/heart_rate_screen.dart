import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:async';
import 'dart:math';
import '../models/heart_rate_measurement.dart';
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

  late AnimationController _pulseAnimationController;
  late Animation<double> _pulseAnimation;

  Timer? _measurementTimer;
  // Simple finger detection threshold: intensity below this indicates finger covering lens
  static const double _fingerThreshold = 80.0;
  // Initial sample count for analysis (extends measurement for accuracy)
  static const int _initialSampleCount =
      900; // Increased for longer measurement

  // Recent heart rate smoothing window size
  static const int _maxRecentHrCount = 16;

  // Signal quality tracking
  double _signalQuality = 0.0;
  double _currentHRV = 0.0; // HRV değişken olmalı
  // double _lfHfRatio = 0.0; // removed unused field

  // Dynamic measurement
  int _validMeasurements = 0;
  final List<int> _recentHeartRates = [];
  bool _measurementCompleted = false;
  // Estimated camera frame rate for PPG timing
  static const double _frameRate = 25.0; // Adjusted from 30 to calibrate HR

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
        _recentHeartRates.clear();
        _currentHeartRate = 0;
        _signalQuality = 0.0;
        _currentHRV = 0.0;
        // _lfHfRatio = 0.0; // removed
        _validMeasurements = 0;
        _measurementCompleted = false;
      });

      // Start pulse animation
      _pulseAnimationController.repeat(reverse: true);

      // Start image stream processing
      await _cameraController!.startImageStream(_processImage);
    } catch (e) {
      debugPrint('Error starting measurement: $e');
      _stopMeasurement();
    }
  }

  void _processImage(CameraImage image) {
    if (!_isMeasuring || _measurementCompleted) return;

    // Process the camera image to detect heart rate
    final avg = _calculateAverageIntensity(image);

    // Basic finger presence check using intensity threshold
    // Finger presence: lens covered yields lower intensity than bright scenes
    final isFingerPresent = avg < _fingerThreshold;
    debugPrint(
      '🔍 Finger detect: intensity=${avg.toInt()}, threshold=$_fingerThreshold -> $isFingerPresent',
    );
    if (!isFingerPresent) {
      setState(() {
        _currentHeartRate = 0;
        _signalQuality = 0.0;
      });
      return;
    }

    // Parmak varsa veri topla
    _heartRateValues.add(avg);

    // Debug: Show intensity values
    if (_heartRateValues.length % 30 == 0) {
      debugPrint(
        '📊 Veri Toplama: ${_heartRateValues.length} örnek, Son değer: ${avg.toInt()}',
      );
    }

    // Kaliteli ölçüm için yeterli veri toplandığında analiz et
    if (_heartRateValues.length >= _initialSampleCount) {
      // 5 seconds of data (now extended)
      final analysisResult = _performAdvancedAnalysis(_heartRateValues);
      if (analysisResult != null) {
        _validMeasurements++;

        // Son ölçümleri kaydet
        _recentHeartRates.add(analysisResult['heartRate'] as int);
        if (_recentHeartRates.length > _maxRecentHrCount) {
          _recentHeartRates.removeAt(0);
        }

        if (mounted) {
          // Compute median of recent rates for smoothing
          final sortedRates = List<int>.from(_recentHeartRates)..sort();
          final medianRate = sortedRates[sortedRates.length ~/ 2];
          setState(() {
            _currentHeartRate = medianRate;
            _currentHRV = analysisResult['hrv'] as double;
            _signalQuality = analysisResult['quality'] as double;
          });

          // Nabız animasyonu güncelle
          final bpm = _currentHeartRate / 60.0;
          _pulseAnimationController.duration = Duration(
            milliseconds: (1000 / bpm).round(),
          );
        }

        debugPrint(
          '✅ Kaliteli Ölçüm: $_currentHeartRate BPM, HRV: ${_currentHRV.toStringAsFixed(2)}, Kalite: ${(_signalQuality * 100).toInt()}%',
        );

        // Yeterli kaliteli ölçüm varsa tamamla
        if (_shouldCompleteMeasurement()) {
          debugPrint('🎯 Ölçüm tamamlandı - yeterli kaliteli veri toplandı');
          _measurementCompleted = true;
          Future.delayed(Duration(milliseconds: 1000), () {
            _stopMeasurement();
          });
        }
      } else {
        debugPrint('❌ Düşük kaliteli sinyal - devam ediliyor');
      }

      // Sliding window: remove oldest 30 samples, keep recent data
      if (_heartRateValues.length > _initialSampleCount) {
        _heartRateValues.removeRange(0, 30);
      }
    }
  }

  double _calculateAverageIntensity(CameraImage image) {
    // Calculate average intensity from camera image
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

  /// Gelişmiş sinyal analizi - Pulse, HRV ve LF/HF hesaplar
  Map<String, dynamic>? _performAdvancedAnalysis(List<double> signal) {
    if (signal.length < _initialSampleCount) return null;

    try {
      // 1. Temel sinyal kalitesi kontrolü
      final signalQuality = _calculateSignalQuality(signal);
      if (signalQuality < 0.7) return null; // Require at least 70% quality

      // 2. Peak detection ve R-R interval hesaplama
      final peaks = _detectPeaks(signal);
      if (peaks.length < 5) return null; // En az 5 peak gerekli

      // 3. R-R intervallerini hesapla (milisaniye)
      final rrIntervals = <double>[];
      final sampleRate = _frameRate; // FPS, use calibrated frame rate

      for (int i = 1; i < peaks.length; i++) {
        final intervalSamples = peaks[i] - peaks[i - 1];
        final intervalMs = (intervalSamples / sampleRate) * 1000;

        // Makul aralıkta olmalı (300ms - 2000ms arası)
        if (intervalMs >= 300 && intervalMs <= 2000) {
          rrIntervals.add(intervalMs);
        }
      }

      if (rrIntervals.length < 3) return null;

      // 4. Heart Rate hesapla
      final avgRRMs = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
      final heartRate = (60000 / avgRRMs).round();

      if (heartRate < 40 || heartRate > 200) return null;

      // 5. HRV hesapla (RMSSD metodu)
      final hrv = _calculateRMSSD(rrIntervals);
      // SDNN: standard deviation of NN intervals
      final sdnn = _calculateSDNN(rrIntervals);
      // 6. Frequency domain analysis (simplified LF/HF)
      final lfHf = _calculateLFHFRatio(rrIntervals);

      debugPrint(
        '📊 Analiz: HR=$heartRate, HRV=${hrv.toStringAsFixed(2)}, SDNN=${sdnn.toStringAsFixed(2)}, LF/HF=${lfHf.toStringAsFixed(2)}, Kalite=${(signalQuality * 100).toInt()}%',
      );

      return {
        'heartRate': heartRate,
        'hrv': hrv,
        'sdnn': sdnn,
        'lfHfRatio': lfHf,
        'quality': signalQuality,
        'rrCount': rrIntervals.length,
      };
    } catch (e) {
      debugPrint('❌ Analiz hatası: $e');
      return null;
    }
  }

  /// SDNN (Standard Deviation of NN intervals)
  double _calculateSDNN(List<double> rrIntervals) {
    final mean = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
    final sumSq = rrIntervals
        .map((x) => (x - mean) * (x - mean))
        .reduce((a, b) => a + b);
    return sqrt(sumSq / rrIntervals.length);
  }

  /// Sinyal kalitesini hesaplar
  double _calculateSignalQuality(List<double> signal) {
    if (signal.length < 50) return 0.0;

    // SNR hesaplama
    final mean = signal.reduce((a, b) => a + b) / signal.length;
    final variance =
        signal.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        signal.length;
    final stdDev = sqrt(variance);

    // Sinyal gürültü oranı
    final snr = mean > 0 ? mean / stdDev : 0.0;

    // Normalize et (0-1 arası)
    return (snr / 10).clamp(0.0, 1.0);
  }

  /// Peak detection algoritması
  List<int> _detectPeaks(List<double> signal) {
    final peaks = <int>[];
    final threshold = _calculateAdaptiveThreshold(signal);

    for (int i = 1; i < signal.length - 1; i++) {
      // Local maximum ve threshold üzeri
      if (signal[i] > signal[i - 1] &&
          signal[i] > signal[i + 1] &&
          signal[i] > threshold) {
        // Son peak'ten en az 15 sample uzakta olmalı (0.5 saniye)
        if (peaks.isEmpty || i - peaks.last > 15) {
          peaks.add(i);
        }
      }
    }

    return peaks;
  }

  /// Adaptive threshold hesaplama
  double _calculateAdaptiveThreshold(List<double> signal) {
    final sorted = List<double>.from(signal)..sort();
    final percentile75 = sorted[(sorted.length * 0.75).floor()];
    final percentile25 = sorted[(sorted.length * 0.25).floor()];

    return percentile25 + (percentile75 - percentile25) * 0.3;
  }

  /// RMSSD (Root Mean Square of Successive Differences) HRV hesaplama
  double _calculateRMSSD(List<double> rrIntervals) {
    if (rrIntervals.length < 2) return 0.0;

    double sumSquaredDiffs = 0.0;

    for (int i = 1; i < rrIntervals.length; i++) {
      final diff = rrIntervals[i] - rrIntervals[i - 1];
      sumSquaredDiffs += diff * diff;
    }

    return sqrt(sumSquaredDiffs / (rrIntervals.length - 1));
  }

  /// Kaliteli ölçüm için yeterli veri toplandığında tamamlar
  bool _shouldCompleteMeasurement() {
    // En az 8 kaliteli ölçüm gerekli
    if (_validMeasurements < 8) return false;

    // Son ölçümler istikrarlı olmalı
    if (_recentHeartRates.length >= 4) {
      final avg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final maxDeviation = _recentHeartRates
          .map((hr) => (hr - avg).abs())
          .reduce((a, b) => max(a, b));

      // İstikrarlı değerler: 8 BPM tolerans
      final isStable = maxDeviation <= 8.0;

      // HRV kalitesi de kontrol et
      final isValidHRV = _currentHRV > 5.0; // allow high HRV values

      // Sinyal kalitesi yeterli mi
      final isGoodQuality = _signalQuality > 0.8; // More stringent quality

      debugPrint(
        '🎯 Tamamlama Kontrolü: Stable=$isStable (dev=${maxDeviation.toInt()}), HRV=$isValidHRV (${_currentHRV.toInt()}), Quality=$isGoodQuality (${(_signalQuality * 100).toInt()}%)',
      );

      return isStable && isValidHRV && isGoodQuality;
    }

    return false;
  }

  /// LF/HF Ratio hesaplama (basitleştirilmiş)
  double _calculateLFHFRatio(List<double> rrIntervals) {
    if (rrIntervals.length < 5) return 1.0;

    // Basit frequency domain approximation
    // Gerçek LF/HF için FFT gerekir, burada basitleştiriyoruz

    // Variance-based approximation
    final mean = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
    final variance =
        rrIntervals
            .map((x) => (x - mean) * (x - mean))
            .reduce((a, b) => a + b) /
        rrIntervals.length;

    // Low freq (LF) ~ intermediate variations
    final lf = variance * 0.4;

    // High freq (HF) ~ respiratory variations
    final hf = variance * 0.5;

    return hf > 0 ? lf / hf : 1.0;
  }

  Future<void> _stopMeasurement() async {
    if (!_isMeasuring) return;

    try {
      // Stop timers
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

  // Measurement widget separated from loading
  Widget _buildMeasurementBody() {
    return Column(
      children: [
        // Instructions
        Container(
          padding: const EdgeInsets.all(16),
          color: Theme.of(context).primaryColor.withAlpha(25),
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
        // Camera preview
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
                          color: Theme.of(context).primaryColor.withAlpha(25),
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
                  // Parmak durumu ve ölçüm bilgisi
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _currentHeartRate > 0
                          ? Colors.green.withAlpha(25)
                          : Colors.orange.withAlpha(25),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: _currentHeartRate > 0
                            ? Colors.green
                            : Colors.orange,
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _currentHeartRate > 0
                              ? Icons.check_circle
                              : Icons.warning,
                          color: _currentHeartRate > 0
                              ? Colors.green
                              : Colors.orange,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          _currentHeartRate > 0
                              ? 'Nabız algılandı'
                              : 'Parmağınızı kameraya yerleştirin',
                          style: TextStyle(
                            color: _currentHeartRate > 0
                                ? Colors.green
                                : Colors.orange,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  Text(
                    _measurementCompleted
                        ? 'Kaliteli ölçüm tamamlandı!'
                        : _validMeasurements > 0
                        ? 'Kaliteli veri: $_validMeasurements/8 | HRV: ${_currentHRV.toStringAsFixed(1)} | Kalite: ${(_signalQuality * 100).toInt()}%'
                        : 'Nabız analiz ediliyor...',
                    style: Theme.of(context).textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  LinearProgressIndicator(
                    value: _measurementCompleted
                        ? 1.0
                        : _validMeasurements > 0
                        ? (_validMeasurements / 8).clamp(0.0, 1.0)
                        : 0.1,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      _measurementCompleted
                          ? Colors.green
                          : _signalQuality > 0.7
                          ? Colors.blue
                          : Colors.orange,
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
    _measurementTimer?.cancel();
    _pulseAnimationController.dispose();
    _cameraController?.dispose();
    WakelockPlus.disable();
    super.dispose();
  }
}
