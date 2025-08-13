import 'dart:async';

import 'package:camera/camera.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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
    with TickerProviderStateMixin {
  CameraController? cameraController;
  bool isInitialized = false;

  late AnimationController pulseAnimationController;
  late Animation<double> pulseAnimation;
  late HeartRateViewModel viewModel;

  Timer? measurementTimer;

  @override
  void initState() {
    super.initState();
    viewModel = HeartRateViewModel();
    viewModel.onMeasurementComplete = () {
      Future.delayed(Duration(milliseconds: 1000), () {
        stopMeasurement();
      });
    };
    initializeAnimation();
    requestPermissions();
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
    try {
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

      cameraController = CameraController(
        backCamera,
        ResolutionPreset.low,
        enableAudio: false,
        imageFormatGroup: ImageFormatGroup
            .bgra8888, // Try BGRA format for better color analysis
      );

      await cameraController!.initialize();

      if (mounted) {
        setState(() {
          isInitialized = true;
        });
        // Start measurement immediately when camera is ready
        startMeasurement();
      }
    } catch (e) {
      debugPrint('Error initializing camera: $e');
      // Bu hata kamera izni olmadığını gösterebilir
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

      // Turn on flash
      await cameraController!.setFlashMode(FlashMode.torch);

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
        onCreateReport: () {
          // Navigate back to home screen
          if (mounted) {
            Navigator.of(context).popUntil((route) => route.isFirst);
          }
        },
      ),
    ).then((value) {
      // When modal is dismissed (by swiping down or tapping outside),
      // navigate back to start measure screen
      if (mounted) {
        Navigator.of(context).pop(); // Pop current heart rate screen
      }
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
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.ok.tr()),
          ),
        ],
      ),
    );
  }
}
