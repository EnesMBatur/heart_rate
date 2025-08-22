import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:fl_chart/fl_chart.dart';
import '../viewmodels/heart_rate_view_model.dart';

class HeartRateChart extends StatelessWidget {
  const HeartRateChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HeartRateViewModel>(
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
              child: _buildChart(viewModel),
            ),
          ],
        );
      },
    );
  }

  Widget _buildDateRangeButton(String label, HeartRateViewModel viewModel) {
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

  Widget _buildChart(HeartRateViewModel viewModel) {
    final chartData = viewModel.getChartData();

    if (chartData.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite, size: 64, color: Colors.grey[300]),
            SizedBox(height: 1.h),
            Text(
              'No heart rate data available',
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Heart Rate Trend',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 2.h),
        Expanded(
          child: LineChart(
            LineChartData(
              gridData: FlGridData(
                show: true,
                drawVerticalLine: false,
                horizontalInterval: 20,
                getDrawingHorizontalLine: (value) {
                  return FlLine(color: Colors.grey.shade200, strokeWidth: 1);
                },
              ),
              titlesData: FlTitlesData(
                show: true,
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 30,
                    interval: 1,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      final index = value.toInt();
                      if (index >= 0 && index < chartData.length) {
                        final date = chartData[index].timestamp;
                        return Text(
                          '${date.day}/${date.month}',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
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
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return Text(
                        '${value.toInt()}',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      );
                    },
                    reservedSize: 40,
                  ),
                ),
              ),
              lineTouchData: LineTouchData(
                enabled: true,
                touchTooltipData: LineTouchTooltipData(
                  getTooltipItems: (List<LineBarSpot> touchedSpots) {
                    return touchedSpots.map((LineBarSpot touchedSpot) {
                      final spotIndex = touchedSpot.x.toInt();
                      if (spotIndex >= 0 && spotIndex < chartData.length) {
                        final measurement = chartData[spotIndex];
                        return LineTooltipItem(
                          '${measurement.heartRate} BPM\n${measurement.heartRateCategory}\n${measurement.timestamp.day}/${measurement.timestamp.month} ${measurement.timestamp.hour}:${measurement.timestamp.minute.toString().padLeft(2, '0')}',
                          TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        );
                      }
                      return null;
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
                getTouchedSpotIndicator:
                    (LineChartBarData barData, List<int> spotIndexes) {
                      return spotIndexes.map((spotIndex) {
                        return TouchedSpotIndicatorData(
                          FlLine(
                            color: const Color(0xFFFF6B6B),
                            strokeWidth: 2,
                          ),
                          FlDotData(
                            getDotPainter: (spot, percent, barData, index) =>
                                FlDotCirclePainter(
                                  radius: 6,
                                  color: Colors.white,
                                  strokeWidth: 3,
                                  strokeColor: const Color(0xFFFF6B6B),
                                ),
                          ),
                        );
                      }).toList();
                    },
              ),
              borderData: FlBorderData(
                show: true,
                border: Border.all(color: Colors.grey.shade200, width: 1),
              ),
              minX: 0,
              maxX: (chartData.length - 1).toDouble(),
              minY:
                  (chartData
                              .map((e) => e.heartRate)
                              .reduce((a, b) => a < b ? a : b) -
                          10)
                      .toDouble(),
              maxY:
                  (chartData
                              .map((e) => e.heartRate)
                              .reduce((a, b) => a > b ? a : b) +
                          10)
                      .toDouble(),
              lineBarsData: [
                LineChartBarData(
                  spots: chartData.asMap().entries.map((e) {
                    return FlSpot(
                      e.key.toDouble(),
                      e.value.heartRate.toDouble(),
                    );
                  }).toList(),
                  isCurved: true,
                  color: const Color(0xFFFF6B6B),
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: FlDotData(
                    show: true,
                    getDotPainter: (spot, percent, barData, index) {
                      return FlDotCirclePainter(
                        radius: 4,
                        color: const Color(0xFFFF6B6B),
                        strokeWidth: 2,
                        strokeColor: Colors.white,
                      );
                    },
                  ),
                  belowBarData: BarAreaData(
                    show: true,
                    color: const Color(0xFFFF6B6B).withOpacity(0.1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
