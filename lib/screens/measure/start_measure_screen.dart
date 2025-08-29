import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../theme/app_theme.dart';
import '../../locale/lang/locale_keys.g.dart';
import 'components/how_to_measure_modal.dart';
import 'components/medical_disclaimer_modal.dart';

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
    HowToMeasureModal.show(context);
  }

  void _onMedicalDisclaimer() {
    MedicalDisclaimerModal.show(context);
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
          LocaleKeys.health_measure.tr(),
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
            // Top section - responsive height (20% of screen) - match heart_rate_screen
            Expanded(
              flex: 2, // Reduced from 3 to match heart_rate_screen ratio
              child: Container(
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
                            LocaleKeys.measure_how.tr(),
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
                              color: AppTheme.primaryColor.withValues(
                                alpha: .1,
                              ),
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
            ),

            // Heart animation section - responsive height (60% of screen) - match heart_rate_screen
            Expanded(
              flex: 6, // Increased from 4 to match heart_rate_screen ratio
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Lottie heart button - uses full flex space
                    Expanded(
                      child: Center(
                        child: AspectRatio(
                          aspectRatio: 1.0, // Keep square aspect ratio
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Heart Lottie animation
                              Lottie.asset(
                                'assets/json/start_heart.json',
                                fit: BoxFit.contain,
                                repeat: true,
                                animate: true,
                              ),

                              // Small clickable area in center
                              GestureDetector(
                                onTap: _onStartMeasurement,
                                child: Container(
                                  width: 55
                                      .w, // Reduced from 66.w for smaller screens
                                  height: 55
                                      .w, // Reduced from 66.w for smaller screens
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // START text
                                      Text(
                                        LocaleKeys.measure_Start.tr(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24.sp, // Reduced from 24.sp
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

                                      SizedBox(
                                        height: 0.3.h,
                                      ), // Reduced spacing
                                      // Tap to measure text
                                      Text(
                                        LocaleKeys.measure_tap.tr(),
                                        style: TextStyle(
                                          color: Colors.white.withValues(
                                            alpha: 0.9,
                                          ),
                                          fontSize: 14.sp, // Reduced from 14.sp
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
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom section - responsive height (20% of screen) - match heart_rate_screen
            Expanded(
              flex: 2, // Reduced from 3 to match heart_rate_screen ratio
              child: Container(
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
                            LocaleKeys.disclaimer_medical_disclaimer.tr(),
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
            ),
          ],
        ),
      ),
    );
  }
}
