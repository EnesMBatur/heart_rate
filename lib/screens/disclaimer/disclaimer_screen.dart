import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8F9FA),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(LocaleKeys.disclaimer_title.tr()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_medical_disclaimer.tr(),
              content: LocaleKeys.disclaimer_medical_disclaimer_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_accuracy_title.tr(),
              content: LocaleKeys.disclaimer_accuracy_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_not_medical_device.tr(),
              content: LocaleKeys.disclaimer_not_medical_device_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_consultation_title.tr(),
              content: LocaleKeys.disclaimer_consultation_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_emergency_title.tr(),
              content: LocaleKeys.disclaimer_emergency_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_privacy_title.tr(),
              content: LocaleKeys.disclaimer_privacy_content.tr(),
            ),
            SizedBox(height: 2.h),
            _buildSection(
              context,
              title: LocaleKeys.disclaimer_liability_title.tr(),
              content: LocaleKeys.disclaimer_liability_content.tr(),
            ),
            SizedBox(height: 2.h),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B6B).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xFFFF6B6B).withValues(alpha: 0.3),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    LocaleKeys.disclaimer_important_notice.tr(),
                    style: TextStyle(
                      fontSize: Device.screenType == ScreenType.tablet
                          ? 20
                          : 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFFFF6B6B),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    LocaleKeys.disclaimer_important_notice_content.tr(),
                    style: TextStyle(
                      fontSize: Device.screenType == ScreenType.tablet
                          ? 16
                          : 14,
                      color: Colors.grey[700],
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 4.h),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required String content,
  }) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: Device.screenType == ScreenType.tablet ? 18 : 16,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            content,
            style: TextStyle(
              fontSize: Device.screenType == ScreenType.tablet ? 16 : 14,
              color: Colors.grey[700],
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
