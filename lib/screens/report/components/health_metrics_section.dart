import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/report/heart_rate_report.dart';

class HealthMetricsSection extends StatelessWidget {
  final List<HealthMetric> healthMetrics;

  const HealthMetricsSection({super.key, required this.healthMetrics});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 42.h,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Text(
                'Health Metrics',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          // Metrics Grid
          GridView.builder(
            padding: EdgeInsets.only(bottom: 1.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: healthMetrics.length,
            itemBuilder: (context, index) {
              final metric = healthMetrics[index];
              return _buildMetricCard(context, metric);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard(BuildContext context, HealthMetric metric) {
    return Container(
      padding: EdgeInsets.all(3.w),
      decoration: BoxDecoration(
        color: _getMetricColor(metric.status).withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: _getMetricColor(metric.status).withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Metric Icon and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                _getMetricIcon(metric.name),
                color: _getMetricColor(metric.status),
                size: 24,
              ),
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _getMetricColor(metric.status),
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),

          // Metric Name
          Text(
            metric.name,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Metric Value
          Text(
            '${metric.value.toStringAsFixed(1)} ${metric.unit}',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          // Status Text
          Text(
            _getStatusText(metric.status),
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: _getMetricColor(metric.status),
            ),
          ),
        ],
      ),
    );
  }

  IconData _getMetricIcon(String metricName) {
    switch (metricName.toLowerCase()) {
      case 'stress level':
        return Icons.psychology;
      case 'energy level':
        return Icons.battery_charging_full;
      case 'physical tension':
        return Icons.fitness_center;
      case 'heart rate zone':
        return Icons.favorite;
      case 'recovery status':
        return Icons.healing;
      case 'sleep quality':
        return Icons.bedtime;
      case 'fitness level':
        return Icons.directions_run;
      case 'hrv score':
        return Icons.timeline;
      default:
        return Icons.analytics;
    }
  }

  Color _getMetricColor(MetricStatus status) {
    switch (status) {
      case MetricStatus.high:
        return Colors.green;
      case MetricStatus.normal:
        return Colors.orange;
      case MetricStatus.low:
        return Colors.red;
    }
  }

  String _getStatusText(MetricStatus status) {
    switch (status) {
      case MetricStatus.high:
        return 'Excellent';
      case MetricStatus.normal:
        return 'Normal';
      case MetricStatus.low:
        return 'Needs Attention';
    }
  }
}
