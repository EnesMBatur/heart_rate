import 'package:flutter/material.dart';
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
    print('🔍 ReportViewModel initializeReport called');
    print('🔍 Heart rate: $heartRate');
    print('🔍 HRV: $hrv');
    print('🔍 Signal quality: $signalQualityPercent');
    print('🔍 Status: $status');
    print('🔍 Mood: $mood');

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
        name: 'Stress Level',
        shortName: 'Stress',
        value: _calculateStressLevel(heartRate, hrv).toDouble(),
        unit: '/5',
        status: _getStressMetricStatus(
          _calculateStressLevel(heartRate, hrv).toDouble(),
        ),
        description: 'Current stress level based on heart rate and HRV',
        emoji: '😰',
      ),
      HealthMetric(
        name: 'Energy Level',
        shortName: 'Energy',
        value: _calculateEnergyLevel(heartRate, 'normal', 3).toDouble(),
        unit: '/5',
        status: _getMetricStatus(
          _calculateEnergyLevel(heartRate, 'normal', 3).toDouble(),
          2,
          4,
        ),
        description: 'Current energy level assessment',
        emoji: '⚡',
      ),
      HealthMetric(
        name: 'Physical Tension',
        shortName: 'Tension',
        value: _calculateTensionLevel(heartRate, hrv).toDouble(),
        unit: '/5',
        status: _getTensionMetricStatus(
          _calculateTensionLevel(heartRate, hrv).toDouble(),
        ),
        description: 'Physical tension and relaxation level',
        emoji: '💪',
      ),
      HealthMetric(
        name: 'HRV Score',
        shortName: 'HRV',
        value: hrv,
        unit: 'ms',
        status: _getMetricStatus(hrv, 20, 40),
        description: 'Heart Rate Variability indicates autonomic balance',
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

    // Stress-based recommendations
    if (stressLevel >= 4) {
      recommendations.add(
        const RecommendationItem(
          title: 'Practice Deep Breathing',
          description:
              'Try 4-7-8 breathing technique: Inhale for 4 counts, hold for 7, exhale for 8. Repeat 4 times.',
          emoji: '🫁',
          type: RecommendationType.stress,
          priority: 1,
        ),
      );
      recommendations.add(
        const RecommendationItem(
          title: 'Take a Break',
          description:
              'Step away from stressful activities for 10-15 minutes. Go for a short walk or practice mindfulness.',
          emoji: '⏸️',
          type: RecommendationType.lifestyle,
          priority: 2,
        ),
      );
    }

    // Tension-based recommendations
    if (tensionLevel >= 4) {
      recommendations.add(
        const RecommendationItem(
          title: 'Stretch Your Muscles',
          description:
              'Perform gentle neck, shoulder, and back stretches to release physical tension.',
          emoji: '🧘‍♀️',
          type: RecommendationType.exercise,
          priority: 2,
        ),
      );
    }

    // Energy-based recommendations
    if (energyLevel <= 2) {
      recommendations.add(
        const RecommendationItem(
          title: 'Get Quality Sleep',
          description:
              'Aim for 7-9 hours of sleep tonight. Consider going to bed 30 minutes earlier.',
          emoji: '😴',
          type: RecommendationType.lifestyle,
          priority: 1,
        ),
      );
      recommendations.add(
        const RecommendationItem(
          title: 'Eat Nutrient-Dense Foods',
          description:
              'Include complex carbohydrates, lean proteins, and healthy fats in your next meal.',
          emoji: '🥗',
          type: RecommendationType.nutrition,
          priority: 3,
        ),
      );
    }

    // Heart rate specific recommendations
    if (heartRate > 100) {
      recommendations.add(
        const RecommendationItem(
          title: 'Monitor Heart Rate',
          description:
              'Your heart rate is elevated. Consider consulting a healthcare provider if this persists.',
          emoji: '🏥',
          type: RecommendationType.medical,
          priority: 1,
        ),
      );
    } else if (heartRate < 60) {
      recommendations.add(
        const RecommendationItem(
          title: 'Light Physical Activity',
          description:
              'Engage in light exercise to boost circulation and energy levels.',
          emoji: '🚶‍♀️',
          type: RecommendationType.exercise,
          priority: 3,
        ),
      );
    }

    // HRV specific recommendations
    if (hrv < 20) {
      recommendations.add(
        const RecommendationItem(
          title: 'Focus on Recovery',
          description:
              'Prioritize rest, hydration, and stress management to improve your autonomic balance.',
          emoji: '🔄',
          type: RecommendationType.lifestyle,
          priority: 2,
        ),
      );
    }

    // Mood-based recommendations
    if (mood <= 2) {
      recommendations.add(
        const RecommendationItem(
          title: 'Practice Gratitude',
          description:
              'Write down 3 things you\'re grateful for today. This can help improve your mood and reduce stress.',
          emoji: '🙏',
          type: RecommendationType.lifestyle,
          priority: 3,
        ),
      );
    }

    // General wellness recommendations
    if (recommendations.length < 3) {
      recommendations.add(
        const RecommendationItem(
          title: 'Stay Hydrated',
          description:
              'Drink at least 8 glasses of water throughout the day to maintain optimal health.',
          emoji: '💧',
          type: RecommendationType.lifestyle,
          priority: 4,
        ),
      );
      recommendations.add(
        const RecommendationItem(
          title: 'Regular Exercise',
          description:
              'Aim for 30 minutes of moderate exercise most days of the week to improve cardiovascular health.',
          emoji: '🏃‍♂️',
          type: RecommendationType.exercise,
          priority: 4,
        ),
      );
    }

    // Sort by priority and return top 5
    recommendations.sort((a, b) => a.priority.compareTo(b.priority));
    return recommendations.take(5).toList();
  }
}
