import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../models/blood_oxygen_record.dart';
import '../viewmodels/blood_oxygen_view_model.dart';

class BloodOxygenChart extends StatelessWidget {
  const BloodOxygenChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodOxygenViewModel>(
      builder: (context, vm, child) {
        return Column(
          children: [
            // Date Range Selector
            Container(
              margin: EdgeInsets.only(bottom: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDateRangeButton(TimeRange.today, vm),
                  _buildDateRangeButton(TimeRange.days7, vm),
                  _buildDateRangeButton(TimeRange.days14, vm),
                  _buildDateRangeButton(TimeRange.days30, vm),
                ],
              ),
            ),
            // Chart
            Container(
              height: 50.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withValues(alpha: 0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: _buildChart(vm),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateRangeButton(
    TimeRange timeRange,
    BloodOxygenViewModel viewModel,
  ) {
    final isSelected = viewModel.selectedTimeRange == timeRange;
    return GestureDetector(
      onTap: () => viewModel.setTimeRange(timeRange),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B6B) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          timeRange.localizedName,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildChart(BloodOxygenViewModel vm) {
    final chartData = vm.getChartData();

    if (chartData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.bar_chart, size: 64, color: Colors.grey[300]),
            SizedBox(height: 1.h),
            Text(
              LocaleKeys.blood_oxygen_no_data_available.tr(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[500],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      children: [
        Text(
          LocaleKeys.blood_oxygen_chart_title.tr(),
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 100,
              minY: 0,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 20,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: Colors.grey[300]!, strokeWidth: 1);
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() < chartData.length) {
                        final record = chartData[value.toInt()];
                        return Transform.rotate(
                          angle: -0.5,
                          child: Text(
                            '${record.timestamp.day}/${record.timestamp.month}',
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey[600],
                            ),
                          ),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    interval: 20,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        '${value.toInt()}%',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      );
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: Colors.grey[300]!),
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              barGroups: chartData.asMap().entries.map((entry) {
                final index = entry.key;
                final record = entry.value;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      fromY: 0,
                      toY: record.spO2.toDouble(),
                      width: 8.w,
                      color: record.category.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                );
              }).toList(),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final record = chartData[groupIndex];
                    return BarTooltipItem(
                      '${record.spO2}% SpO2\n${record.category.displayName}\n${record.timestamp.day}/${record.timestamp.month} ${record.timestamp.hour}:${record.timestamp.minute.toString().padLeft(2, '0')}',
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 2.h),
        // Legend
        Wrap(
          spacing: 3.w,
          children: [
            _buildLegendItem(
              LocaleKeys.blood_oxygen_categories_normal.tr(),
              BloodOxygenCategory.normal.color,
            ),
            _buildLegendItem(
              LocaleKeys.blood_oxygen_categories_concerning.tr(),
              BloodOxygenCategory.concerning.color,
            ),
            _buildLegendItem(
              LocaleKeys.blood_oxygen_categories_low.tr(),
              BloodOxygenCategory.low.color,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 3.w,
          height: 1.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          label,
          style: TextStyle(
            fontSize: 13.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
