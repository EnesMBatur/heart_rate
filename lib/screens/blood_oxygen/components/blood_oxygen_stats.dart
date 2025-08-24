import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/blood_oxygen_view_model.dart';

class BloodOxygenStats extends StatelessWidget {
  const BloodOxygenStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodOxygenViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder<Map<String, dynamic>>(
          future: viewModel.stats(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Container(
                height: 15.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(child: CircularProgressIndicator()),
              );
            }

            final stats = snapshot.data!;
            return Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        'Average',
                        '${stats['avgSpO2']}',
                        Icons.show_chart,
                        const Color(0xFF4CAF50),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: _buildStatCard(
                        'Highest',
                        '${stats['maxSpO2']}',
                        Icons.trending_up,
                        const Color(0xFF2196F3),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: _buildStatCard(
                        'Lowest',
                        '${stats['minSpO2']}',
                        Icons.trending_down,
                        const Color(0xFFFF9800),
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            Text(
              '%',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[500],
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
        SizedBox(height: 0.5.h),
        Text(
          title,
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
