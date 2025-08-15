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

  /// Get mood description
  String get moodDescription {
    switch (mood) {
      case 1:
        return 'Feeling down';
      case 2:
        return 'Could be better';
      case 3:
        return 'Feeling okay';
      case 4:
        return 'Feeling good';
      case 5:
        return 'Feeling great';
      default:
        return 'Unknown';
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
    String interpretation;

    if (hrv < 20) {
      status = HRVStatus.low;
      interpretation =
          'Your HRV is below expected, indicating possible stress or insufficient recovery.';
    } else if (hrv < 50) {
      status = HRVStatus.normal;
      interpretation =
          'Your HRV is within normal range, indicating good autonomic balance.';
    } else {
      status = HRVStatus.high;
      interpretation =
          'Your HRV is excellent, indicating strong cardiovascular health and good recovery.';
    }

    return HRVAnalysis(
      sdnn: sdnn,
      rmssd: rmssd,
      pnn50: pnn50,
      cov: cov,
      status: status,
      interpretation: interpretation,
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
