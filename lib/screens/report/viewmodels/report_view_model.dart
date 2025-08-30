import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:math';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../models/report/heart_rate_report.dart';

class ReportViewModel extends ChangeNotifier {
  late HeartRateReport _report;
  bool _isLoading = false;

  HeartRateReport get report => _report;
  bool get isLoading => _isLoading;

  void initializeReport({
    required int heartRate,
    required double hrv,
    required int signalQualityPercent,
    required String status,
    required int mood,
  }) {
    _isLoading = true;
    notifyListeners();

    _report = _generateReport(
      heartRate: heartRate,
      hrv: hrv,
      signalQualityPercent: signalQualityPercent,
      statusString: status,
      mood: mood,
    );

    _isLoading = false;
    notifyListeners();
  }

  HeartRateReport _generateReport({
    required int heartRate,
    required double hrv,
    required int signalQualityPercent,
    required String statusString,
    required int mood,
  }) {
    // Convert string status to ReportStatus enum
    ReportStatus status = _parseStatus(statusString);

    // Calculate stress, tension, energy levels
    final stressLevel = _calculateStressLevel(heartRate, hrv);
    final tensionLevel = _calculateTensionLevel(heartRate, hrv);
    final energyLevel = _calculateEnergyLevel(heartRate, statusString, mood);

    // Generate HRV analysis
    final hrvAnalysis = HRVAnalysis.fromHRV(hrv);

    // Generate health metrics
    final healthMetrics = _generateHealthMetrics(heartRate, hrv, hrvAnalysis);

    // Generate recommendations
    final recommendations = _generateRecommendations(
      heartRate,
      hrv,
      stressLevel,
      tensionLevel,
      energyLevel,
      statusString,
      mood,
    );

    return HeartRateReport(
      heartRate: heartRate,
      hrv: hrv,
      signalQualityPercent: signalQualityPercent,
      status: status,
      mood: mood,
      timestamp: DateTime.now(),
      stressLevel: stressLevel,
      tensionLevel: tensionLevel,
      energyLevel: energyLevel,
      hrvAnalysis: hrvAnalysis,
      healthMetrics: healthMetrics,
      recommendations: recommendations,
    );
  }

  ReportStatus _parseStatus(String statusString) {
    switch (statusString.toLowerCase()) {
      case 'excellent':
        return ReportStatus.excellent;
      case 'good':
        return ReportStatus.good;
      case 'normal':
        return ReportStatus.normal;
      case 'concerning':
        return ReportStatus.concerning;
      default:
        return ReportStatus.normal;
    }
  }

  int _calculateStressLevel(int heartRate, double hrv) {
    // Higher heart rate + lower HRV = higher stress
    double stressScore = 0;

    // Heart rate contribution (40%)
    if (heartRate < 60) {
      stressScore += 1; // Very low stress
    } else if (heartRate <= 80) {
      stressScore += 2; // Low stress
    } else if (heartRate <= 100) {
      stressScore += 3; // Moderate stress
    } else if (heartRate <= 120) {
      stressScore += 4; // High stress
    } else {
      stressScore += 5; // Very high stress
    }

    // HRV contribution (60%)
    if (hrv >= 50) {
      stressScore += 1; // Very low stress
    } else if (hrv >= 30) {
      stressScore += 2; // Low stress
    } else if (hrv >= 20) {
      stressScore += 3; // Moderate stress
    } else if (hrv >= 10) {
      stressScore += 4; // High stress
    } else {
      stressScore += 5; // Very high stress
    }

    return (stressScore / 2).round().clamp(1, 5);
  }

  int _calculateTensionLevel(int heartRate, double hrv) {
    // Physical tension often correlates with stress but focuses more on muscle tension
    double tensionScore = 0;

    // Heart rate variability is key for tension (70%)
    if (hrv >= 40) {
      tensionScore += 1; // Very relaxed
    } else if (hrv >= 25) {
      tensionScore += 2; // Relaxed
    } else if (hrv >= 15) {
      tensionScore += 3; // Moderate tension
    } else if (hrv >= 8) {
      tensionScore += 4; // Tense
    } else {
      tensionScore += 5; // Very tense
    }

    // Heart rate contribution (30%)
    if (heartRate <= 70) {
      tensionScore += 1; // Relaxed
    } else if (heartRate <= 90) {
      tensionScore += 2; // Slightly tense
    } else if (heartRate <= 110) {
      tensionScore += 3; // Moderately tense
    } else {
      tensionScore += 4; // Very tense
    }

    return (tensionScore / 2).round().clamp(1, 5);
  }

  int _calculateEnergyLevel(int heartRate, String status, int mood) {
    // Energy level is influenced by heart rate, status, and mood
    double energyScore = 0;

    // Heart rate contribution (40%)
    if (heartRate < 50) {
      energyScore += 1; // Very low energy
    } else if (heartRate <= 70) {
      energyScore += 3; // Moderate energy
    } else if (heartRate <= 100) {
      energyScore += 4; // Good energy
    } else if (heartRate <= 120) {
      energyScore += 5; // High energy (but may be stressed)
    } else {
      energyScore += 3; // Overstimulated, not sustainable energy
    }

    // Mood contribution (40%)
    energyScore += mood; // Direct mood contribution

    // Status contribution (20%)
    switch (status.toLowerCase()) {
      case 'resting':
        energyScore += 2;
        break;
      case 'normal':
        energyScore += 3;
        break;
      case 'active':
        energyScore += 4;
        break;
      default:
        energyScore += 3;
    }

    return (energyScore / 3).round().clamp(1, 5);
  }

  List<HealthMetric> _generateHealthMetrics(
    int heartRate,
    double hrv,
    HRVAnalysis hrvAnalysis,
  ) {
    return [
      HealthMetric(
        name: LocaleKeys.report_metric_details_stress_level_title.tr(),
        shortName: 'Stress',
        value: _calculateStressLevel(heartRate, hrv).toDouble(),
        unit: '/5',
        status: _getStressMetricStatus(
          _calculateStressLevel(heartRate, hrv).toDouble(),
        ),
        description: LocaleKeys.report_metric_details_stress_level_description
            .tr(),
        emoji: '😰',
      ),
      HealthMetric(
        name: LocaleKeys.report_metric_details_energy_level_title.tr(),
        shortName: 'Energy',
        value: _calculateEnergyLevel(heartRate, 'normal', 3).toDouble(),
        unit: '/5',
        status: _getMetricStatus(
          _calculateEnergyLevel(heartRate, 'normal', 3).toDouble(),
          2,
          4,
        ),
        description: LocaleKeys.report_metric_details_energy_level_description
            .tr(),
        emoji: '⚡',
      ),
      HealthMetric(
        name: LocaleKeys.report_metric_details_physical_tension_title.tr(),
        shortName: 'Tension',
        value: _calculateTensionLevel(heartRate, hrv).toDouble(),
        unit: '/5',
        status: _getTensionMetricStatus(
          _calculateTensionLevel(heartRate, hrv).toDouble(),
        ),
        description: LocaleKeys
            .report_metric_details_physical_tension_description
            .tr(),
        emoji: '💪',
      ),
      HealthMetric(
        name: LocaleKeys.report_metric_details_hrv_score_title.tr(),
        shortName: 'HRV',
        value: hrv,
        unit: 'ms',
        status: _getMetricStatus(hrv, 20, 40),
        description: LocaleKeys.report_metric_details_hrv_score_description
            .tr(),
        emoji: '💗',
      ),
    ];
  }

  MetricStatus _getMetricStatus(
    double value,
    double lowThreshold,
    double highThreshold,
  ) {
    if (value >= highThreshold) {
      return MetricStatus.high;
    } else if (value >= lowThreshold) {
      return MetricStatus.normal;
    } else {
      return MetricStatus.low;
    }
  }

  // Special status calculation for Physical Tension (lower is better)
  MetricStatus _getTensionMetricStatus(double tensionLevel) {
    if (tensionLevel <= 2.0) {
      return MetricStatus.high; // Low tension = Excellent
    } else if (tensionLevel <= 3.5) {
      return MetricStatus.normal; // Moderate tension = Normal
    } else {
      return MetricStatus.low; // High tension = Needs Attention
    }
  }

  // Special status calculation for Stress Level (lower is better)
  MetricStatus _getStressMetricStatus(double stressLevel) {
    if (stressLevel <= 2.0) {
      return MetricStatus.high; // Low stress = Excellent
    } else if (stressLevel <= 3.5) {
      return MetricStatus.normal; // Moderate stress = Normal
    } else {
      return MetricStatus.low; // High stress = Needs Attention
    }
  }

  List<RecommendationItem> _generateRecommendations(
    int heartRate,
    double hrv,
    int stressLevel,
    int tensionLevel,
    int energyLevel,
    String status,
    int mood,
  ) {
    List<RecommendationItem> recommendations = [];

    // Add localized recommendations based on stress level
    final stressRecommendations = _getStressRecommendations(
      stressLevel.toDouble(),
    );
    if (stressRecommendations.isNotEmpty) {
      final randomIndex = Random().nextInt(stressRecommendations.length);
      recommendations.add(
        RecommendationItem(
          title: LocaleKeys.report_recommendations_stress_management.tr(),
          description: stressRecommendations[randomIndex],
          emoji: '😌',
          type: RecommendationType.stress,
          priority: stressLevel >= 4 ? 1 : 3,
        ),
      );
    }

    // Add localized recommendations based on energy level
    final energyRecommendations = _getEnergyRecommendations(
      energyLevel.toDouble(),
    );
    if (energyRecommendations.isNotEmpty) {
      final randomIndex = Random().nextInt(energyRecommendations.length);
      recommendations.add(
        RecommendationItem(
          title: LocaleKeys.report_recommendations_energy_boost.tr(),
          description: energyRecommendations[randomIndex],
          emoji: '⚡',
          type: RecommendationType.lifestyle,
          priority: energyLevel <= 2 ? 1 : 4,
        ),
      );
    }

    // Add localized recommendations based on tension level
    final tensionRecommendations = _getTensionRecommendations(
      tensionLevel.toDouble(),
    );
    if (tensionRecommendations.isNotEmpty) {
      final randomIndex = Random().nextInt(tensionRecommendations.length);
      recommendations.add(
        RecommendationItem(
          title: LocaleKeys.report_recommendations_relaxation.tr(),
          description: tensionRecommendations[randomIndex],
          emoji: '🧘‍♀️',
          type: RecommendationType.exercise,
          priority: tensionLevel >= 4 ? 2 : 4,
        ),
      );
    }

    // Heart rate specific recommendations
    if (heartRate > 100) {
      recommendations.add(
        RecommendationItem(
          title: LocaleKeys.report_recommendations_heart_rate_monitoring.tr(),
          description: LocaleKeys.report_recommendations_high_heart_rate_desc
              .tr(),
          emoji: '🏥',
          type: RecommendationType.medical,
          priority: 1,
        ),
      );
    }

    // Sort by priority and return top 5
    recommendations.sort((a, b) => a.priority.compareTo(b.priority));
    return recommendations.take(5).toList();
  }

  List<String> _getStressRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_stress_level_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_stress_level_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_stress_level_recommendations_high
          .tr()
          .split('|');
    }
  }

  List<String> _getEnergyRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys.report_metric_details_energy_level_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_energy_level_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys.report_metric_details_energy_level_recommendations_high
          .tr()
          .split('|');
    }
  }

  List<String> _getTensionRecommendations(double value) {
    if (value <= 2.0) {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_low
          .tr()
          .split('|');
    } else if (value <= 3.5) {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_normal
          .tr()
          .split('|');
    } else {
      return LocaleKeys
          .report_metric_details_physical_tension_recommendations_high
          .tr()
          .split('|');
    }
  }
}
