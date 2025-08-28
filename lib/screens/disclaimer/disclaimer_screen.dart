import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        title: Text(
          'Disclaimer',
          style: TextStyle(
            color: Colors.black,
            fontSize: Device.screenType == ScreenType.tablet ? 24 : 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSection(
              context,
              title: 'Medical Disclaimer',
              content:
                  'This application is designed for informational and educational purposes only. It is not intended to provide medical advice, diagnosis, or treatment. The health measurements and data provided by this app should not be used as a substitute for professional medical consultation, diagnosis, or treatment.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Accuracy of Measurements',
              content:
                  'While we strive to provide accurate health measurements, the results may vary due to various factors including device limitations, user conditions, and environmental factors. Always consult with a healthcare professional for accurate medical measurements and interpretations.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Not a Medical Device',
              content:
                  'This application and any measurements it provides are not certified medical devices. They should not be relied upon for medical decisions. For accurate medical measurements, please use proper medical equipment under the supervision of healthcare professionals.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Consultation Recommendation',
              content:
                  'Always seek the advice of your physician or other qualified health provider with any questions you may have regarding a medical condition. Never disregard professional medical advice or delay in seeking it because of something you have read or measured using this application.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Emergency Situations',
              content:
                  'In case of a medical emergency, immediately contact your local emergency services. Do not rely on this application for emergency medical situations.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Data Privacy',
              content:
                  'Your health data is stored locally on your device. We are committed to protecting your privacy and do not share your personal health information with third parties without your explicit consent.',
            ),
            SizedBox(height: 3.h),
            _buildSection(
              context,
              title: 'Limitation of Liability',
              content:
                  'The developers of this application shall not be liable for any direct, indirect, incidental, special, or consequential damages arising from the use of this application or reliance on its measurements.',
            ),
            SizedBox(height: 4.h),
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
                    'Important Notice',
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
                    'By using this application, you acknowledge that you have read, understood, and agreed to this disclaimer. You understand that this app is not a substitute for professional medical care and that you should consult with a healthcare provider for any health concerns.',
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
