class HeartRateMeasurement {
  final int heartRate;
  final DateTime timestamp;
  final int stress; // 1-5 scale
  final int tension; // 1-5 scale
  final int energy; // 1-5 scale
  final double? hrv; // Heart Rate Variability (RMSSD in ms)
  final double? signalQuality; // 0.0-1.0 signal quality
  final String? algorithmUsed; // "basic" or "fft"

  HeartRateMeasurement({
    required this.heartRate,
    required this.timestamp,
    required this.stress,
    required this.tension,
    required this.energy,
    this.hrv,
    this.signalQuality,
    this.algorithmUsed,
  });

  Map<String, dynamic> toJson() {
    return {
      'heartRate': heartRate,
      'timestamp': timestamp.toIso8601String(),
      'stress': stress,
      'tension': tension,
      'energy': energy,
      'hrv': hrv,
      'signalQuality': signalQuality,
      'algorithmUsed': algorithmUsed,
    };
  }

  factory HeartRateMeasurement.fromJson(Map<String, dynamic> json) {
    return HeartRateMeasurement(
      heartRate: json['heartRate'],
      timestamp: DateTime.parse(json['timestamp']),
      stress: json['stress'],
      tension: json['tension'],
      energy: json['energy'],
      hrv: json['hrv']?.toDouble(),
      signalQuality: json['signalQuality']?.toDouble(),
      algorithmUsed: json['algorithmUsed'],
    );
  }

  String get heartRateCategory {
    if (heartRate < 60) return 'Low';
    if (heartRate <= 100) return 'Normal';
    if (heartRate <= 120) return 'Elevated';
    return 'High';
  }

  String get stressLevel {
    switch (stress) {
      case 1:
        return 'Very Low';
      case 2:
        return 'Low';
      case 3:
        return 'Moderate';
      case 4:
        return 'High';
      case 5:
        return 'Very High';
      default:
        return 'Unknown';
    }
  }

  String get tensionLevel {
    switch (tension) {
      case 1:
        return 'Very Relaxed';
      case 2:
        return 'Relaxed';
      case 3:
        return 'Moderate';
      case 4:
        return 'Tense';
      case 5:
        return 'Very Tense';
      default:
        return 'Unknown';
    }
  }

  String get energyLevel {
    switch (energy) {
      case 1:
        return 'Very Low';
      case 2:
        return 'Low';
      case 3:
        return 'Moderate';
      case 4:
        return 'High';
      case 5:
        return 'Very High';
      default:
        return 'Unknown';
    }
  }

  /// HRV category based on RMSSD value
  String get hrvCategory {
    if (hrv == null) return 'Unknown';

    // RMSSD normalization (age-adjusted approximation)
    if (hrv! < 15) return 'Very Low';
    if (hrv! < 25) return 'Low';
    if (hrv! < 35) return 'Normal';
    if (hrv! < 50) return 'Good';
    return 'Excellent';
  }

  /// Signal quality description
  String get signalQualityDescription {
    if (signalQuality == null) return 'Unknown';

    if (signalQuality! >= 0.8) return 'Excellent';
    if (signalQuality! >= 0.6) return 'Good';
    if (signalQuality! >= 0.4) return 'Fair';
    if (signalQuality! >= 0.2) return 'Poor';
    return 'Very Poor';
  }

  /// Overall measurement quality score (0-100)
  int get overallQuality {
    double score = 0.0;
    int factors = 0;

    // Heart rate validity (40-200 BPM)
    if (heartRate >= 40 && heartRate <= 200) {
      score += 25.0;
    }
    factors++;

    // Signal quality
    if (signalQuality != null) {
      score += (signalQuality! * 25.0);
      factors++;
    }

    // HRV reasonableness
    if (hrv != null && hrv! > 0 && hrv! < 200) {
      score += 25.0;
      factors++;
    }

    // Algorithm used
    if (algorithmUsed == 'fft') {
      score += 25.0;
    } else if (algorithmUsed == 'basic') {
      score += 15.0;
    }
    factors++;

    return (score * factors / 4).round().clamp(0, 100);
  }
}
