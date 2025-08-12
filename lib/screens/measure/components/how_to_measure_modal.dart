import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
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
              'How to measure?',
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryColor,
              ),
            ),
          ),

          // PNG Illustration
          SizedBox(
            height: 20.h,
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
                          'Place your finger on the camera with flash',
                          'Cover the rear camera completely with your finger and ensure flash is enabled',
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '2',
                          'Make sure the flash is on',
                          'The flashlight will illuminate your finger',
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '3',
                          'Keep your finger steady',
                          'Avoid any movement during measurement',
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '4',
                          'Wait for completion',
                          'The measurement takes about 15-30 seconds',
                        ),
                        SizedBox(height: 2.h),
                        _buildInstructionStep(
                          '5',
                          'Stay calm and breathe normally',
                          'Relax to get the most accurate reading',
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  // Got it button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Got it!',
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),
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
