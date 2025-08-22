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
        final chartData = viewModel.getChartData();

        return Column(
          children: [
            // Date Range Selector
            _buildDateRangeSelector(viewModel),

            // SizedBox(height: 1.h),

            // Weight Chart
            if (chartData.isNotEmpty) _buildWeightChart(chartData),

            SizedBox(height: 2.h),

            // Modern BMI Visualizer
            _buildModernBMIVisualizer(chartData),
          ],
        );
      },
    );
  }

  Widget _buildDateRangeSelector(BMIViewModel viewModel) {
    return Container(
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
    );
  }

  Widget _buildDateRangeButton(String label, BMIViewModel viewModel) {
    final isSelected = viewModel.selectedTimeRange == label;

    return GestureDetector(
      onTap: () => viewModel.setTimeRange(label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B6B) : Colors.transparent,
          borderRadius: BorderRadius.circular(2.w),
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

  Widget _buildModernBMIVisualizer(List chartData) {
    final currentBMI = chartData.isNotEmpty ? chartData.last.bmi : 22.0;

    return Container(
      padding: EdgeInsets.all(6.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Colors.grey.shade50],
        ),
        borderRadius: BorderRadius.circular(4.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          // Current BMI Display
          _buildCurrentBMIDisplay(currentBMI),

          SizedBox(height: 2.h),

          // BMI Scale Indicator
          _buildBMIScaleIndicator(currentBMI),

          SizedBox(height: 2.h),

          // Category Labels
          _buildCategoryLabels(currentBMI),
        ],
      ),
    );
  }

  Widget _buildCurrentBMIDisplay(double currentBMI) {
    final category = _getBMICategory(currentBMI);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Current BMI',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade800,
          ),
        ),
        SizedBox(height: 1.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              currentBMI.toStringAsFixed(1),
              style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: category['color'] as Color,
              ),
            ),
            SizedBox(width: 2.w),
            Text(
              'kg/m²',
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 1.h),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: (category['color'] as Color).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(2.w),
              border: Border.all(
                color: (category['color'] as Color).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            child: Text(
              category['name'] as String,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: category['color'] as Color,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBMIScaleIndicator(double currentBMI) {
    return Column(
      children: [
        // Scale Bar
        Container(
          height: 2.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(1.5.h)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(1.5.h),
            child: Row(
              children: [
                // Very Severe Underweight: 10-16 (6 units)
                Expanded(
                  flex: 60, // 6 out of 40 total units
                  child: Container(color: const Color(0xFF1976D2)),
                ),
                // Severe Underweight: 16-17 (1 unit)
                Expanded(
                  flex: 10, // 1 out of 40
                  child: Container(color: const Color(0xFF42A5F5)),
                ),
                // Underweight: 17-18.5 (1.5 units)
                Expanded(
                  flex: 15, // 1.5 out of 40
                  child: Container(color: const Color(0xFF26C6DA)),
                ),
                // Normal: 18.5-25 (6.5 units)
                Expanded(
                  flex: 65, // 6.5 out of 40
                  child: Container(color: const Color(0xFF4CAF50)),
                ),
                // Overweight: 25-30 (5 units)
                Expanded(
                  flex: 50, // 5 out of 40
                  child: Container(color: const Color(0xFFFFC107)),
                ),
                // Obese Class I: 30-35 (5 units)
                Expanded(
                  flex: 50, // 5 out of 40
                  child: Container(color: const Color(0xFFFF9800)),
                ),
                // Obese Class II: 35-40 (5 units)
                Expanded(
                  flex: 50, // 5 out of 40
                  child: Container(color: const Color(0xFFF44336)),
                ),
                // Obese Class III: 40-50 (10 units)
                Expanded(
                  flex: 100, // 10 out of 40
                  child: Container(color: const Color(0xFFD32F2F)),
                ),
              ],
            ),
          ),
        ),

        SizedBox(height: 1.h),

        // Indicator Pointer
        _buildBMIPointer(currentBMI),

        SizedBox(height: 1.h),

        // Scale Numbers
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildScaleNumber('10'),
            _buildScaleNumber('16'),
            _buildScaleNumber('17'),
            _buildScaleNumber('18.5'),
            _buildScaleNumber('25'),
            _buildScaleNumber('30'),
            _buildScaleNumber('35'),
            _buildScaleNumber('40'),
            _buildScaleNumber('50'),
          ],
        ),
      ],
    );
  }

  Widget _buildBMIPointer(double currentBMI) {
    // Calculate position (10-50 range mapped to 0-1)
    const double minBMI = 10.0;
    const double maxBMI = 50.0;

    // Clamp BMI to visible range but allow some overflow for edge cases
    final clampedBMI = currentBMI.clamp(minBMI, maxBMI);
    final position = (clampedBMI - minBMI) / (maxBMI - minBMI);

    // Ensure pointer stays within screen bounds
    final leftPosition = (position * (100.w - 12.w)).clamp(0.0, 100.w - 12.w);

    return Stack(
      children: [
        SizedBox(height: 2.h, width: double.infinity),
        AnimatedPositioned(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOutCubic,
          left: leftPosition - 2.w,
          child: Column(
            children: [
              Container(
                width: 4.w,
                height: 4.w,
                decoration: BoxDecoration(
                  color: _getBMICategory(currentBMI)['color'] as Color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
              Container(
                width: 2,
                height: 1.h,
                color: _getBMICategory(currentBMI)['color'] as Color,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildScaleNumber(String number) {
    return Text(
      number,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.grey.shade600,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildCategoryLabels(double currentBMI) {
    final categories = [
      {
        'name': 'Very Severe Underweight',
        'color': const Color(0xFF1976D2),
        'range': 'BMI < 16.0',
      },
      {
        'name': 'Severe Underweight',
        'color': const Color(0xFF42A5F5),
        'range': 'BMI 16.0 - 16.9',
      },
      {
        'name': 'Underweight',
        'color': const Color(0xFF26C6DA),
        'range': 'BMI 17.0 - 18.4',
      },
      {
        'name': 'Normal',
        'color': const Color(0xFF4CAF50),
        'range': 'BMI 18.5 - 24.9',
      },
      {
        'name': 'Overweight',
        'color': const Color(0xFFFFC107),
        'range': 'BMI 25.0 - 29.9',
      },
      {
        'name': 'Obese Class I',
        'color': const Color(0xFFFF9800),
        'range': 'BMI 30.0 - 34.9',
      },
      {
        'name': 'Obese Class II',
        'color': const Color(0xFFF44336),
        'range': 'BMI 35.0 - 39.9',
      },
      {
        'name': 'Obese Class III',
        'color': const Color(0xFFD32F2F),
        'range': 'BMI ≥ 40.0',
      },
    ];

    return Column(
      children: categories.map((category) {
        final isCurrentCategory =
            _getBMICategory(currentBMI)['name'] == category['name'];
        final categoryColor = category['color'] as Color;
        final categoryName = category['name'] as String;
        final categoryRange = category['range'] as String;

        return Container(
          margin: EdgeInsets.only(bottom: 1.h),
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: isCurrentCategory
                ? categoryColor.withOpacity(0.1)
                : Colors.grey.shade50,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isCurrentCategory ? categoryColor : Colors.grey.shade200,
              width: isCurrentCategory ? 2 : 1,
            ),
          ),
          child: Row(
            children: [
              Container(
                width: 14,
                height: 14,
                decoration: BoxDecoration(
                  color: categoryColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      categoryName,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: isCurrentCategory
                            ? categoryColor
                            : Colors.black87,
                      ),
                    ),
                    Text(
                      categoryRange,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey.shade600,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              if (isCurrentCategory) ...[
                Icon(Icons.check_circle, color: categoryColor, size: 20),
              ],
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildWeightChart(List chartData) {
    return Container(
      height: 40.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4.w),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Weight Trend',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          SizedBox(height: 2.h),
          Expanded(
            child: LineChart(
              LineChartData(
                lineTouchData: LineTouchData(
                  enabled: true,
                  touchTooltipData: LineTouchTooltipData(
                    // getTooltipColor: (LineBarSpot spot) => Colors.white,
                    tooltipPadding: EdgeInsets.all(2.w),
                    tooltipMargin: 1.h,
                    getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
                      return touchedBarSpots.map((barSpot) {
                        final index = barSpot.x.toInt();
                        if (index >= 0 && index < chartData.length) {
                          final record = chartData[index];

                          return LineTooltipItem(
                            '${record.weightKg.toStringAsFixed(1)} kg\n'
                            '${record.bmi.toStringAsFixed(1)}\n'
                            '${record.timestamp.day}/${record.timestamp.month} ${record.timestamp.hour}:${record.timestamp.minute.toString().padLeft(2, '0')}',
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
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: 10,
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
                      interval: 10,
                      getTitlesWidget: (double value, TitleMeta meta) {
                        return Text(
                          '${value.toInt()}kg',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                          ),
                        );
                      },
                      reservedSize: 42,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                ),
                minX: 0,
                maxX: (chartData.length - 1).toDouble(),
                minY:
                    (chartData
                        .map((e) => e.weightKg)
                        .reduce((a, b) => a < b ? a : b) -
                    5),
                maxY:
                    (chartData
                        .map((e) => e.weightKg)
                        .reduce((a, b) => a > b ? a : b) +
                    5),
                lineBarsData: [
                  LineChartBarData(
                    spots: chartData.asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value.weightKg);
                    }).toList(),
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.blue,
                          strokeWidth: 2,
                          strokeColor: Colors.white,
                        );
                      },
                    ),
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.blue.withValues(alpha: 0.1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Map<String, dynamic> _getBMICategory(double bmi) {
    if (bmi < 16) {
      return {
        'name': 'Very Severe Underweight',
        'color': const Color(0xFF1976D2),
      };
    } else if (bmi < 17) {
      return {'name': 'Severe Underweight', 'color': const Color(0xFF42A5F5)};
    } else if (bmi < 18.5) {
      return {'name': 'Underweight', 'color': const Color(0xFF26C6DA)};
    } else if (bmi < 25) {
      return {'name': 'Normal', 'color': const Color(0xFF4CAF50)};
    } else if (bmi < 30) {
      return {'name': 'Overweight', 'color': const Color(0xFFFFC107)};
    } else if (bmi < 35) {
      return {'name': 'Obese Class I', 'color': const Color(0xFFFF9800)};
    } else if (bmi < 40) {
      return {'name': 'Obese Class II', 'color': const Color(0xFFF44336)};
    } else {
      return {'name': 'Obese Class III', 'color': const Color(0xFFD32F2F)};
    }
  }
}
