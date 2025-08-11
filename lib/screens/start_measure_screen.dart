import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import '../theme/app_theme.dart';

class StartMeasureScreen extends StatefulWidget {
  const StartMeasureScreen({super.key});

  @override
  State<StartMeasureScreen> createState() => _StartMeasureScreenState();
}

class _StartMeasureScreenState extends State<StartMeasureScreen> {
  @override
  void initState() {
    super.initState();
  }

  void _onStartMeasurement() {
    context.push('/heart-rate');
  }

  void _onHowToMeasure() {
    _showHowToMeasureDialog();
  }

  void _onMedicalDisclaimer() {
    _showMedicalDisclaimerDialog();
  }

  void _showHowToMeasureDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'How to measure?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Place your finger on the camera',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              '2. Make sure the flash is on',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              '3. Keep your finger steady',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              '4. Wait for the measurement to complete',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              '5. Avoid movement during measurement',
              style: TextStyle(fontSize: 16.sp),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Got it',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showMedicalDisclaimerDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Medical Disclaimer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This app is for educational and informational purposes only.',
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              'It is not intended to be a substitute for professional medical advice, diagnosis, or treatment.',
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              'Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition.',
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              'The measurements provided by this app may not be accurate and should not be used for medical purposes.',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'I Understand',
              style: TextStyle(
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

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
      body: SafeArea(
        child: Column(
          children: [
            Spacer(),
            // How to measure section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _onHowToMeasure,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'How to measure?',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          padding: EdgeInsets.all(0.5.w),
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor.withValues(alpha: .1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.help_outline,
                            color: AppTheme.primaryColor,
                            size: 20.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            // Start button with Lottie animation
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 1.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Lottie heart button
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Heart Lottie animation
                        Lottie.asset(
                          'assets/json/start_heart.json',
                          height: 50.h,
                          fit: BoxFit.contain,
                          repeat: true,
                          animate: true,
                        ),

                        // Small clickable area in center
                        GestureDetector(
                          onTap: _onStartMeasurement,
                          child: Container(
                            width: 66.w,
                            height: 66.w,
                            color: Colors.transparent,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // START text
                                Text(
                                  'START',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.sp,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 10.0,
                                        color: Colors.black.withValues(
                                          alpha: 0.3,
                                        ),
                                        offset: const Offset(2.0, 2.0),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(height: 0.5.h),

                                // Tap to measure text
                                Text(
                                  'Tap to measure',
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w400,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 8.0,
                                        color: Colors.black.withValues(
                                          alpha: 0.3,
                                        ),
                                        offset: const Offset(1.0, 1.0),
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
                ],
              ),
            ),
            Spacer(),
            // Medical disclaimer section
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _onMedicalDisclaimer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Medical disclaimer',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Container(
                          padding: EdgeInsets.all(0.5.w),
                          decoration: BoxDecoration(
                            color: Colors.grey.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.grey[600],
                            size: 18.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
