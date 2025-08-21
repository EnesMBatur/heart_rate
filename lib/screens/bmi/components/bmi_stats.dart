import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/bmi_view_model.dart';

class BMIStats extends StatelessWidget {
  const BMIStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIViewModel>(
      builder: (context, vm, child) {
        return FutureBuilder<Map<String, dynamic>>(
          future: vm.stats(),
          builder: (context, snapshot) {
            final data = snapshot.data;
            final avgWeight = data?['avgWeight'] ?? 0.0;
            final maxWeight = data?['maxWeight'] ?? 0.0;
            final minWeight = data?['minWeight'] ?? 0.0;
            final avgBMI = data?['avgBMI'] ?? 0.0;

            return Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _tile('Average', avgWeight),
                      _tile('Maximum', maxWeight),
                      _tile('Minimum', minWeight),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _tile('BMI', avgBMI),
                      const SizedBox(width: 16),
                      const SizedBox(width: 16),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _tile(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value.toStringAsFixed(1),
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 0.3.h),
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
