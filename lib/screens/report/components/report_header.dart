import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/report/heart_rate_report.dart';

class ReportHeader extends StatelessWidget {
  final HeartRateReport report;

  const ReportHeader({super.key, required this.report});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).primaryColor.withValues(alpha: 0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.3),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Date and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _formatDate(report.timestamp),
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                decoration: BoxDecoration(
                  color: _getStatusColor(report.status),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _getStatusText(report.status),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 1.5.h),

          // Main Heart Rate Display
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '${report.heartRate}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 48.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: 2.w),
              Text(
                'BPM',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),

          // Heart Rate Status Bar
          _buildHeartRateStatusBar(report.heartRate),

          SizedBox(height: 2.h),

          // Heart Rate Category
          Text(
            _getHeartRateCategory(report.heartRate),
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.95),
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
            ),
          ),

          SizedBox(height: 3.h),

          // Key Metrics Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildMetricCard(
                icon: Icons.favorite,
                label: 'HRV',
                value: '${report.hrv.toStringAsFixed(1)} ms',
                color: Colors.white,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.3),
              ),
              _buildMetricCard(
                icon: Icons.analytics,
                label: 'Quality',
                value: '${report.signalQualityPercent}%',
                color: Colors.white,
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.white.withValues(alpha: 0.3),
              ),
              _buildMetricCard(
                icon: Icons.mood,
                label: 'Mood',
                value: _getMoodEmoji(report.mood),
                color: Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        Icon(icon, color: color.withValues(alpha: 0.9), size: 20),
        SizedBox(height: 0.5.h),
        Text(
          label,
          style: TextStyle(
            color: color.withValues(alpha: 0.8),
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 0.3.h),
        Text(
          value,
          style: TextStyle(
            color: color,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildHeartRateStatusBar(int heartRate) {
    return Column(
      children: [
        // Status Bar
        Container(
          width: 80.w,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF4FC3F7), // Light Blue - Very Low
                Color(0xFF29B6F6), // Blue - Low
                Color(0xFF66BB6A), // Green - Normal
                Color(0xFFFFCA28), // Yellow - Elevated
                Color(0xFFFF7043), // Orange - High
                Color(0xFFE53935), // Red - Very High
              ],
              stops: [0.0, 0.2, 0.4, 0.6, 0.8, 1.0],
            ),
          ),
        ),
        SizedBox(height: 1.h),

        // Indicator
        SizedBox(
          width: 80.w,
          height: 20,
          child: Stack(
            children: [
              // Indicator triangle
              Positioned(
                left: (_getIndicatorPosition(heartRate) * 80.w - 6).clamp(
                  0.0,
                  80.w - 12,
                ),
                top: 0,
                child: Icon(Icons.arrow_drop_up, color: Colors.white, size: 20),
              ),
            ],
          ),
        ),

        SizedBox(height: 0.5.h),

        // Range labels
        SizedBox(
          width: 80.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '40',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '60',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '100',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '120',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '140',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                '160+',
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.7),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  double _getIndicatorPosition(int heartRate) {
    // Map heart rate to position on bar (0.0 to 1.0)
    if (heartRate <= 40) return 0.0;
    if (heartRate <= 60) return (heartRate - 40) / 20 * 0.2; // 0.0 to 0.2
    if (heartRate <= 100) {
      return 0.2 + (heartRate - 60) / 40 * 0.2; // 0.2 to 0.4
    }
    if (heartRate <= 120) {
      return 0.4 + (heartRate - 100) / 20 * 0.2; // 0.4 to 0.6
    }
    if (heartRate <= 140) {
      return 0.6 + (heartRate - 120) / 20 * 0.2; // 0.6 to 0.8
    }
    if (heartRate <= 160) {
      return 0.8 + (heartRate - 140) / 20 * 0.2; // 0.8 to 1.0
    }
    return 1.0; // Above 160
  }

  String _formatDate(DateTime date) {
    final months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }

  Color _getStatusColor(ReportStatus status) {
    switch (status) {
      case ReportStatus.excellent:
        return Colors.green;
      case ReportStatus.good:
        return Colors.lightGreen;
      case ReportStatus.normal:
        return Colors.orange;
      case ReportStatus.concerning:
        return Colors.red;
    }
  }

  String _getStatusText(ReportStatus status) {
    switch (status) {
      case ReportStatus.excellent:
        return 'Excellent';
      case ReportStatus.good:
        return 'Good';
      case ReportStatus.normal:
        return 'Normal';
      case ReportStatus.concerning:
        return 'Concerning';
    }
  }

  String _getHeartRateCategory(int heartRate) {
    if (heartRate < 60) {
      return 'Below Normal Range';
    } else if (heartRate <= 100) {
      return 'Normal Heart Rate';
    } else if (heartRate <= 120) {
      return 'Slightly Elevated';
    } else {
      return 'Elevated Heart Rate';
    }
  }

  String _getMoodEmoji(int mood) {
    switch (mood) {
      case 1:
        return '😢';
      case 2:
        return '😐';
      case 3:
        return '😊';
      case 4:
        return '😄';
      case 5:
        return '🤩';
      default:
        return '😊';
    }
  }
}
