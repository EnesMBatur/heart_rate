import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../models/report/heart_rate_report.dart';
import '../../../router/app_router.dart';
import '../utils/metric_detail_data.dart';

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
                LocaleKeys.report_health_metrics.tr(),
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
    return GestureDetector(
      onTap: () => _onMetricTap(context, metric),
      child: Container(
        padding: EdgeInsets.all(3.w),
        decoration: BoxDecoration(
          color: _getMetricColorForCard(metric).withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: _getMetricColorForCard(metric).withValues(alpha: 0.3),
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
                  color: _getMetricColorForCard(metric),
                  size: 24,
                ),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _getMetricColorForCard(metric),
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 1.w),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 14,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 1.h),

            // Metric Name
            Text(
              _getLocalizedMetricName(metric.name),
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
              _getMetricValueText(metric),
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
              _getStatusTextForMetric(metric),
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: _getMetricColorForCard(metric),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onMetricTap(BuildContext context, HealthMetric metric) {
    Map<String, dynamic>? detailData;

    // Use shortName instead of name to avoid localization issues
    switch (metric.shortName.toLowerCase()) {
      case 'stress':
        detailData = MetricDetailData.getStressLevelDetail(metric.value);
        break;
      case 'energy':
        detailData = MetricDetailData.getEnergyLevelDetail(metric.value);
        break;
      case 'tension':
        detailData = MetricDetailData.getPhysicalTensionDetail(metric.value);
        break;
      case 'hrv':
        detailData = MetricDetailData.getHRVScoreDetail(metric.value);
        break;
      default:
        return; // Don't navigate for unsupported metrics
    }

    context.push(AppRouter.metricDetail, extra: detailData);
  }
}

String _getLocalizedMetricName(String metricName) {
  switch (metricName.toLowerCase()) {
    case 'stress level':
      return LocaleKeys.report_health_statuses_stress_level.tr();
    case 'energy level':
      return LocaleKeys.report_health_statuses_energy_level.tr();
    case 'physical tension':
      return LocaleKeys.report_health_statuses_physical_tension.tr();
    case 'hrv score':
      return LocaleKeys.report_health_statuses_hrv_score.tr();
    case 'heart rate zone':
      return LocaleKeys.report_health_statuses_heart_rate_zone.tr();
    case 'recovery status':
      return LocaleKeys.report_health_statuses_recovery_status.tr();
    case 'sleep quality':
      return LocaleKeys.report_health_statuses_sleep_quality.tr();
    case 'fitness level':
      return LocaleKeys.report_health_statuses_fitness_level.tr();
    default:
      return metricName;
  }
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

// Special color handling for Physical Tension and Stress Level
Color _getMetricColorForCard(HealthMetric metric) {
  if (metric.name.toLowerCase().contains('tension')) {
    // For Physical Tension, we want to show the color based on the actual meaning
    // MetricStatus.high means low tension (good) = green
    // MetricStatus.normal means moderate tension (okay) = orange
    // MetricStatus.low means high tension (bad) = red
    switch (metric.status) {
      case MetricStatus.high:
        return Colors.green; // Low tension = Good
      case MetricStatus.normal:
        return Colors.orange; // Moderate tension = Okay
      case MetricStatus.low:
        return Colors.red; // High tension = Bad
    }
  }

  if (metric.name.toLowerCase().contains('stress')) {
    // For Stress Level, we want to show the color based on the actual meaning
    // MetricStatus.high means low stress (good) = green
    // MetricStatus.normal means moderate stress (okay) = orange
    // MetricStatus.low means high stress (bad) = red
    switch (metric.status) {
      case MetricStatus.high:
        return Colors.green; // Low stress = Good
      case MetricStatus.normal:
        return Colors.orange; // Moderate stress = Okay
      case MetricStatus.low:
        return Colors.red; // High stress = Bad
    }
  }

  return _getMetricColor(metric.status);
}

String _getStatusText(MetricStatus status) {
  switch (status) {
    case MetricStatus.high:
      return LocaleKeys.report_health_statuses_excellent.tr();
    case MetricStatus.normal:
      return LocaleKeys.report_health_statuses_normal.tr();
    case MetricStatus.low:
      return LocaleKeys.report_health_statuses_needs_attention.tr();
  }
}

// Special status text for Physical Tension and Stress Level (context-aware)
String _getStatusTextForMetric(HealthMetric metric) {
  if (metric.name.toLowerCase().contains('tension')) {
    switch (metric.status) {
      case MetricStatus.high:
        return LocaleKeys.report_health_statuses_very_relaxed
            .tr(); // Low tension value = Very Relaxed
      case MetricStatus.normal:
        return LocaleKeys.report_health_statuses_relaxed
            .tr(); // Moderate tension value = Relaxed
      case MetricStatus.low:
        return LocaleKeys.report_health_statuses_tense
            .tr(); // High tension value = Tense
    }
  }

  if (metric.name.toLowerCase().contains('stress')) {
    switch (metric.status) {
      case MetricStatus.high:
        return LocaleKeys.report_health_statuses_very_calm
            .tr(); // Low stress value = Very Calm
      case MetricStatus.normal:
        return LocaleKeys.report_health_statuses_calm
            .tr(); // Moderate stress value = Calm
      case MetricStatus.low:
        return LocaleKeys.report_health_statuses_stressed
            .tr(); // High stress value = Stressed
    }
  }

  return _getStatusText(metric.status);
}

String _getMetricValueText(HealthMetric metric) {
  // For 5-point scale metrics, show as X/5 format
  if (metric.name.toLowerCase().contains('stress') ||
      metric.name.toLowerCase().contains('energy') ||
      metric.name.toLowerCase().contains('tension')) {
    return '${metric.value.toStringAsFixed(1)}/5';
  }
  // For other metrics, show with unit
  return '${metric.value.toStringAsFixed(1)} ${metric.unit}';
}
