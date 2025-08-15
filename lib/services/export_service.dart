import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/report/heart_rate_report.dart';

class ExportService {
  static ExportService? _instance;
  static ExportService get instance => _instance ??= ExportService._();
  ExportService._();

  /// Generate and save PDF report
  Future<String?> generatePDF(HeartRateReport report) async {
    try {
      final pdf = pw.Document();

      // Create PDF pages
      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          margin: const pw.EdgeInsets.all(32),
          build: (pw.Context context) {
            return [
              _buildPDFHeader(report),
              pw.SizedBox(height: 20),
              _buildPDFOverview(report),
              pw.SizedBox(height: 20),
              _buildPDFHealthMetrics(report),
              pw.SizedBox(height: 20),
              _buildPDFHRVAnalysis(report),
              pw.SizedBox(height: 20),
              _buildPDFRecommendations(report),
              pw.SizedBox(height: 20),
              _buildPDFFooter(report),
            ];
          },
        ),
      );

      // Save PDF to device
      final directory = await getApplicationDocumentsDirectory();
      final fileName =
          'heart_rate_report_${DateTime.now().millisecondsSinceEpoch}.pdf';
      final file = File('${directory.path}/$fileName');

      await file.writeAsBytes(await pdf.save());

      return file.path;
    } catch (e) {
      debugPrint('Error generating PDF: $e');
      return null;
    }
  }

  /// Capture widget as image and save to gallery
  Future<String?> saveReportAsImage(GlobalKey key) async {
    try {
      final RenderRepaintBoundary boundary =
          key.currentContext!.findRenderObject() as RenderRepaintBoundary;

      final ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      final ByteData? byteData = await image.toByteData(
        format: ui.ImageByteFormat.png,
      );

      if (byteData != null) {
        final directory = await getApplicationDocumentsDirectory();
        final fileName =
            'heart_rate_report_${DateTime.now().millisecondsSinceEpoch}.png';
        final file = File('${directory.path}/$fileName');

        await file.writeAsBytes(byteData.buffer.asUint8List());
        return file.path;
      }

      return null;
    } catch (e) {
      debugPrint('Error saving image: $e');
      return null;
    }
  }

  /// Share report via available apps
  Future<void> shareReport(HeartRateReport report, {String? filePath}) async {
    try {
      final reportText = _generateReportText(report);

      if (filePath != null) {
        await Share.shareXFiles(
          [XFile(filePath)],
          text: reportText,
          subject: 'Heart Rate Analysis Report',
        );
      } else {
        await Share.share(reportText, subject: 'Heart Rate Analysis Report');
      }
    } catch (e) {
      debugPrint('Error sharing report: $e');
    }
  }

  /// Share with doctor via email
  Future<void> shareWithDoctor(HeartRateReport report, String? filePath) async {
    try {
      final reportText = _generateDoctorReportText(report);
      final subject = Uri.encodeComponent(
        'Heart Rate Analysis Report - ${_formatDate(report.timestamp)}',
      );
      final body = Uri.encodeComponent(reportText);

      final emailUrl = 'mailto:?subject=$subject&body=$body';

      if (await canLaunchUrl(Uri.parse(emailUrl))) {
        await launchUrl(Uri.parse(emailUrl));
      } else {
        // Fallback to regular sharing if email app not available
        await shareReport(report, filePath: filePath);
      }
    } catch (e) {
      debugPrint('Error sharing with doctor: $e');
    }
  }

  // PDF Building Methods
  pw.Widget _buildPDFHeader(HeartRateReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Heart Rate Analysis Report',
          style: pw.TextStyle(
            fontSize: 24,
            fontWeight: pw.FontWeight.bold,
            color: PdfColors.red,
          ),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'Generated on ${_formatDate(report.timestamp)}',
          style: const pw.TextStyle(fontSize: 14, color: PdfColors.grey600),
        ),
        pw.Divider(thickness: 2, color: PdfColors.red),
      ],
    );
  }

  pw.Widget _buildPDFOverview(HeartRateReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Overview',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Container(
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Column(
            children: [
              _buildPDFDataRow('Heart Rate', '${report.heartRate} BPM'),
              _buildPDFDataRow(
                'HRV (RMSSD)',
                '${report.hrv.toStringAsFixed(1)} ms',
              ),
              _buildPDFDataRow(
                'Signal Quality',
                '${report.signalQualityPercent}%',
              ),
              _buildPDFDataRow('Status', _getStatusText(report.status)),
              _buildPDFDataRow('Mood', report.moodDescription),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPDFHealthMetrics(HeartRateReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Health Metrics',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Wrap(
          spacing: 10,
          runSpacing: 10,
          children: report.healthMetrics
              .map(
                (metric) => pw.Container(
                  width: 120,
                  padding: const pw.EdgeInsets.all(12),
                  decoration: pw.BoxDecoration(
                    border: pw.Border.all(color: PdfColors.grey300),
                    borderRadius: pw.BorderRadius.circular(8),
                  ),
                  child: pw.Column(
                    children: [
                      pw.Text(
                        metric.name,
                        style: pw.TextStyle(
                          fontSize: 12,
                          fontWeight: pw.FontWeight.bold,
                        ),
                      ),
                      pw.SizedBox(height: 5),
                      pw.Text(
                        metric.value.toStringAsFixed(1),
                        style: const pw.TextStyle(fontSize: 16),
                      ),
                      pw.Text(
                        metric.unit,
                        style: const pw.TextStyle(
                          fontSize: 10,
                          color: PdfColors.grey600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  pw.Widget _buildPDFHRVAnalysis(HeartRateReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'HRV Analysis',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        pw.Container(
          padding: const pw.EdgeInsets.all(16),
          decoration: pw.BoxDecoration(
            border: pw.Border.all(color: PdfColors.grey300),
            borderRadius: pw.BorderRadius.circular(8),
          ),
          child: pw.Column(
            children: [
              _buildPDFDataRow(
                'SDNN',
                '${report.hrvAnalysis.sdnn.toStringAsFixed(1)} ms',
              ),
              _buildPDFDataRow(
                'RMSSD',
                '${report.hrvAnalysis.rmssd.toStringAsFixed(1)} ms',
              ),
              _buildPDFDataRow(
                'pNN50',
                '${report.hrvAnalysis.pnn50.toStringAsFixed(1)}%',
              ),
              _buildPDFDataRow(
                'Coefficient of Variation',
                '${report.hrvAnalysis.cov.toStringAsFixed(1)}%',
              ),
            ],
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPDFRecommendations(HeartRateReport report) {
    final recommendations = _getRecommendations(report);

    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          'Recommendations',
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 10),
        ...recommendations.map(
          (rec) => pw.Padding(
            padding: const pw.EdgeInsets.only(bottom: 8),
            child: pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text('- ', style: const pw.TextStyle(fontSize: 14)),
                pw.Expanded(
                  child: pw.Text(rec, style: const pw.TextStyle(fontSize: 14)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  pw.Widget _buildPDFFooter(HeartRateReport report) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Divider(color: PdfColors.grey300),
        pw.SizedBox(height: 10),
        pw.Text(
          'Important Note:',
          style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
        ),
        pw.SizedBox(height: 5),
        pw.Text(
          'This report is for informational purposes only and should not replace professional medical advice. Please consult with a healthcare professional for proper medical evaluation.',
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey600),
        ),
        pw.SizedBox(height: 10),
        pw.Text(
          'Generated by Heart Rate Monitor App',
          style: const pw.TextStyle(fontSize: 10, color: PdfColors.grey500),
        ),
      ],
    );
  }

  pw.Widget _buildPDFDataRow(String label, String value) {
    return pw.Padding(
      padding: const pw.EdgeInsets.symmetric(vertical: 4),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        children: [
          pw.Text(label, style: const pw.TextStyle(fontSize: 12)),
          pw.Text(
            value,
            style: pw.TextStyle(fontSize: 12, fontWeight: pw.FontWeight.bold),
          ),
        ],
      ),
    );
  }

  // Helper Methods
  String _generateReportText(HeartRateReport report) {
    return '''
Heart Rate Analysis Report

Date: ${_formatDate(report.timestamp)}
Heart Rate: ${report.heartRate} BPM
HRV (RMSSD): ${report.hrv.toStringAsFixed(1)} ms
Signal Quality: ${report.signalQualityPercent}%
Status: ${_getStatusText(report.status)}

Health Metrics:
${report.healthMetrics.map((m) => '- ${m.name}: ${m.value.toStringAsFixed(1)} ${m.unit}').join('\n')}

HRV Analysis:
- SDNN: ${report.hrvAnalysis.sdnn.toStringAsFixed(1)} ms
- RMSSD: ${report.hrvAnalysis.rmssd.toStringAsFixed(1)} ms
- pNN50: ${report.hrvAnalysis.pnn50.toStringAsFixed(1)}%
- Coefficient of Variation: ${report.hrvAnalysis.cov.toStringAsFixed(1)}%

Generated by Heart Rate Monitor App
    ''';
  }

  String _generateDoctorReportText(HeartRateReport report) {
    return '''
Dear Doctor,

Please find the heart rate analysis report for your review:

Patient Report Summary:
- Date: ${_formatDate(report.timestamp)}
- Heart Rate: ${report.heartRate} BPM
- HRV (RMSSD): ${report.hrv.toStringAsFixed(1)} ms
- Signal Quality: ${report.signalQualityPercent}%
- Overall Status: ${_getStatusText(report.status)}

Detailed HRV Analysis:
- SDNN: ${report.hrvAnalysis.sdnn.toStringAsFixed(1)} ms
- RMSSD: ${report.hrvAnalysis.rmssd.toStringAsFixed(1)} ms
- pNN50: ${report.hrvAnalysis.pnn50.toStringAsFixed(1)}%
- Coefficient of Variation: ${report.hrvAnalysis.cov.toStringAsFixed(1)}%

Health Metrics:
${report.healthMetrics.map((m) => '- ${m.name}: ${m.value.toStringAsFixed(1)} ${m.unit} (${_getMetricStatusText(m.status)})').join('\n')}

Please let me know if you need any additional information or would like to schedule a consultation.

Best regards,
Generated via Heart Rate Monitor App
    ''';
  }

  List<String> _getRecommendations(HeartRateReport report) {
    final recommendations = <String>[];

    switch (report.status) {
      case ReportStatus.excellent:
        recommendations.addAll([
          'Maintain your current healthy lifestyle',
          'Continue regular exercise routine',
          'Keep up good stress management practices',
        ]);
        break;
      case ReportStatus.good:
        recommendations.addAll([
          'Consider increasing cardiovascular exercise',
          'Practice stress reduction techniques',
          'Maintain consistent sleep schedule',
        ]);
        break;
      case ReportStatus.normal:
        recommendations.addAll([
          'Increase physical activity gradually',
          'Focus on stress management and relaxation',
          'Consider breathing exercises and meditation',
        ]);
        break;
      case ReportStatus.concerning:
        recommendations.addAll([
          'Consult with a healthcare professional',
          'Consider reducing stress and improving sleep',
          'Start with light exercise under medical supervision',
        ]);
        break;
    }

    return recommendations;
  }

  String _formatDate(DateTime date) {
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
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

  String _getMetricStatusText(MetricStatus status) {
    switch (status) {
      case MetricStatus.low:
        return 'Low';
      case MetricStatus.normal:
        return 'Normal';
      case MetricStatus.high:
        return 'High';
    }
  }
}
