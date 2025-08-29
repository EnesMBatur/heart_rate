import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/blood_sugar_view_model.dart';

class BloodSugarStats extends StatelessWidget {
  const BloodSugarStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodSugarViewModel>(
      builder: (context, viewModel, child) {
        final data = viewModel.measurements;
        double avg = 0.0;
        double max = 0.0;
        double min = 0.0;

        if (data.isNotEmpty) {
          double sum = 0.0;
          max = data.first.value;
          min = data.first.value;
          for (final m in data) {
            sum += m.value;
            if (m.value > max) max = m.value;
            if (m.value < min) min = m.value;
          }
          avg = sum / data.length;
        }

        return Row(
          children: [
            Expanded(
              child: _buildStatCard(
                value: avg.toStringAsFixed(1),
                label: LocaleKeys.general_average.tr(),
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: _buildStatCard(
                value: max.toStringAsFixed(1),
                label: LocaleKeys.general_maximum.tr(),
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: _buildStatCard(
                value: min.toStringAsFixed(1),
                label: LocaleKeys.general_minimum.tr(),
              ),
            ),
          ],
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
