import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/heart_rate_measurement.dart';
import 'package:intl/intl.dart';

class CheckUpHistorySection extends StatelessWidget {
  final HeartRateMeasurement? lastMeasurement;
  final VoidCallback? onViewAllPressed;

  const CheckUpHistorySection({
    super.key,
    this.lastMeasurement,
    this.onViewAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Check up History',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            GestureDetector(
              onTap: onViewAllPressed,
              child: Row(
                children: [
                  Text(
                    'View All',
                    style: TextStyle(
                      fontSize: 17.sp,
                      color: const Color(0xFFFF6B6B),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFFF6B6B),
                    size: 14,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 2.h),

        // Last Measurement Card
        if (lastMeasurement != null)
          _buildLastMeasurementCard()
        else
          _buildEmptyStateCard(),
      ],
    );
  }

  Widget _buildLastMeasurementCard() {
    final measurement = lastMeasurement!;
    final status = _getHeartRateStatus(measurement.heartRate);
    final statusColor = _getStatusColor(status);

    return Container(
      padding: const EdgeInsets.all(16),
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
          // Heart Rate Circle
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

          // Measurement Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  DateFormat('MMM d, y').format(measurement.timestamp),
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  DateFormat('h:mm a').format(measurement.timestamp),
                  style: TextStyle(fontSize: 14.sp, color: Colors.black54),
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
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        children: [
          Icon(Icons.history, size: 48, color: Colors.grey[400]),
          const SizedBox(height: 12),
          Text(
            'No measurements yet',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Start measuring to see your history',
            style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
            textAlign: TextAlign.center,
          ),
        ],
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
