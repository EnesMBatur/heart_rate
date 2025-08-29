import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../locale/lang/locale_keys.g.dart';

enum BMICategory {
  verySevereUnderweight('Very severely underweight', Color(0xFF2196F3)),
  severeUnderweight('Severely underweight', Color(0xFF42A5F5)),
  underweight('Underweight', Color(0xFF26C6DA)),
  normal('Normal', Color(0xFF4CAF50)),
  overweight('Overweight', Color(0xFFFFC107)),
  obeseClass1('Obese Class I', Color(0xFFFF9800)),
  obeseClass2('Obese Class II', Color(0xFFF44336)),
  obeseClass3('Obese Class III', Color(0xFFD32F2F));

  const BMICategory(this.displayName, this.color);
  final String displayName;
  final Color color;

  String get localizedName {
    switch (this) {
      case BMICategory.verySevereUnderweight:
        return LocaleKeys.bmi_categories_very_severe_underweight.tr();
      case BMICategory.severeUnderweight:
        return LocaleKeys.bmi_categories_severe_underweight.tr();
      case BMICategory.underweight:
        return LocaleKeys.bmi_categories_underweight.tr();
      case BMICategory.normal:
        return LocaleKeys.bmi_categories_normal.tr();
      case BMICategory.overweight:
        return LocaleKeys.bmi_categories_overweight.tr();
      case BMICategory.obeseClass1:
        return LocaleKeys.bmi_categories_obese_class_1.tr();
      case BMICategory.obeseClass2:
        return LocaleKeys.bmi_categories_obese_class_2.tr();
      case BMICategory.obeseClass3:
        return LocaleKeys.bmi_categories_obese_class_3.tr();
    }
  }

  String get rangeText {
    switch (this) {
      case BMICategory.verySevereUnderweight:
        return LocaleKeys.bmi_ranges_very_severe_underweight.tr();
      case BMICategory.severeUnderweight:
        return LocaleKeys.bmi_ranges_severe_underweight.tr();
      case BMICategory.underweight:
        return LocaleKeys.bmi_ranges_underweight.tr();
      case BMICategory.normal:
        return LocaleKeys.bmi_ranges_normal.tr();
      case BMICategory.overweight:
        return LocaleKeys.bmi_ranges_overweight.tr();
      case BMICategory.obeseClass1:
        return LocaleKeys.bmi_ranges_obese_class_1.tr();
      case BMICategory.obeseClass2:
        return LocaleKeys.bmi_ranges_obese_class_2.tr();
      case BMICategory.obeseClass3:
        return LocaleKeys.bmi_ranges_obese_class_3.tr();
    }
  }
}

class BMIRecord {
  final String id;
  final double weightKg;
  final double heightCm;
  final DateTime timestamp;
  final String? note;

  BMIRecord({
    required this.id,
    required this.weightKg,
    required this.heightCm,
    required this.timestamp,
    this.note,
  });

  double get bmi => weightKg / ((heightCm / 100.0) * (heightCm / 100.0));

  BMICategory get category {
    final v = bmi;
    if (v < 16.0) return BMICategory.verySevereUnderweight;
    if (v < 17.0) return BMICategory.severeUnderweight;
    if (v < 18.5) return BMICategory.underweight;
    if (v < 25.0) return BMICategory.normal;
    if (v < 30.0) return BMICategory.overweight;
    if (v < 35.0) return BMICategory.obeseClass1;
    if (v < 40.0) return BMICategory.obeseClass2;
    return BMICategory.obeseClass3;
  }

  Map<String, dynamic> toMap() => {
    'id': id,
    'weightKg': weightKg,
    'heightCm': heightCm,
    'timestamp': timestamp.toIso8601String(),
    'note': note,
  };

  static BMIRecord fromMap(Map<String, dynamic> map) => BMIRecord(
    id: map['id'] as String,
    weightKg: (map['weightKg'] as num).toDouble(),
    heightCm: (map['heightCm'] as num).toDouble(),
    timestamp: DateTime.parse(map['timestamp'] as String),
    note: map['note'] as String?,
  );
}
