import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/blood_sugar_view_model.dart';

class BloodSugarStats extends StatelessWidget {
  const BloodSugarStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodSugarViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder<Map<String, dynamic>>(
          future: viewModel.getStatistics(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            final stats =
                snapshot.data ??
                {'average': 0.0, 'maximum': 0.0, 'minimum': 0.0};

            return Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    value: stats['average'].toStringAsFixed(1),
                    label: 'Average',
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: _buildStatCard(
                    value: stats['maximum'].toStringAsFixed(1),
                    label: 'Maximum',
                  ),
                ),
                SizedBox(width: 4.w),
                Expanded(
                  child: _buildStatCard(
                    value: stats['minimum'].toStringAsFixed(1),
                    label: 'Minimum',
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatCard({required String value, required String label}) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[500],
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
