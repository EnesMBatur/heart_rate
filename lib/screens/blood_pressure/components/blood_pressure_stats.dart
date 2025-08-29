import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../viewmodels/blood_pressure_view_model.dart';

class BloodPressureStats extends StatelessWidget {
  const BloodPressureStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodPressureViewModel>(
      builder: (context, viewModel, child) {
        final stats = viewModel.getStats();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Statistics for ${viewModel.selectedTimeRange}',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[600],
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 2.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  LocaleKeys.blood_pressure_systolic.tr(),
                  stats['systolicAvg'].toString(),
                  'mmHg',
                ),
                _buildStatItem(
                  LocaleKeys.blood_pressure_diastolic.tr(),
                  stats['diastolicAvg'].toString(),
                  'mmHg',
                ),
                _buildStatItem(
                  LocaleKeys.blood_pressure_pulse.tr(),
                  stats['pulseAvg'].toString(),
                  LocaleKeys.health_bpm.tr(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatItem(String label, String value, String unit) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 1.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 24.sp,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          unit,
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
