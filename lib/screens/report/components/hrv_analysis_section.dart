import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import '../../../models/report/heart_rate_report.dart';
import '../../../router/app_router.dart';
import '../utils/metric_detail_data.dart';

class HRVAnalysisSection extends StatelessWidget {
  final HRVAnalysis hrvAnalysis;

  const HRVAnalysisSection({super.key, required this.hrvAnalysis});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                Icons.timeline,
                color: Theme.of(context).primaryColor,
                size: 24,
              ),
              SizedBox(width: 2.w),
              Text(
                'HRV Analysis',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          // Status Badge
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
            decoration: BoxDecoration(
              color: _getStatusColor(hrvAnalysis.status).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: _getStatusColor(
                  hrvAnalysis.status,
                ).withValues(alpha: 0.3),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getStatusIcon(hrvAnalysis.status),
                  color: _getStatusColor(hrvAnalysis.status),
                  size: 20,
                ),
                SizedBox(width: 1.w),
                Text(
                  _getStatusText(hrvAnalysis.status),
                  style: TextStyle(
                    color: _getStatusColor(hrvAnalysis.status),
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 2.h),

          // Interpretation
          Container(
            padding: EdgeInsets.all(3.w),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              hrvAnalysis.interpretation,
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.grey[700],
                height: 1.5,
              ),
            ),
          ),

          SizedBox(height: 3.h),

          // HRV Metrics
          Text(
            'Detailed Metrics',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          SizedBox(height: 2.h),

          // Metrics Grid
          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  'SDNN',
                  '${hrvAnalysis.sdnn.toStringAsFixed(1)} ms',
                  hrvAnalysis.sdnn,
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: _buildMetricItem(
                  'RMSSD',
                  '${hrvAnalysis.rmssd.toStringAsFixed(1)} ms',
                  hrvAnalysis.rmssd,
                ),
              ),
            ],
          ),

          SizedBox(height: 2.h),

          Row(
            children: [
              Expanded(
                child: _buildMetricItem(
                  'pNN50',
                  '${hrvAnalysis.pnn50.toStringAsFixed(1)}%',
                  hrvAnalysis.pnn50,
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: _buildMetricItem(
                  'CoV',
                  '${hrvAnalysis.cov.toStringAsFixed(1)}%',
                  hrvAnalysis.cov,
                ),
              ),
            ],
          ),

          SizedBox(height: 1.h),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String title, String value, double metricValue) {
    return Builder(
      builder: (context) => GestureDetector(
        onTap: () => _onMetricTap(context, title, metricValue),
        child: Container(
          padding: EdgeInsets.all(3.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey[600],
                    ),
                  ),
                  Icon(Icons.chevron_right, color: Colors.grey[400], size: 16),
                ],
              ),
              SizedBox(height: 0.5.h),
              Text(
                value,
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onMetricTap(BuildContext context, String title, double value) {
    Map<String, dynamic>? detailData;

    switch (title.toLowerCase()) {
      case 'sdnn':
        detailData = MetricDetailData.getSDNNDetail(value);
        break;
      case 'rmssd':
        detailData = MetricDetailData.getRMSSDDetail(value);
        break;
      case 'pnn50':
        detailData = MetricDetailData.getPNN50Detail(value);
        break;
      case 'cov':
        detailData = MetricDetailData.getCovDetail(value);
        break;
      default:
        return; // Don't navigate for unsupported metrics
    }

    context.push(AppRouter.metricDetail, extra: detailData);
  }

  Color _getStatusColor(HRVStatus status) {
    switch (status) {
      case HRVStatus.high:
        return Colors.green;
      case HRVStatus.normal:
        return Colors.orange;
      case HRVStatus.low:
        return Colors.red;
    }
  }

  IconData _getStatusIcon(HRVStatus status) {
    switch (status) {
      case HRVStatus.high:
        return Icons.trending_up;
      case HRVStatus.normal:
        return Icons.trending_flat;
      case HRVStatus.low:
        return Icons.trending_down;
    }
  }

  String _getStatusText(HRVStatus status) {
    switch (status) {
      case HRVStatus.high:
        return 'Excellent HRV';
      case HRVStatus.normal:
        return 'Normal HRV';
      case HRVStatus.low:
        return 'Low HRV';
    }
  }
}
