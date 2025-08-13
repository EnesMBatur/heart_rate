import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:heart_rate/screens/measure/modelview/starting_rate_model_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:lottie/lottie.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends StartingRateModelView {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Measure',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: AnimatedBuilder(
        animation: viewModel,
        builder: (context, child) {
          // Always show measurement body - start immediately without loading
          return _buildMeasurementBody();
        },
      ),
    );
  }

  // Measurement widget with integrated camera preview
  Widget _buildMeasurementBody() {
    // Debug: Print current state
    debugPrint(
      '🖥️ UI State: isMeasuring=${viewModel.isMeasuring}, isFingerDetected=${viewModel.isFingerDetected}, currentHeartRate=${viewModel.currentHeartRate}',
    );

    // Phase 1: Show instructions when measuring but finger not detected OR when camera not ready
    if (!isInitialized ||
        (viewModel.isMeasuring && !viewModel.isFingerDetected)) {
      debugPrint('🖥️ Showing Phase 1: Instructions or Camera not ready');
      return LayoutBuilder(
        builder: (context, constraints) {
          final started = viewModel.isMeasuring;
          return Column(
            children: [
              // Use SafeArea at the top only to match start_measure_screen
              SafeArea(
                bottom: false, // Don't apply bottom SafeArea
                child: Column(
                  children: [
                    // Top section - responsive height (20% of screen - reduced)
                    SizedBox(
                      height:
                          constraints.maxHeight *
                          0.20, // Reduced from 0.2 to give more space
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 1.h, // Reduced padding
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Camera preview in circular avatar
                            CircleAvatar(
                              radius: 24, // Reduced from 26
                              backgroundColor: Colors.grey.shade200,
                              child: ClipOval(
                                child: SizedBox(
                                  width: 48, // Reduced from 52
                                  height: 48, // Reduced from 52
                                  child:
                                      isInitialized && cameraController != null
                                      ? AspectRatio(
                                          aspectRatio: cameraController!
                                              .value
                                              .aspectRatio,
                                          child: CameraPreview(
                                            cameraController!,
                                          ),
                                        )
                                      : Icon(
                                          Icons.camera_alt,
                                          color: Theme.of(context).primaryColor,
                                          size: 24, // Reduced from 26
                                        ),
                                ),
                              ),
                            ),
                            SizedBox(height: 1.5.h), // Reduced from 3.h
                            Text(
                              'Measuring...',
                              style: TextStyle(
                                fontSize: 20.sp, // Reduced from 22.sp
                                fontWeight: FontWeight.w600,
                                color: Colors.black87,
                                letterSpacing: 0.3,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 0.8.h), // Reduced from 1.h
                            Flexible(
                              // Add Flexible to prevent overflow
                              child: Text(
                                'Please put your finger on the camera and flashlight',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp, // Reduced from 14.sp
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w400,
                                ),
                                maxLines: 2, // Limit to 2 lines
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Heart animation section - responsive height (60% of screen - increased)
                    SizedBox(
                      height:
                          constraints.maxHeight *
                          0.48, // Increased from 0.48 to compensate top section reduction
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 1.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Use full available space for heart animation
                            Expanded(
                              child: Center(
                                child: _StartRing(
                                  started: started,
                                  animation: pulseAnimation,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Bottom instruction section - responsive height (20% of screen - reduced)
                    SizedBox(
                      height:
                          constraints.maxHeight *
                          0.28, // 20% of available height
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          horizontal: 5.w,
                          vertical: 2.h,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 20.h, // Responsive height
                              width: double.infinity,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  // Background chart covering full width
                                  Positioned.fill(
                                    child: Image.asset(
                                      'assets/images/general/bpm_chart.png',
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                  // Instruction image on top
                                  Image.asset(
                                    'assets/images/general/how_to_use.png',
                                    fit: BoxFit.contain,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Add bottom spacing to simulate bottom navigation bar height
              SizedBox(height: 2.h), // Approximate bottom nav bar height
            ],
          );
        },
      );
    }

    // Phase 2: Finger detected & measurement progressing
    debugPrint('🖥️ Showing Phase 2: Finger detected and measuring');
    return Column(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildHeartAnimationStack(showValue: true),
                  const SizedBox(height: 24),
                  // heart_rate.json animation in Phase 2 (replacing instruction area)
                  SizedBox(
                    height: 190,
                    child: Lottie.asset(
                      'assets/json/heart_rate.json',
                      repeat: true,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Progress + status
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: viewModel.progress,
                      backgroundColor: Colors.grey.withValues(alpha: .2),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        viewModel.measurementCompleted
                            ? Colors.green
                            : Theme.of(context).primaryColor,
                      ),
                      minHeight: 6,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: .05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Measuring ${(viewModel.progress * 100).toInt()}%',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Measuring your heart rate. Please hold on...',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Add bottom spacing to match start_measure_screen's bottom navigation bar height
        SizedBox(height: 8.h), // Approximate bottom nav bar height
      ],
    );
  }

  Widget _buildHeartAnimationStack({required bool showValue}) {
    return SizedBox(
      width: 260,
      height: 260,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Only start_heart.json for Phase 2, remove background chart
          Positioned.fill(
            child: Lottie.asset(
              'assets/json/start_heart.json',
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),
          if (showValue)
            Positioned(
              bottom: 40,
              child: Column(
                children: [
                  Text(
                    viewModel.currentHeartRate > 0
                        ? '${viewModel.currentHeartRate}'
                        : '--',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                      shadows: [
                        Shadow(
                          color: Colors.black.withValues(alpha: .15),
                          blurRadius: 8,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'bpm',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                      color: Colors.white,
                      shadows: [Shadow(color: Colors.black38, blurRadius: 6)],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    measurementTimer?.cancel();
    pulseAnimationController.dispose();
    cameraController?.dispose();
    WakelockPlus.disable();
    super.dispose();
  }

  // --- Helper visual widgets ---
}

class _StartRing extends StatelessWidget {
  final bool started;
  final Animation<double> animation;
  const _StartRing({required this.started, required this.animation});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.0, // Keep square aspect ratio like start_measure_screen
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Heart animation container - use full available space like start_measure_screen
          AnimatedBuilder(
            animation: animation,
            builder: (context, child) => Transform.scale(
              scale: started ? animation.value : 1.0,
              child: Lottie.asset(
                'assets/json/start_heart.json',
                repeat: true,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // BPM text positioned at center of heart animation
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '--',
                  style: TextStyle(
                    fontSize: 20.sp, // Match start_measure_screen
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [Shadow(color: Colors.black38, blurRadius: 8)],
                  ),
                ),
                SizedBox(height: 0.3.h), // Match start_measure spacing
                Text(
                  'bpm',
                  style: TextStyle(
                    fontSize: 12.sp, // Match start_measure_screen
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1.2,
                    color: Colors.white,
                    shadows: [Shadow(color: Colors.black38, blurRadius: 6)],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
