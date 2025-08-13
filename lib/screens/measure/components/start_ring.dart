import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StartRing extends StatelessWidget {
  final bool started;
  final Animation<double> animation;
  final int? heartRate;

  const StartRing({
    super.key,
    required this.started,
    required this.animation,
    this.heartRate,
  });

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
                  heartRate != null && heartRate! > 0 ? '$heartRate' : '--',
                  style: TextStyle(
                    fontSize: 25.sp, // Match start_measure_screen
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
                    fontSize: 16.sp, // Match start_measure_screen
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
