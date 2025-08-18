import 'package:flutter/material.dart';

enum BloodSugarState {
  default_('Default'),
  fasting('Fasting'),
  beforeEating('Before Eating'),
  afterEating1h('After Eating (1h)'),
  afterEating2h('After Eating (2h)'),
  asleep('Asleep'),
  beforeWorkout('Before Workout'),
  afterWorkout('After Workout');

  const BloodSugarState(this.displayName);
  final String displayName;
}

enum BloodSugarCategory {
  low('Low', Color(0xFF4ECDC4)),
  normal('Normal', Color(0xFF45B7D1)),
  preDiabetes('Pre-diabetes', Color(0xFFFF9500)),
  diabetes('Diabetes', Color(0xFFFF6B6B));

  const BloodSugarCategory(this.displayName, this.color);
  final String displayName;
  final Color color;
}

class BloodSugarMeasurement {
  final String id;
  final double value; // mg/dL
  final BloodSugarState state;
  final DateTime timestamp;
  final String? note;
  final String gender;
  final int age;

  BloodSugarMeasurement({
    required this.id,
    required this.value,
    required this.state,
    required this.timestamp,
    this.note,
    this.gender = 'Male',
    this.age = 28,
  });

  BloodSugarCategory get category {
    switch (state) {
      case BloodSugarState.fasting:
      case BloodSugarState.beforeEating:
        if (value < 72) return BloodSugarCategory.low;
        if (value <= 99) return BloodSugarCategory.normal;
        if (value <= 125) return BloodSugarCategory.preDiabetes;
        return BloodSugarCategory.diabetes;

      case BloodSugarState.afterEating1h:
      case BloodSugarState.afterEating2h:
        if (value < 72) return BloodSugarCategory.low;
        if (value <= 139) return BloodSugarCategory.normal;
        if (value <= 199) return BloodSugarCategory.preDiabetes;
        return BloodSugarCategory.diabetes;

      default:
        if (value < 72) return BloodSugarCategory.low;
        if (value <= 140) return BloodSugarCategory.normal;
        if (value <= 199) return BloodSugarCategory.preDiabetes;
        return BloodSugarCategory.diabetes;
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'value': value,
      'state': state.name,
      'timestamp': timestamp.toIso8601String(),
      'note': note,
      'gender': gender,
      'age': age,
    };
  }

  factory BloodSugarMeasurement.fromJson(Map<String, dynamic> json) {
    return BloodSugarMeasurement(
      id: json['id'] as String,
      value: (json['value'] as num).toDouble(),
      state: BloodSugarState.values.firstWhere(
        (e) => e.name == json['state'],
        orElse: () => BloodSugarState.default_,
      ),
      timestamp: DateTime.parse(json['timestamp'] as String),
      note: json['note'] as String?,
      gender: json['gender'] as String? ?? 'Male',
      age: json['age'] as int? ?? 28,
    );
  }

  BloodSugarMeasurement copyWith({
    String? id,
    double? value,
    BloodSugarState? state,
    DateTime? timestamp,
    String? note,
    String? gender,
    int? age,
  }) {
    return BloodSugarMeasurement(
      id: id ?? this.id,
      value: value ?? this.value,
      state: state ?? this.state,
      timestamp: timestamp ?? this.timestamp,
      note: note ?? this.note,
      gender: gender ?? this.gender,
      age: age ?? this.age,
    );
  }
}
