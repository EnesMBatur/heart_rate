import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'viewmodels/report_view_model.dart';
import 'components/report_header.dart';
import 'components/health_metrics_section.dart';
import 'components/hrv_analysis_section.dart';
import 'components/recommendations_section.dart';
import 'components/share_section.dart';

class ReportScreen extends StatefulWidget {
  final int heartRate;
  final double hrv;
  final int signalQualityPercent;
  final String status;
  final int mood;

  const ReportScreen({
    super.key,
    required this.heartRate,
    required this.hrv,
    required this.signalQualityPercent,
    required this.status,
    required this.mood,
  });

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late ReportViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    print('🔍 ReportScreen initState called');
    print('🔍 Heart rate: ${widget.heartRate}');
    print('🔍 HRV: ${widget.hrv}');
    print('🔍 Signal quality: ${widget.signalQualityPercent}');
    print('🔍 Status: ${widget.status}');
    print('🔍 Mood: ${widget.mood}');

    _viewModel = ReportViewModel();
    _viewModel.initializeReport(
      heartRate: widget.heartRate,
      hrv: widget.hrv,
      signalQualityPercent: widget.signalQualityPercent,
      status: widget.status,
      mood: widget.mood,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => context.go('/home'),
        ),
        title: Text(
          'Health Report',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () => _showShareOptions(),
          ),
        ],
      ),
      body: AnimatedBuilder(
        animation: _viewModel,
        builder: (context, child) {
          if (_viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header with main metrics
                ReportHeader(report: _viewModel.report),

                SizedBox(height: 3.h),

                // Health Metrics Section
                HealthMetricsSection(
                  healthMetrics: _viewModel.report.healthMetrics,
                ),

                SizedBox(height: 3.h),

                // HRV Analysis Section
                HRVAnalysisSection(hrvAnalysis: _viewModel.report.hrvAnalysis),

                SizedBox(height: 3.h),

                // Recommendations Section
                RecommendationsSection(
                  recommendations: _viewModel.report.recommendations,
                ),

                SizedBox(height: 3.h),

                // Share & Export Section
                ShareSection(
                  report: _viewModel.report,
                  onShare: _showShareOptions,
                ),

                // Bottom padding for safe area
                SizedBox(height: 4.h),
              ],
            ),
          );
        },
      ),
    );
  }

  void _showShareOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.all(4.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Text(
              'Share Report',
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            _shareOption(
              icon: Icons.picture_as_pdf,
              title: 'Export as PDF',
              subtitle: 'Generate PDF report',
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement PDF export
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('PDF export coming soon!')),
                );
              },
            ),
            _shareOption(
              icon: Icons.image,
              title: 'Save as Image',
              subtitle: 'Save report as image',
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement image save
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Image save coming soon!')),
                );
              },
            ),
            _shareOption(
              icon: Icons.share,
              title: 'Share with Doctor',
              subtitle: 'Send to healthcare provider',
              onTap: () {
                Navigator.pop(context);
                // TODO: Implement doctor share
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Doctor share coming soon!')),
                );
              },
            ),
            SizedBox(height: 2.h),
          ],
        ),
      ),
    );
  }

  Widget _shareOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Theme.of(context).primaryColor, size: 24),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 12.sp),
      ),
      onTap: onTap,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
