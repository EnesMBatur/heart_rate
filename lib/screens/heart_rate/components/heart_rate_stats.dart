import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../viewmodels/heart_rate_view_model.dart';

class HeartRateStats extends StatelessWidget {
  const HeartRateStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HeartRateViewModel>(
      builder: (context, viewModel, child) {
        return FutureBuilder<Map<String, dynamic>>(
          future: viewModel.getStatistics(),
          builder: (context, snapshot) {
            final stats = snapshot.data ?? {};
            final avgHeartRate = stats['avgHeartRate'] ?? 0.0;
            final maxHeartRate = stats['maxHeartRate'] ?? 0.0;
            final minHeartRate = stats['minHeartRate'] ?? 0.0;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${LocaleKeys.general_statistics.tr()} ${viewModel.selectedTimeRange.localizedName}',
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
                      LocaleKeys.general_average.tr(),
                      avgHeartRate.toStringAsFixed(0),
                      LocaleKeys.general_bpm.tr(),
                    ),
                    _buildStatItem(
                      LocaleKeys.general_maximum.tr(),
                      maxHeartRate.toStringAsFixed(0),
                      LocaleKeys.general_bpm.tr(),
                    ),
                    _buildStatItem(
                      LocaleKeys.general_minimum.tr(),
                      minHeartRate.toStringAsFixed(0),
                      LocaleKeys.general_bpm.tr(),
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
