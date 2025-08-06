class HeartRateMeasurement {
  final int heartRate;
  final DateTime timestamp;
  final int stress; // 1-5 scale
  final int tension; // 1-5 scale
  final int energy; // 1-5 scale

  HeartRateMeasurement({
    required this.heartRate,
    required this.timestamp,
    required this.stress,
    required this.tension,
    required this.energy,
  });

  Map<String, dynamic> toJson() {
    return {
      'heartRate': heartRate,
      'timestamp': timestamp.toIso8601String(),
      'stress': stress,
      'tension': tension,
      'energy': energy,
    };
  }

  factory HeartRateMeasurement.fromJson(Map<String, dynamic> json) {
    return HeartRateMeasurement(
      heartRate: json['heartRate'],
      timestamp: DateTime.parse(json['timestamp']),
      stress: json['stress'],
      tension: json['tension'],
      energy: json['energy'],
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
}
