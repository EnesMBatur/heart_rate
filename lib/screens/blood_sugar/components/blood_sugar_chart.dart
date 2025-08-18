import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import '../viewmodels/blood_sugar_view_model.dart';

class BloodSugarChart extends StatelessWidget {
  const BloodSugarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodSugarViewModel>(
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
            // Chart
            Container(
              height: 40.h,
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: _buildChart(viewModel),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateRangeButton(String label, BloodSugarViewModel viewModel) {
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

  Widget _buildChart(BloodSugarViewModel viewModel) {
    final chartData = viewModel.getChartData();

    if (chartData.isEmpty) {
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
          ],
        ),
      );
    }

    return Column(
      children: [
        Text(
          'Blood Sugar (mg/dL)',
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
              maxY: 200,
              minY: 50,
              gridData: FlGridData(
                show: true,
                drawHorizontalLine: true,
                drawVerticalLine: false,
                horizontalInterval: 25,
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
                        final measurement = chartData[value.toInt()];
                        return Transform.rotate(
                          angle: -0.5,
                          child: Text(
                            '${measurement.timestamp.day}/${measurement.timestamp.month}',
                            style: TextStyle(
                              fontSize: 8.sp,
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
                    interval: 25,
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
              borderData: FlBorderData(
                show: true,
                border: Border(
                  left: BorderSide(color: Colors.grey[300]!),
                  bottom: BorderSide(color: Colors.grey[300]!),
                ),
              ),
              barGroups: chartData.asMap().entries.map((entry) {
                final index = entry.key;
                final measurement = entry.value;

                return BarChartGroupData(
                  x: index,
                  barRods: [
                    BarChartRodData(
                      fromY: 50,
                      toY: measurement.value,
                      width: 8.w,
                      color: measurement.category.color,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ],
                );
              }).toList(),
              barTouchData: BarTouchData(
                enabled: true,
                touchTooltipData: BarTouchTooltipData(
                  getTooltipItem: (group, groupIndex, rod, rodIndex) {
                    final measurement = chartData[groupIndex];
                    return BarTooltipItem(
                      '${measurement.value.toStringAsFixed(1)} mg/dL\n${measurement.state.displayName}\n${measurement.timestamp.day}/${measurement.timestamp.month} ${measurement.timestamp.hour}:${measurement.timestamp.minute.toString().padLeft(2, '0')}',
                      TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.sp,
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
            _buildLegendItem('Low', const Color(0xFF4ECDC4)),
            _buildLegendItem('Normal', const Color(0xFF45B7D1)),
            _buildLegendItem('Pre-diabetes', const Color(0xFFFF9500)),
            _buildLegendItem('Diabetes', const Color(0xFFFF6B6B)),
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
            fontSize: 10.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
