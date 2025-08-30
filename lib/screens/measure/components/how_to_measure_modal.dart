import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../theme/app_theme.dart';

class HowToMeasureModal extends StatelessWidget {
  const HowToMeasureModal({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const HowToMeasureModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85.h,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: 2.h),
            width: 12.w,
            height: 0.5.h,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),

          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
            child: Text(
              LocaleKeys.how_to_measure_title.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ),

          // PNG Illustration
          SizedBox(
            height: 18.h,
            child: Image.asset(
              'assets/images/general/how_to_use.png', // PNG olarak değiştirdik
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) {
                return _buildFallbackIcon();
              },
            ),
          ),

          SizedBox(height: 2.h),

          // Instructions
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                children: [
                  // Instructions list
                  Expanded(
                    child: ListView(
                      children: [
                        _buildInstructionStep(
                          '1',
                          LocaleKeys.how_to_measure_instructions_1.tr(),
                          LocaleKeys.how_to_measure_instructions_1_text.tr(),
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '2',
                          LocaleKeys.how_to_measure_instructions_2.tr(),
                          LocaleKeys.how_to_measure_instructions_2_text.tr(),
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '3',
                          LocaleKeys.how_to_measure_instructions_3.tr(),
                          LocaleKeys.how_to_measure_instructions_3_text.tr(),
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '4',
                          LocaleKeys.how_to_measure_instructions_4.tr(),
                          LocaleKeys.how_to_measure_instructions_4_text.tr(),
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '5',
                          LocaleKeys.how_to_measure_instructions_5.tr(),
                          LocaleKeys.how_to_measure_instructions_5_text.tr(),
                        ),
                        SizedBox(height: 6.h),
                      ],
                    ),
                  ),

                  // Got it button
                  // Padding(
                  //   padding: EdgeInsets.only(
                  //     bottom:
                  //         MediaQuery.of(context).viewInsets.bottom +
                  //         MediaQuery.of(context).padding.bottom +
                  //         2.h,
                  //   ),
                  //   child: SizedBox(
                  //     width: double.infinity,
                  //     child: ElevatedButton(
                  //       onPressed: () => Navigator.of(context).pop(),
                  //       style: ElevatedButton.styleFrom(
                  //         backgroundColor: AppTheme.primaryColor,
                  //         padding: EdgeInsets.symmetric(vertical: 2.h),
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(12),
                  //         ),
                  //       ),
                  //       child: Text(
                  //         LocaleKeys.actions_ok.tr(),
                  //         style: TextStyle(
                  //           fontSize: 16.sp,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.white,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInstructionStep(String number, String title, String subtitle) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Step number
        Container(
          width: 8.w,
          height: 8.w,
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              number,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ),

        SizedBox(width: 4.w),

        // Content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 0.5.h),
              Text(
                subtitle,
                style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFallbackIcon() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.camera_alt_outlined,
            size: 48,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(height: 8),
          Text(
            'Place finger on camera with flash',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
