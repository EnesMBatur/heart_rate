import 'package:flutter/material.dart';

class BloodPressureMeasurement {
  final String id;
  final int systolic;
  final int diastolic;
  final int pulse;
  final DateTime timestamp;
  final String
  state; // 'Sitting', 'Relaxing', 'At Work', 'After Exercise', etc.
  final String gender; // 'Male', 'Female'
  final int age;
  final String? note;
  final BloodPressureCategory category;

  BloodPressureMeasurement({
    String? id,
    required this.systolic,
    required this.diastolic,
    required this.pulse,
    required this.timestamp,
    required this.state,
    required this.gender,
    required this.age,
    this.note,
    required this.category,
  }) : id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'systolic': systolic,
      'diastolic': diastolic,
      'pulse': pulse,
      'timestamp': timestamp.toIso8601String(),
      'state': state,
      'gender': gender,
      'age': age,
      'note': note,
      'category': category.name,
    };
  }

  factory BloodPressureMeasurement.fromJson(Map<String, dynamic> json) {
    return BloodPressureMeasurement(
      id: json['id'] as String?,
      systolic: json['systolic'] as int,
      diastolic: json['diastolic'] as int,
      pulse: json['pulse'] as int,
      timestamp: DateTime.parse(json['timestamp'] as String),
      state: json['state'] as String,
      gender: json['gender'] as String,
      age: json['age'] as int,
      note: json['note'] as String?,
      category: BloodPressureCategory.values.firstWhere(
        (cat) => cat.name == json['category'],
        orElse: () => BloodPressureCategory.normal,
      ),
    );
  }

  static BloodPressureCategory calculateCategory(int systolic, int diastolic) {
    if (systolic < 90 && diastolic < 60) {
      return BloodPressureCategory.hypotension;
    } else if (systolic >= 90 &&
        systolic <= 119 &&
        diastolic >= 60 &&
        diastolic <= 79) {
      return BloodPressureCategory.normal;
    } else if (systolic >= 120 &&
        systolic <= 129 &&
        diastolic >= 60 &&
        diastolic <= 79) {
      return BloodPressureCategory.elevated;
    } else if ((systolic >= 130 && systolic <= 139) ||
        (diastolic >= 80 && diastolic <= 89)) {
      return BloodPressureCategory.hypertensionStage1;
    } else if ((systolic >= 140 && systolic <= 180) ||
        (diastolic >= 90 && diastolic <= 120)) {
      return BloodPressureCategory.hypertensionStage2;
    } else {
      return BloodPressureCategory.hypertensive;
    }
  }

  BloodPressureMeasurement copyWith({
    int? systolic,
    int? diastolic,
    int? pulse,
    DateTime? timestamp,
    String? state,
    String? gender,
    int? age,
    String? note,
    BloodPressureCategory? category,
  }) {
    return BloodPressureMeasurement(
      systolic: systolic ?? this.systolic,
      diastolic: diastolic ?? this.diastolic,
      pulse: pulse ?? this.pulse,
      timestamp: timestamp ?? this.timestamp,
      state: state ?? this.state,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      note: note ?? this.note,
      category: category ?? this.category,
    );
  }
}

enum BloodPressureCategory {
  hypotension,
  normal,
  elevated,
  hypertensionStage1,
  hypertensionStage2,
  hypertensive;

  String get displayName {
    switch (this) {
      case BloodPressureCategory.hypotension:
        return 'Hypotension';
      case BloodPressureCategory.normal:
        return 'Normal';
      case BloodPressureCategory.elevated:
        return 'Elevated';
      case BloodPressureCategory.hypertensionStage1:
        return 'Hypertension, Stage 1';
      case BloodPressureCategory.hypertensionStage2:
        return 'Hypertension, Stage 2';
      case BloodPressureCategory.hypertensive:
        return 'Hypertensive';
    }
  }

  String get description {
    switch (this) {
      case BloodPressureCategory.hypotension:
        return 'SYS < 90 & DIA < 60';
      case BloodPressureCategory.normal:
        return 'SYS 90-119 & DIA 60-79';
      case BloodPressureCategory.elevated:
        return 'SYS 120-129 & DIA 60-79';
      case BloodPressureCategory.hypertensionStage1:
        return 'SYS 130-139 & DIA 80-89';
      case BloodPressureCategory.hypertensionStage2:
        return 'SYS 140-180 & DIA 90-120';
      case BloodPressureCategory.hypertensive:
        return 'SYS > 180 & DIA > 120';
    }
  }

  Color get color {
    switch (this) {
      case BloodPressureCategory.hypotension:
        return const Color(0xFF00BCD4); // Cyan
      case BloodPressureCategory.normal:
        return const Color(0xFF4CAF50); // Green
      case BloodPressureCategory.elevated:
        return const Color(0xFFFFEB3B); // Yellow
      case BloodPressureCategory.hypertensionStage1:
        return const Color(0xFFFF9800); // Orange
      case BloodPressureCategory.hypertensionStage2:
        return const Color(0xFFF44336); // Red
      case BloodPressureCategory.hypertensive:
        return const Color(0xFF9C27B0); // Purple
    }
  }
}
