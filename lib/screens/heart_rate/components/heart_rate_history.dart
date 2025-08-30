import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../viewmodels/heart_rate_view_model.dart';
import '../../../models/heart_rate_measurement.dart';

class HeartRateHistory extends StatelessWidget {
  const HeartRateHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HeartRateViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.measurements.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Icon(Icons.favorite_outline, size: 64, color: Colors.grey[400]),
                SizedBox(height: 2.h),
                Text(
                  LocaleKeys.history_no_measurements_yet.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  LocaleKeys.heart_rate_tap_measure_button.tr(),
                  textAlign: TextAlign.center,
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
    HeartRateMeasurement measurement,
    HeartRateViewModel viewModel,
  ) {
    final status = _getHeartRateStatus(measurement.heartRate);
    final statusColor = _getStatusColor(status);
    return Dismissible(
      key: Key(measurement.timestamp.millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 4.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete_outline, color: Colors.white, size: 32),
            SizedBox(height: 0.5.h),
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(LocaleKeys.dialogs_delete_measurement.tr()),
              content: Text(
                'Are you sure you want to delete this heart rate measurement?\n\n${measurement.heartRate} BPM - ${DateFormat('MMM dd, yyyy').format(measurement.timestamp)}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        viewModel.deleteMeasurement(measurement);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Measurement deleted'),
            backgroundColor: Colors.red,
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          // Navigate to report screen with measurement details
          context.push(
            '/report',
            extra: {
              'heartRate': measurement.heartRate,
              'hrv': measurement.hrv ?? 0.0,
              'signalQualityPercent': ((measurement.signalQuality ?? 0.8) * 100)
                  .round(),
              'status': measurement.heartRateCategory,
              'mood':
                  measurement.mood ?? 3, // Use measurement's mood or default
              'source': 'history', // Add source info for navigation
            },
          );
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
              // Heart Rate Circle (same as home screen design)
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B6B),
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${measurement.heartRate}',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      'BPM',
                      style: TextStyle(fontSize: 12.sp, color: Colors.white),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 2.h),

              // Measurement details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat(
                        'MMM dd, yyyy • h:mm a',
                      ).format(measurement.timestamp),
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              // Status Badge
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getHeartRateStatus(int heartRate) {
    if (heartRate < 60) return 'Low';
    if (heartRate <= 100) return 'Normal';
    if (heartRate <= 120) return 'Elevated';
    return 'High';
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'Low':
        return Colors.blue;
      case 'Normal':
        return Colors.green;
      case 'Elevated':
        return Colors.orange;
      case 'High':
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
