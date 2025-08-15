import 'dart:async';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/models/heart_rate_measurement.dart';
import 'package:heart_rate/screens/measure/heart_rate_screen.dart';
import 'package:heart_rate/screens/measure/components/measurement_results_bottom_sheet.dart';
import 'package:heart_rate/services/heart_rate_service.dart';
import 'package:heart_rate/viewmodels/heart_rate_view_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

abstract class StartingRateModelView extends State<HeartRateScreen>
    with TickerProviderStateMixin, WidgetsBindingObserver {
  CameraController? cameraController;
  bool isInitialized = false;
  bool _isDisposed = false;

  late AnimationController pulseAnimationController;
  late Animation<double> pulseAnimation;
  late HeartRateViewModel viewModel;

  Timer? measurementTimer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _isDisposed = false;
    viewModel = HeartRateViewModel();
    viewModel.onMeasurementComplete = () {
      Future.delayed(Duration(milliseconds: 1000), () {
        stopMeasurement();
      });
    };
    initializeAnimation();
    requestPermissions();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_isDisposed) return;

    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      // App going to background - pause camera
      debugPrint('📱 App going to background - pausing camera');
      _pauseCamera();
    } else if (state == AppLifecycleState.resumed) {
      // App coming to foreground - resume camera
      debugPrint('📱 App resumed - reinitializing camera');
      _resumeCamera();
    }
  }

  Future<void> _pauseCamera() async {
    try {
      if (cameraController != null && isInitialized) {
        await cameraController!.stopImageStream().catchError((e) {
          debugPrint('⚠️ Error stopping image stream: $e');
        });
      }
    } catch (e) {
      debugPrint('⚠️ Error pausing camera: $e');
    }
  }

  Future<void> _resumeCamera() async {
    if (_isDisposed) return;

    try {
      if (cameraController != null && isInitialized) {
        // Wait a bit for the app to fully resume
        await Future.delayed(const Duration(milliseconds: 500));

        if (!_isDisposed && mounted) {
          // Reinitialize camera if needed
          if (!cameraController!.value.isInitialized) {
            await initializeCamera();
          } else {
            // Just restart measurement if camera is still good
            if (viewModel.isMeasuring) {
              startMeasurement();
            }
          }
        }
      }
    } catch (e) {
      debugPrint('⚠️ Error resuming camera: $e');
      // Try full reinitialization if resume fails
      if (!_isDisposed && mounted) {
        await initializeCamera();
      }
    }
  }

  void initializeAnimation() {
    pulseAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    pulseAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: pulseAnimationController,
        curve: Curves.easeInOut,
      ),
    );
  }

  Future<void> requestPermissions() async {
    try {
      // Doğrudan camera paketinin kendi izin sistemini kullan
      final cameras = await availableCameras();
      if (cameras.isNotEmpty) {
        await initializeCamera();
      } else {
        showPermissionDialog();
      }
    } catch (e) {
      debugPrint('Camera permission error: $e');
      showPermissionDialog();
    }
  }

  void showPermissionDialog() {
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

  Future<void> initializeCamera() async {
    if (_isDisposed) return;

    try {
      // Dispose existing controller if any
      if (cameraController != null) {
        await cameraController!.dispose();
        cameraController = null;
        isInitialized = false;
      }

      final cameras = await availableCameras();
      if (cameras.isEmpty) {
        showPermissionDialog();
        return;
      }

      // Use back camera for heart rate measurement
      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      debugPrint('🎥 Initializing camera: ${backCamera.name}');

      // Dynamic format detection - test what the device actually supports
      ImageFormatGroup formatGroup = await _detectOptimalFormat(backCamera);

      debugPrint(
        '🎯 Selected optimal format: $formatGroup for ${Platform.operatingSystem}',
      );

      cameraController = CameraController(
        backCamera,
        ResolutionPreset
            .medium, // Changed from low to medium for better Android support
        enableAudio: false,
        imageFormatGroup: formatGroup,
      );

      await cameraController!.initialize();

      if (_isDisposed) return; // Check if disposed during initialization

      // Wait for camera to fully initialize on Android
      await Future.delayed(const Duration(milliseconds: 800));

      if (mounted && !_isDisposed) {
        setState(() {
          isInitialized = true;
        });

        debugPrint(
          '✅ Camera initialized successfully with format: $formatGroup',
        );

        // Delay starting measurement to ensure camera is fully ready
        await Future.delayed(const Duration(milliseconds: 300));
        if (!_isDisposed) {
          startMeasurement();
        }
      }
    } catch (e) {
      debugPrint('❌ Camera initialization failed: $e');
      // Try fallback initialization for Android
      if (!_isDisposed) {
        await _tryFallbackCameraInit();
      }
    }
  }

  /// Dynamically detect the optimal camera format for this device
  Future<ImageFormatGroup> _detectOptimalFormat(
    CameraDescription camera,
  ) async {
    // Priority order: platform preference first, then fallbacks
    final formatPriority = Platform.isIOS
        ? [ImageFormatGroup.bgra8888, ImageFormatGroup.yuv420]
        : [ImageFormatGroup.yuv420, ImageFormatGroup.bgra8888];

    for (final format in formatPriority) {
      try {
        debugPrint('🧪 Testing format: $format');

        final testController = CameraController(
          camera,
          ResolutionPreset.low,
          enableAudio: false,
          imageFormatGroup: format,
        );

        await testController.initialize();
        await testController.dispose();

        debugPrint('✅ Format $format is supported and working');
        return format;
      } catch (e) {
        debugPrint('❌ Format $format failed: $e');
        continue;
      }
    }

    // Ultimate fallback
    debugPrint('⚠️ Using YUV420 as last resort fallback');
    return ImageFormatGroup.yuv420;
  }

  Future<void> _tryFallbackCameraInit() async {
    try {
      debugPrint('🔄 Attempting fallback camera initialization...');
      final cameras = await availableCameras();

      if (cameras.isEmpty) {
        showPermissionDialog();
        return;
      }

      final backCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );

      // Dispose existing controller if any
      await cameraController?.dispose();

      // Platform-specific fallback format selection
      ImageFormatGroup fallbackFormat;
      if (Platform.isAndroid) {
        // For Android fallback, try BGRA8888 if YUV420 failed
        fallbackFormat = ImageFormatGroup.bgra8888;
        debugPrint('🔄 Android fallback: trying BGRA8888');
      } else {
        // For iOS fallback, try YUV420 if BGRA8888 failed
        fallbackFormat = ImageFormatGroup.yuv420;
        debugPrint('🔄 iOS fallback: trying YUV420');
      }

      // Try with different settings for Android compatibility
      cameraController = CameraController(
        backCamera,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: fallbackFormat,
      );

      await cameraController!.initialize();
      await Future.delayed(
        const Duration(milliseconds: 800),
      ); // Longer delay for Android

      if (mounted) {
        setState(() {
          isInitialized = true;
        });
        await Future.delayed(const Duration(milliseconds: 500));
        startMeasurement();
      }
    } catch (e) {
      debugPrint('❌ Fallback camera initialization failed: $e');
      if (e.toString().contains('permission') ||
          e.toString().contains('authorization')) {
        showPermissionDialog();
      }
    }
  }

  Future<void> startMeasurement() async {
    if (!isInitialized || viewModel.isMeasuring) return;

    try {
      // Reset calibration for new measurement
      HeartRateService.resetCalibration();

      // Keep screen on during measurement
      await WakelockPlus.enable();

      // Turn on flash first (before locking settings) - Android compatibility
      try {
        await cameraController!.setFlashMode(FlashMode.torch);
        debugPrint('🔦 Flash enabled successfully');

        // Wait for flash to stabilize
        await Future.delayed(const Duration(milliseconds: 500));
      } catch (e) {
        debugPrint('⚠️ Could not enable flash: $e');
        // Try alternative flash method for some Android devices
        try {
          await cameraController!.setFlashMode(FlashMode.off);
          await Future.delayed(const Duration(milliseconds: 200));
          await cameraController!.setFlashMode(FlashMode.torch);
          debugPrint('🔦 Flash enabled with fallback method');
        } catch (e2) {
          debugPrint('❌ Flash not available on this device: $e2');
        }
      }

      // Lock camera exposure and white balance for consistent readings
      try {
        await cameraController!.setExposureMode(ExposureMode.locked);
        await cameraController!.setFocusMode(FocusMode.locked);
        debugPrint(
          '📷 Camera exposure and focus locked for consistent readings',
        );
      } catch (e) {
        debugPrint('⚠️ Could not lock camera settings: $e');
        // Continue anyway - not all devices support exposure lock
      }

      // Apply slight negative exposure offset to prevent saturation
      try {
        await cameraController!.setExposureOffset(-0.5);
        debugPrint('📷 Applied exposure offset to prevent saturation');
      } catch (e) {
        debugPrint('⚠️ Could not set exposure offset: $e');
        // Continue anyway - not all devices support exposure offset
      }

      viewModel.startMeasurement();

      // Start pulse animation
      pulseAnimationController.repeat(reverse: true);

      // Stop any existing stream first to avoid conflicts
      try {
        await cameraController!.stopImageStream();
        debugPrint('🛑 Stopped existing image stream');
      } catch (e) {
        // No existing stream, continue
        debugPrint('ℹ️ No existing stream to stop: $e');
      }

      // Wait a moment for camera to stabilize with new settings
      await Future.delayed(const Duration(milliseconds: 800));

      // Start image stream processing
      await cameraController!.startImageStream(processImage);

      debugPrint('🫀 Enhanced measurement started with locked camera settings');
    } catch (e) {
      debugPrint('Error starting measurement: $e');
      stopMeasurement();
    }
  }

  void processImage(CameraImage image) {
    viewModel.processImage(image);
  }

  Future<void> stopMeasurement() async {
    if (!viewModel.isMeasuring) return;

    try {
      // Stop timers
      measurementTimer?.cancel();

      // Stop camera stream
      await cameraController?.stopImageStream();

      // Turn off flash
      await cameraController?.setFlashMode(FlashMode.off);

      // Unlock camera settings
      try {
        await cameraController?.setExposureMode(ExposureMode.auto);
        await cameraController?.setFocusMode(FocusMode.auto);
        debugPrint('📷 Camera settings unlocked');
      } catch (e) {
        debugPrint('⚠️ Could not unlock camera settings: $e');
        // Continue anyway
      }

      // Stop pulse animation
      pulseAnimationController.stop();

      // Disable wakelock
      await WakelockPlus.disable();

      viewModel.stopMeasurement();

      // Save measurement if we have a valid heart rate
      if (viewModel.currentHeartRate > 40 && viewModel.currentHeartRate < 200) {
        await saveMeasurement();
        showResults();
      } else {
        showErrorDialog();
      }
    } catch (e) {
      debugPrint('Error stopping measurement: $e');
    }
  }

  Future<void> saveMeasurement() async {
    final measurement = HeartRateMeasurement(
      heartRate: viewModel.currentHeartRate,
      timestamp: DateTime.now(),
      stress: _getStressLevel(viewModel.currentHeartRate),
      tension: _getTensionLevel(viewModel.currentHeartRate),
      energy: _getEnergyLevel(viewModel.currentHeartRate),
    );

    final prefs = await SharedPreferences.getInstance();

    // Save last measurement
    await prefs.setInt('last_heart_rate', viewModel.currentHeartRate);
    await prefs.setString(
      'last_timestamp',
      measurement.timestamp.toIso8601String(),
    );

    // Save to history
    final history = prefs.getStringList('heart_rate_history') ?? [];
    history.add(
      '${measurement.timestamp.toIso8601String()}|${viewModel.currentHeartRate}',
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

  void showResults() {
    final signalQualityPercent = (viewModel.signalQuality * 100).round();
    bool reportCreated = false; // Flag to track if report was created

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: true,
      enableDrag: true,
      builder: (context) => MeasurementResultsBottomSheet(
        heartRate: viewModel.currentHeartRate,
        hrv: viewModel.currentHRV,
        signalQualityPercent: signalQualityPercent,
        onCreateReport: (String status, int mood) {
          reportCreated = true; // Set flag to true
          // Navigate to report screen using GoRouter
          if (mounted) {
            context.go(
              '/report',
              extra: {
                'heartRate': viewModel.currentHeartRate,
                'hrv': viewModel.currentHRV,
                'signalQualityPercent': signalQualityPercent,
                'status':
                    status, // Now using the actual status from bottom sheet
                'mood': mood, // Now using the actual mood from bottom sheet
              },
            );
          } else {}
        },
      ),
    ).then((value) {
      // Only navigate back to measure if report was NOT created
      if (mounted && !reportCreated) {
        context.go('/measure');
      } else if (reportCreated) {}
    });
  }

  void showErrorDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(LocaleKeys.measurement_failed.tr()),
        content: Text(LocaleKeys.measurement_failed_description.tr()),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              context.go('/measure'); // Navigate back to start measure
            },
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _isDisposed = true;
    WidgetsBinding.instance.removeObserver(this);

    // Clean up timers
    measurementTimer?.cancel();

    // Clean up animations
    pulseAnimationController.dispose();

    // Clean up camera
    cameraController?.dispose();

    // Disable wakelock
    WakelockPlus.disable();

    super.dispose();
  }
}
