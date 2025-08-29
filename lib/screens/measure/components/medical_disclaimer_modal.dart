import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../theme/app_theme.dart';

class MedicalDisclaimerModal extends StatelessWidget {
  const MedicalDisclaimerModal({super.key});

  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const MedicalDisclaimerModal(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
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

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.h),

                  // Title with warning icon
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.orange,
                        size: 28.sp,
                      ),
                      SizedBox(width: 3.w),
                      Text(
                        LocaleKeys.disclaimer_medical_disclaimer.tr(),
                        style: TextStyle(
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.primaryColor,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.h),

                  // Disclaimer content
                  Expanded(
                    child: ListView(
                      children: [
                        _buildDisclaimerPoint(
                          Icons.info_outline,
                          LocaleKeys.medical_disclaimer_instructions_1.tr(),
                          LocaleKeys.medical_disclaimer_instructions_1_text
                              .tr(),
                          Colors.blue,
                        ),

                        SizedBox(height: 2.h),

                        _buildDisclaimerPoint(
                          Icons.medical_services_outlined,
                          LocaleKeys.medical_disclaimer_instructions_2.tr(),
                          LocaleKeys.medical_disclaimer_instructions_2_text
                              .tr(),
                          Colors.orange,
                        ),

                        SizedBox(height: 2.h),

                        _buildDisclaimerPoint(
                          Icons.local_hospital_outlined,
                          LocaleKeys.medical_disclaimer_instructions_3.tr(),
                          LocaleKeys.medical_disclaimer_instructions_3_text
                              .tr(),
                          Colors.green,
                        ),

                        SizedBox(height: 2.h),

                        _buildDisclaimerPoint(
                          Icons.error_outline,
                          LocaleKeys.medical_disclaimer_instructions_4.tr(),
                          LocaleKeys.medical_disclaimer_instructions_4_text
                              .tr(),
                          Colors.red,
                        ),

                        SizedBox(height: 2.h),

                        _buildDisclaimerPoint(
                          Icons.security_outlined,
                          LocaleKeys.medical_disclaimer_instructions_5.tr(),
                          LocaleKeys.medical_disclaimer_instructions_5_text
                              .tr(),
                          Colors.purple,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  // I Understand button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () => Navigator.of(context).pop(),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppTheme.primaryColor,
                  //       padding: EdgeInsets.symmetric(vertical: 2.h),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(12),
                  //       ),
                  //     ),
                  //     child: Text(
                  //       'I Understand',
                  //       style: TextStyle(
                  //         fontSize: 16.sp,
                  //         fontWeight: FontWeight.bold,
                  //         color: Colors.white,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 6.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDisclaimerPoint(
    IconData icon,
    String title,
    String description,
    Color iconColor,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Container(
          width: 10.w,
          height: 10.w,
          decoration: BoxDecoration(
            color: iconColor.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(icon, color: iconColor, size: 20.sp),
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
                description,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
