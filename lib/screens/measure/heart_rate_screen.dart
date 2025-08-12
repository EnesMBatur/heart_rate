import 'package:flutter/material.dart';
import 'package:heart_rate/screens/measure/modelview/starting_rate_model_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:wakelock_plus/wakelock_plus.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';

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
      body: isInitialized ? _buildMeasurementBody() : _buildLoadingBody(),
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

  // Measurement widget with integrated camera preview
  Widget _buildMeasurementBody() {
    // Phase 1: Show instructions when measuring but finger not detected
    if (viewModel.isMeasuring && !viewModel.isFingerDetected) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final started = viewModel.isMeasuring;
          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: constraints.maxHeight,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.grey.shade200,
                    child: Icon(
                      Icons.favorite,
                      color: Theme.of(context).primaryColor,
                      size: 26,
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Measuring...',
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                      letterSpacing: 0.3,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    'Please put your finger on the camera and flashlight',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 30),
                  _StartRing(started: started, animation: pulseAnimation),
                  const SizedBox(height: 30),
                  _InstructionPhone(),
                ],
              ),
            ),
          );
        },
      );
    }

    // Phase 2: Finger detected & measurement progressing (original rich UI)
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
        const SizedBox(height: 28),
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
          // Background chart only (active measuring phase)
          Positioned.fill(
            child: Image.asset(
              'assets/images/general/bpm_chart.png',
              fit: BoxFit.contain,
            ),
          ),
          // Outer stroke animation (optional decorative)
          Positioned.fill(
            child: Lottie.asset(
              'assets/json/heart_rate.json',
              repeat: true,
              fit: BoxFit.contain,
            ),
          ),
          // Pulsing heart animation (start heart)
          Positioned.fill(
            child: AnimatedBuilder(
              animation: pulseAnimation,
              builder: (context, child) {
                final scale = viewModel.isMeasuring
                    ? pulseAnimation.value
                    : 1.0;
                return Transform.scale(
                  scale: scale,
                  child: Lottie.asset(
                    'assets/json/start_heart.json',
                    repeat: true,
                    fit: BoxFit.contain,
                  ),
                );
              },
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
                  const Text(
                    'bpm',
                    style: TextStyle(
                      fontSize: 16,
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
    return SizedBox(
      width: 280,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 280,
            height: 280,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: SweepGradient(
                colors: [
                  Color(0xFFEDEDED),
                  Color(0xFFF8F8F8),
                  Color(0xFFEDEDED),
                ],
              ),
            ),
          ),
          Container(
            width: 260,
            height: 260,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .06),
                  blurRadius: 14,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 230,
            height: 230,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Lottie.asset(
                  'assets/json/heart_rate.json',
                  repeat: true,
                  fit: BoxFit.contain,
                ),
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
                const Positioned(
                  bottom: 44,
                  child: Column(
                    children: [
                      Text(
                        '--',
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                          shadows: [
                            Shadow(color: Colors.black38, blurRadius: 8),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'bpm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1.2,
                          color: Colors.white,
                          shadows: [
                            Shadow(color: Colors.black38, blurRadius: 6),
                          ],
                        ),
                      ),
                    ],
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

class _InstructionPhone extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/general/bpm_chart.png',
              fit: BoxFit.cover,
              color: Colors.red.withValues(alpha: .08),
              colorBlendMode: BlendMode.srcATop,
            ),
          ),
          Image.asset(
            'assets/images/general/how_to_use.png',
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
