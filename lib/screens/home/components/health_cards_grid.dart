import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HealthCardsGrid extends StatelessWidget {
  final int heartRateRecords;
  final int bloodPressureRecords;
  final int bloodSugarRecords;
  final int weightBmiRecords;
  final VoidCallback? onHeartRatePressed;
  final VoidCallback? onBloodPressurePressed;
  final VoidCallback? onBloodSugarPressed;
  final VoidCallback? onWeightBmiPressed;
  final VoidCallback? onAiDoctorPressed;

  const HealthCardsGrid({
    super.key,
    required this.heartRateRecords,
    required this.bloodPressureRecords,
    required this.bloodSugarRecords,
    required this.weightBmiRecords,
    this.onHeartRatePressed,
    this.onBloodPressurePressed,
    this.onBloodSugarPressed,
    this.onWeightBmiPressed,
    this.onAiDoctorPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Main Heart Rate Card
        _buildMainHeartRateCard(),

        const SizedBox(height: 16),

        // Secondary cards grid
        Row(
          children: [
            Expanded(
              child: _buildSecondaryCard(
                title: 'Blood Pressure',
                records: '$bloodPressureRecords records',
                imagePath: 'assets/images/home/blood_pressure.png',
                backgroundColor: const Color(0xFFE3F2FD),
                onPressed: onBloodPressurePressed,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSecondaryCard(
                title: 'Blood Sugar',
                records: '$bloodSugarRecords records',
                imagePath: 'assets/images/home/blood_sugar.png',
                backgroundColor: const Color(0xFFF3E5F5),
                onPressed: onBloodSugarPressed,
              ),
            ),
          ],
        ),

        const SizedBox(height: 12),

        // Third row
        Row(
          children: [
            Expanded(
              child: _buildSecondaryCard(
                title: 'Weight & BMI',
                records: '$weightBmiRecords records',
                imagePath: 'assets/images/home/bmi.png',
                backgroundColor: const Color(0xFFFFF8E1),
                onPressed: onWeightBmiPressed,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildSecondaryCard(
                title: 'AI Doctor',
                records: 'Chat with AI doctor',
                imagePath: 'assets/images/home/ai_doctor.png',
                backgroundColor: const Color(0xFFE8F5E8),
                onPressed: onAiDoctorPressed,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainHeartRateCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFFFE5E5), Color(0xFFFFF0F0)],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Heart Rate',
                  style: TextStyle(
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '$heartRateRecords records',
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF6B6B),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: GestureDetector(
                    onTap: onHeartRatePressed,
                    child: Text(
                      'Measure',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 16),

          // Heart Rate Image
          SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(
              'assets/images/home/heart_rate.png',
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSecondaryCard({
    required String title,
    required String records,
    required String imagePath,
    required Color backgroundColor,
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              records,
              style: TextStyle(fontSize: 11.sp, color: Colors.black54),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: 40,
              height: 40,
              child: Image.asset(imagePath, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}
