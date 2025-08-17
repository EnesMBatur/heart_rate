import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/blood_pressure_view_model.dart';

class BloodPressureChart extends StatelessWidget {
  const BloodPressureChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodPressureViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          children: [
            // Date range selector
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.chevron_left),
                  onPressed: () {
                    // Previous week
                  },
                ),
                Text(
                  viewModel.selectedTimeRange,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.chevron_right),
                  onPressed: () {
                    // Next week
                  },
                ),
              ],
            ),

            SizedBox(height: 3.h),

            // Chart container
            Container(
              width: double.infinity,
              height: 40.h,
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
                children: [
                  // Y-axis labels and chart area
                  Expanded(
                    child: Row(
                      children: [
                        // Y-axis labels
                        SizedBox(
                          width: 8.w,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '120',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '100',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '80',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '60',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Text(
                                '40',
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Chart area
                        Expanded(child: _buildChartBars(viewModel)),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  // X-axis labels (days)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Mon',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Tue',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Wed',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Thu',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Fri',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Sat',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                      Text(
                        'Sun',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
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
  }

  Widget _buildChartBars(BloodPressureViewModel viewModel) {
    final measurements = viewModel.recentMeasurements;
    if (measurements.isEmpty) {
      return Center(
        child: Text(
          'No data available',
          style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _buildBarGroup(104, 62, '116'),
        _buildBarGroup(108, 64, '108'),
        _buildBarGroup(99, 60, '99'),
        _buildBarGroup(105, 63, '105'),
        _buildBarGroup(101, 68, '101'),
        _buildBarGroup(110, 61, '110'),
        _buildBarGroup(0, 0, ''), // Empty for last day
      ],
    );
  }

  Widget _buildBarGroup(int systolic, int diastolic, String systolicLabel) {
    if (systolic == 0) {
      return SizedBox(width: 8.w);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Systolic value label
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B6B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            systolicLabel,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        const SizedBox(height: 4),

        // Systolic bar
        Container(
          width: 6.w,
          height: (systolic / 120) * 25.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFF6B6B),
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        // Diastolic bar
        Container(
          width: 6.w,
          height: (diastolic / 120) * 25.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFFB3B3),
            borderRadius: BorderRadius.circular(4),
          ),
        ),

        const SizedBox(height: 4),

        // Diastolic value label
        Text(
          diastolic.toString(),
          style: TextStyle(
            fontSize: 10.sp,
            color: Colors.grey[600],
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
