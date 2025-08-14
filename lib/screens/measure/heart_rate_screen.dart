import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:heart_rate/screens/measure/components/start_ring.dart';
import 'package:heart_rate/screens/measure/modelview/starting_rate_model_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
    // Fast transition: If high quality signal detected, go straight to Phase 2
    if (!isInitialized ||
        (viewModel.isMeasuring &&
            !viewModel.isFingerDetected &&
            !viewModel.hasHighQualitySignal)) {
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
                                  child: _buildCameraPreview(),
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
                                child: StartRing(
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
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            // Use SafeArea at the top only to match start_measure_screen
            SafeArea(
              bottom: false, // Don't apply bottom SafeArea
              child: Column(
                children: [
                  // Top section - responsive height (20% of screen)
                  SizedBox(
                    height: constraints.maxHeight * 0.20,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.w,
                        vertical: 1.h,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Camera preview in circular avatar
                          CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey.shade200,
                            child: ClipOval(
                              child: SizedBox(
                                width: 48,
                                height: 48,
                                child: isInitialized && cameraController != null
                                    ? AspectRatio(
                                        aspectRatio:
                                            cameraController!.value.aspectRatio,
                                        child: CameraPreview(cameraController!),
                                      )
                                    : Icon(
                                        Icons.camera_alt,
                                        color: Theme.of(context).primaryColor,
                                        size: 24,
                                      ),
                              ),
                            ),
                          ),
                          SizedBox(height: 1.5.h),
                          Text(
                            'Measuring... (${(viewModel.progress * 100).toInt()}%)',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 0.8.h),
                          Flexible(
                            child: Text(
                              'Measuring your heart rate. Please hold on...',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 15.sp,
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w400,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Heart animation section - responsive height (48% of screen)
                  SizedBox(
                    height: constraints.maxHeight * 0.48,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Use full available space for heart animation
                          Expanded(
                            child: Center(
                              child: StartRing(
                                started: true,
                                animation: pulseAnimation,
                                heartRate: viewModel.currentHeartRate,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Bottom instruction section - responsive height (28% of screen)
                  SizedBox(
                    height: constraints.maxHeight * 0.28,
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
                            height: 20.h,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                // Background chart covering full width and height
                                Positioned.fill(
                                  child: Image.asset(
                                    'assets/images/general/bpm_chart.png',
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: double.infinity,
                                  ),
                                ),
                                // heart_rate.json animation on top (replacing how_to_use.png)
                                Lottie.asset(
                                  'assets/json/heart_rate.json',
                                  repeat: true,
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
            SizedBox(height: 2.h),
          ],
        );
      },
    );
  }

  // --- Helper camera widget ---
  Widget _buildCameraPreview() {
    // Debug: Print camera state for troubleshooting
    debugPrint(
      '🎥 Camera State: isInitialized=$isInitialized, controller=${cameraController != null}',
    );

    if (!isInitialized || cameraController == null) {
      debugPrint('🎥 Camera not ready - showing placeholder');
      return Container(
        color: Colors.grey[300],
        child: Icon(
          Icons.camera_alt,
          color: Theme.of(context).primaryColor,
          size: 24,
        ),
      );
    }

    // Check if camera is properly initialized and ready
    if (!cameraController!.value.isInitialized) {
      debugPrint('🎥 Camera initializing - showing loading');
      return Container(
        color: Colors.grey[400],
        child: Center(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    // Check for camera errors
    if (cameraController!.value.hasError) {
      debugPrint(
        '❌ Camera has error: ${cameraController!.value.errorDescription}',
      );
      return Container(
        color: Colors.red[100],
        child: Icon(Icons.error_outline, color: Colors.red, size: 20),
      );
    }

    try {
      debugPrint('✅ Showing camera preview');
      return ClipOval(
        child: OverflowBox(
          alignment: Alignment.center,
          child: FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: 48,
              height: 48 * cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),
            ),
          ),
        ),
      );
    } catch (e) {
      debugPrint('❌ Camera preview error: $e');
      return Container(
        color: Colors.black87,
        child: Icon(Icons.camera_alt_outlined, color: Colors.white, size: 20),
      );
    }
  }

  // --- Helper visual widgets ---
}
