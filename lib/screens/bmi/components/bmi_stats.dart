import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
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
            final currentBMI = vm.getChartData().isNotEmpty
                ? vm.getChartData().last.bmi
                : 0.0;
            final maxBMI = data?['maxBMI'] ?? 0.0;
            final minBMI = data?['minBMI'] ?? 0.0;

            return Column(
              children: [
                // Weight Section
                Container(
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withValues(alpha: 0.1),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.bmi_weight.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatTile(
                            LocaleKeys.general_average.tr(),
                            avgWeight,
                            LocaleKeys.units_kg.tr(),
                          ),
                          _buildStatTile(
                            LocaleKeys.general_maximum.tr(),
                            maxWeight,
                            LocaleKeys.units_kg.tr(),
                          ),
                          _buildStatTile(
                            LocaleKeys.general_minimum.tr(),
                            minWeight,
                            LocaleKeys.units_kg.tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 1.h),

                // BMI Section
                Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        LocaleKeys.bmi_title.tr(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatTile(
                            LocaleKeys.general_current.tr(),
                            currentBMI,
                            '',
                          ),
                          _buildStatTile(
                            LocaleKeys.general_maximum.tr(),
                            maxBMI,
                            '',
                          ),
                          _buildStatTile(
                            LocaleKeys.general_minimum.tr(),
                            minBMI,
                            '',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  Widget _buildStatTile(String label, double value, String unit) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: value.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (unit.isNotEmpty)
                TextSpan(
                  text: ' $unit',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600],
                  ),
                ),
            ],
          ),
        ),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
