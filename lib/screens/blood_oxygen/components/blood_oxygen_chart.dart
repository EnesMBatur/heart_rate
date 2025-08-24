import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../../models/blood_oxygen_record.dart';
import '../viewmodels/blood_oxygen_view_model.dart';
import 'package:intl/intl.dart';

class BloodOxygenChart extends StatelessWidget {
  const BloodOxygenChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodOxygenViewModel>(
      builder: (context, vm, child) {
        final chartData = vm.getChartData();

        if (chartData.isEmpty) {
          return Container(
            height: 30.h,
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
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.show_chart, size: 48, color: Colors.grey[400]),
                  SizedBox(height: 1.h),
                  Text(
                    'No data available for selected period',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return Container(
          padding: EdgeInsets.all(5.w),
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SpO2 Trend',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 2.h),
              SizedBox(
                height: 25.h,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceAround,
                    maxY: 100,
                    minY: 0,
                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) =>
                            Colors.grey[800]!.withOpacity(0.8),
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final record = chartData[groupIndex];
                          return BarTooltipItem(
                            'SpO2: ${record.spO2}%\n'
                            'Category: ${record.category.displayName}\n'
                            'Date: ${DateFormat('MMM dd').format(record.timestamp)}',
                            TextStyle(
                              color: Colors.white,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          );
                        },
                      ),
                    ),
                    titlesData: FlTitlesData(
                      show: true,
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            if (value.toInt() >= 0 &&
                                value.toInt() < chartData.length) {
                              final record = chartData[value.toInt()];
                              return Padding(
                                padding: EdgeInsets.only(top: 1.h),
                                child: Text(
                                  DateFormat('M/d').format(record.timestamp),
                                  style: TextStyle(
                                    fontSize: 10.sp,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              );
                            }
                            return const Text('');
                          },
                          reservedSize: 3.h,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            return Text(
                              '${value.toInt()}%',
                              style: TextStyle(
                                fontSize: 10.sp,
                                color: Colors.grey[600],
                              ),
                            );
                          },
                          reservedSize: 6.w,
                          interval: 20,
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
                        bottom: BorderSide(color: Colors.grey[300]!, width: 1),
                        left: BorderSide(color: Colors.grey[300]!, width: 1),
                      ),
                    ),
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 20,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(color: Colors.grey[200]!, strokeWidth: 1);
                      },
                      drawVerticalLine: false,
                    ),
                    barGroups: chartData.asMap().entries.map((entry) {
                      final index = entry.key;
                      final record = entry.value;
                      return BarChartGroupData(
                        x: index,
                        barRods: [
                          BarChartRodData(
                            toY: record.spO2.toDouble(),
                            color: record.category.color,
                            width: 3.w,
                            borderRadius: BorderRadius.circular(4),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: 100,
                              color: Colors.grey[200]!,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(height: 2.h),

              // Legend
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildLegendItem(
                    'Normal (95-100%)',
                    BloodOxygenCategory.normal.color,
                  ),
                  _buildLegendItem(
                    'Concerning (90-94%)',
                    BloodOxygenCategory.concerning.color,
                  ),
                  _buildLegendItem(
                    'Low (0-89%)',
                    BloodOxygenCategory.low.color,
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLegendItem(String text, Color color) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        SizedBox(width: 1.w),
        Text(
          text,
          style: TextStyle(fontSize: 10.sp, color: Colors.grey[600]),
        ),
      ],
    );
  }
}
