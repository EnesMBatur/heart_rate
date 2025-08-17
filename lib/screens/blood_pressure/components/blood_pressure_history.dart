import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../viewmodels/blood_pressure_view_model.dart';
import '../../../models/blood_pressure_measurement.dart';

class BloodPressureHistory extends StatelessWidget {
  const BloodPressureHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodPressureViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.measurements.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Icon(
                  Icons.water_drop_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                SizedBox(height: 2.h),
                Text(
                  'No measurements yet',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Tap the + button to add your first measurement',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.measurements.length,
          separatorBuilder: (context, index) => SizedBox(height: 2.h),
          itemBuilder: (context, index) {
            final measurement = viewModel.measurements[index];
            return _buildHistoryItem(context, measurement, viewModel);
          },
        );
      },
    );
  }

  Widget _buildHistoryItem(
    BuildContext context,
    BloodPressureMeasurement measurement,
    BloodPressureViewModel viewModel,
  ) {
    final dateFormatter = DateFormat('MMM dd, yyyy');
    final timeFormatter = DateFormat('h:mm a');

    return GestureDetector(
      onTap: () {
        // Edit modunda açmak için measurement'ı parametre olarak geçir
        context.push('/blood-pressure/add', extra: measurement);
      },
      child: Container(
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Blood pressure values
                  Text(
                    '${measurement.systolic} / ${measurement.diastolic}',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    '${measurement.pulse} bpm',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 1.h),

                  // Category badge and state
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: measurement.category.color,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          measurement.category.displayName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // SizedBox(width: 2.w),
                      // Text(
                      //   measurement.state,
                      //   style: TextStyle(
                      //     fontSize: 14.sp,
                      //     color: Colors.grey[600],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(height: 1.h),

                  // Date and time
                  Text(
                    '${dateFormatter.format(measurement.timestamp)} • ${timeFormatter.format(measurement.timestamp)}',
                    style: TextStyle(fontSize: 15.sp, color: Colors.grey[500]),
                  ),
                ],
              ),
            ),

            // Arrow icon
            Icon(Icons.arrow_forward_ios, size: 24, color: Colors.grey[400]),
          ],
        ),
      ),
    );
  }
}
