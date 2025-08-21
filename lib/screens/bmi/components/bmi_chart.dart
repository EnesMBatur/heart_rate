import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import '../viewmodels/bmi_view_model.dart';

class BMIChart extends StatelessWidget {
  const BMIChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            // Date Range Selector
            Container(
              margin: EdgeInsets.only(bottom: 2.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildDateRangeButton('Today', viewModel),
                  _buildDateRangeButton('7 Days', viewModel),
                  _buildDateRangeButton('14 Days', viewModel),
                  _buildDateRangeButton('30 Days', viewModel),
                ],
              ),
            ),

            // Weight Chart
            Container(
              height: 25.h,
              margin: EdgeInsets.only(bottom: 2.h),
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
              child: _buildWeightChart(viewModel),
            ),

            // BMI Chart
            Container(
              height: 25.h,
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
              child: _buildBMIChart(viewModel),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateRangeButton(String label, BMIViewModel viewModel) {
    final isSelected = viewModel.selectedTimeRange == label;
    return GestureDetector(
      onTap: () => viewModel.setTimeRange(label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.8.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B6B) : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  Widget _buildWeightChart(BMIViewModel viewModel) {
    final chartData = viewModel.getChartData();

    if (chartData.isEmpty) {
      return _buildEmptyChart('Weight (kg)');
    }

    return Column(
      children: [
        Text(
          'Weight (kg)',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 1.h),
        Expanded(
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY:
                  chartData
                      .map((e) => e.weightKg)
                      .reduce((a, b) => a > b ? a : b) +
                  10,
              minY:
                  chartData
                      .map((e) => e.weightKg)
                      .reduce((a, b) => a < b ? a : b) -
                  10,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 10,
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
                        return Text(
                          '${record.timestamp.day}/${record.timestamp.month}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
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
                    interval: 10,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
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
              borderData: FlBorderData(show: false),
              barGroups: chartData.asMap().entries.map((entry) {
                return BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.weightKg,
                      color: const Color(0xFFFF6B6B),
                      width: 16,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBMIChart(BMIViewModel viewModel) {
    final chartData = viewModel.getChartData();

    if (chartData.isEmpty) {
      return _buildEmptyChart('BMI');
    }

    return Column(
      children: [
        Text(
          'BMI',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
          ),
        ),
        SizedBox(height: 1.h),
        Expanded(
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 40,
              minY: 15,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 5,
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
                        return Text(
                          '${record.timestamp.day}/${record.timestamp.month}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            color: Colors.grey[600],
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
                    interval: 5,
                    getTitlesWidget: (value, meta) {
                      return Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          fontSize: 10.sp,
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
              borderData: FlBorderData(show: false),
              barGroups: chartData.asMap().entries.map((entry) {
                final bmi = entry.value.bmi;
                Color barColor = const Color(0xFF4CAF50); // Normal

                if (bmi < 18.5) {
                  barColor = const Color(0xFF2196F3); // Underweight
                } else if (bmi >= 25 && bmi < 30) {
                  barColor = const Color(0xFFFFC107); // Overweight
                } else if (bmi >= 30) {
                  barColor = const Color(0xFFF44336); // Obese
                }

                return BarChartGroupData(
                  x: entry.key,
                  barRods: [
                    BarChartRodData(
                      toY: bmi,
                      color: barColor,
                      width: 16,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ],
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyChart(String title) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.bar_chart, size: 64, color: Colors.grey[300]),
          SizedBox(height: 1.h),
          Text(
            'No data available for selected period',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey[500],
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontSize: 16.sp, color: Colors.grey[400]),
          ),
        ],
      ),
    );
  }
}
