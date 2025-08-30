class HeartRateReport {
  final int heartRate;
  final double hrv;
  final int signalQualityPercent;
  final ReportStatus status;
  final int mood;
  final DateTime timestamp;
  final int stressLevel;
  final int tensionLevel;
  final int energyLevel;
  final HRVAnalysis hrvAnalysis;
  final List<HealthMetric> healthMetrics;
  final List<RecommendationItem> recommendations;

  const HeartRateReport({
    required this.heartRate,
    required this.hrv,
    required this.signalQualityPercent,
    required this.status,
    required this.mood,
    required this.timestamp,
    required this.stressLevel,
    required this.tensionLevel,
    required this.energyLevel,
    required this.hrvAnalysis,
    required this.healthMetrics,
    required this.recommendations,
  });

  /// Get overall health status based on metrics
  HealthStatus get overallHealthStatus {
    final avgLevel = (stressLevel + tensionLevel + energyLevel) / 3;
    if (avgLevel <= 2) return HealthStatus.excellent;
    if (avgLevel <= 3) return HealthStatus.good;
    if (avgLevel <= 4) return HealthStatus.moderate;
    return HealthStatus.needsAttention;
  }

  /// Get heart rate category
  HeartRateCategory get heartRateCategory {
    if (heartRate < 60) return HeartRateCategory.low;
    if (heartRate <= 100) return HeartRateCategory.normal;
    if (heartRate <= 120) return HeartRateCategory.elevated;
    return HeartRateCategory.high;
  }

  /// Get mood description key (to be translated in UI)
  String get moodDescriptionKey {
    switch (mood) {
      case 1:
        return 'report.mood_descriptions.feeling_down';
      case 2:
        return 'report.mood_descriptions.could_be_better';
      case 3:
        return 'report.mood_descriptions.feeling_okay';
      case 4:
        return 'report.mood_descriptions.feeling_good';
      case 5:
        return 'report.mood_descriptions.feeling_great';
      default:
        return 'report.mood_descriptions.unknown';
    }
  }

  /// Get status emoji
  String get statusEmoji {
    switch (status) {
      case ReportStatus.excellent:
        return '�';
      case ReportStatus.good:
        return '😊';
      case ReportStatus.normal:
        return '😐';
      case ReportStatus.concerning:
        return '😟';
    }
  }
}

class HRVAnalysis {
  final double sdnn;
  final double rmssd;
  final double pnn50;
  final double cov;
  final HRVStatus status;
  final String interpretation;

  const HRVAnalysis({
    required this.sdnn,
    required this.rmssd,
    required this.pnn50,
    required this.cov,
    required this.status,
    required this.interpretation,
  });

  factory HRVAnalysis.fromHRV(double hrv) {
    // Calculate derived metrics from HRV
    final sdnn = hrv * 1.2; // Approximate conversion
    final rmssd = hrv * 0.8;
    final pnn50 = hrv * 0.3;
    final cov = hrv * 0.4;

    HRVStatus status;
    String interpretationKey;

    if (hrv < 20) {
      status = HRVStatus.low;
      interpretationKey = 'report.hrv_interpretations.low_stress_recovery';
    } else if (hrv < 50) {
      status = HRVStatus.normal;
      interpretationKey = 'report.hrv_interpretations.normal_autonomic_balance';
    } else {
      status = HRVStatus.high;
      interpretationKey =
          'report.hrv_interpretations.excellent_cardiovascular_health';
    }

    return HRVAnalysis(
      sdnn: sdnn,
      rmssd: rmssd,
      pnn50: pnn50,
      cov: cov,
      status: status,
      interpretation: interpretationKey,
    );
  }
}

class HealthMetric {
  final String name;
  final String shortName;
  final double value;
  final String unit;
  final MetricStatus status;
  final String description;
  final String emoji;

  const HealthMetric({
    required this.name,
    required this.shortName,
    required this.value,
    required this.unit,
    required this.status,
    required this.description,
    required this.emoji,
  });
}

class RecommendationItem {
  final String title;
  final String description;
  final String emoji;
  final RecommendationType type;
  final int priority; // 1-5, 1 being highest priority

  const RecommendationItem({
    required this.title,
    required this.description,
    required this.emoji,
    required this.type,
    required this.priority,
  });
}

enum HealthStatus { excellent, good, moderate, needsAttention }

enum HeartRateCategory { low, normal, elevated, high }

enum HRVStatus { low, normal, high }

enum MetricStatus { low, normal, high }

enum RecommendationType { exercise, nutrition, lifestyle, medical, stress }

enum ReportStatus { excellent, good, normal, concerning }
