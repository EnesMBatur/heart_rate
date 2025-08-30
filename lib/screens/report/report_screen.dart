// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'viewmodels/report_view_model.dart';
import 'components/report_header.dart';
import 'components/health_metrics_section.dart';
import 'components/hrv_analysis_section.dart';
import 'components/recommendations_section.dart';
import '../../services/export_service.dart';

class ReportScreen extends StatefulWidget {
  final int heartRate;
  final double hrv;
  final int signalQualityPercent;
  final String status;
  final int mood;
  final String? source; // 'measurement' or 'history'

  const ReportScreen({
    super.key,
    required this.heartRate,
    required this.hrv,
    required this.signalQualityPercent,
    required this.status,
    required this.mood,
    this.source,
  });

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  late ReportViewModel _viewModel;
  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  void initState() {
    super.initState();
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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            // If coming from measurement, go to home
            // If coming from history, just pop back
            if (widget.source == 'measurement') {
              context.go('/home');
            } else {
              context.pop();
            }
          },
        ),
        title: Text(LocaleKeys.report_title.tr()),
        centerTitle: true,
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
            child: RepaintBoundary(
              key: _repaintBoundaryKey,
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
                  HRVAnalysisSection(
                    hrvAnalysis: _viewModel.report.hrvAnalysis,
                  ),

                  SizedBox(height: 3.h),

                  // Recommendations Section
                  RecommendationsSection(
                    recommendations: _viewModel.report.recommendations,
                  ),

                  // Bottom padding for safe area
                  SizedBox(height: 4.h),
                ],
              ),
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
              LocaleKeys.report_export_options_title.tr(),
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 3.h),
            _shareOption(
              icon: Icons.picture_as_pdf,
              title: LocaleKeys.report_export_options_export_pdf.tr(),
              subtitle: LocaleKeys.report_export_options_export_pdf_desc.tr(),
              onTap: () async {
                Navigator.pop(context);
                try {
                  final filePath = await ExportService.instance.generatePDF(
                    _viewModel.report,
                  );

                  if (filePath != null) {
                    _showSuccessDialog(
                      LocaleKeys.report_export_options_pdf_saved.tr(),
                      filePath,
                    );
                  } else {
                    _showErrorDialog(
                      LocaleKeys.report_export_options_failed_pdf.tr(),
                    );
                  }
                } catch (e) {
                  _showErrorDialog('Error: $e');
                }
              },
            ),
            _shareOption(
              icon: Icons.image,
              title: LocaleKeys.report_export_options_save_image.tr(),
              subtitle: LocaleKeys.report_export_options_save_image_desc.tr(),
              onTap: () async {
                Navigator.pop(context);
                if (_repaintBoundaryKey.currentContext != null) {
                  try {
                    final filePath = await ExportService.instance
                        .saveReportAsImage(_repaintBoundaryKey);

                    if (filePath != null) {
                      _showSuccessDialog(
                        LocaleKeys.report_export_options_image_saved.tr(),
                        filePath,
                      );
                    } else {
                      _showErrorDialog(
                        LocaleKeys.report_export_options_failed_image.tr(),
                      );
                    }
                  } catch (e) {
                    _showErrorDialog('Error: $e');
                  }
                } else {
                  _showErrorDialog(
                    LocaleKeys.report_export_options_unable_capture.tr(),
                  );
                }
              },
            ),
            _shareOption(
              icon: Icons.local_hospital,
              title: LocaleKeys.report_export_options_share_doctor.tr(),
              subtitle: LocaleKeys.report_export_options_share_doctor_desc.tr(),
              onTap: () async {
                Navigator.pop(context);
                try {
                  await ExportService.instance.shareWithDoctor(
                    _viewModel.report,
                    null,
                  );
                } catch (e) {
                  _showErrorDialog('Error sharing with doctor: $e');
                }
              },
            ),
            _shareOption(
              icon: Icons.share,
              title: LocaleKeys.report_export_options_quick_share.tr(),
              subtitle: LocaleKeys.report_export_options_quick_share_desc.tr(),
              onTap: () async {
                Navigator.pop(context);
                try {
                  await ExportService.instance.shareReport(_viewModel.report);
                } catch (e) {
                  _showErrorDialog('Error sharing: $e');
                }
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
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.sp),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[600], fontSize: 13.sp),
      ),
      onTap: onTap,
    );
  }

  void _showSuccessDialog(String message, String filePath) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.check_circle, color: Colors.green),
            const SizedBox(width: 8),
            Text(LocaleKeys.report_export_options_success.tr()),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            SizedBox(height: 2.h),
            Text(
              '${LocaleKeys.report_export_options_saved_to.tr()} ${filePath.split('/').last}',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(LocaleKeys.report_export_options_ok.tr()),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close success dialog first

              // Share directly without loading dialog to avoid context issues
              await ExportService.instance.shareReport(
                _viewModel.report,
                filePath: filePath,
              );
            },
            child: Text(LocaleKeys.report_export_options_share.tr()),
          ),
        ],
      ),
    );
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            const Icon(Icons.error, color: Colors.red),
            const SizedBox(width: 8),
            Text(LocaleKeys.report_export_options_error.tr()),
          ],
        ),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(LocaleKeys.report_export_options_ok.tr()),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
