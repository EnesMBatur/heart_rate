import 'dart:convert';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

enum BloodOxygenCategory {
  normal,
  concerning,
  low;

  String get displayName {
    switch (this) {
      case BloodOxygenCategory.low:
        return LocaleKeys.heart_rate_low.tr();
      case BloodOxygenCategory.concerning:
        return LocaleKeys.heart_rate_concerning.tr();
      case BloodOxygenCategory.normal:
        return LocaleKeys.heart_rate_normal.tr();
    }
  }

  Color get color {
    switch (this) {
      case BloodOxygenCategory.low:
        return const Color(0xFFE53E3E); // Red
      case BloodOxygenCategory.concerning:
        return const Color(0xFFED8936); // Orange
      case BloodOxygenCategory.normal:
        return const Color(0xFF38A169); // Green
    }
  }

  static BloodOxygenCategory fromSpO2(int spO2) {
    if (spO2 >= 95) return BloodOxygenCategory.normal;
    if (spO2 >= 90) return BloodOxygenCategory.concerning;
    return BloodOxygenCategory.low;
  }
}

class BloodOxygenRecord {
  final String id;
  final int spO2;
  final DateTime timestamp;
  final BloodOxygenCategory category;
  final String? note;

  BloodOxygenRecord({
    required this.id,
    required this.spO2,
    required this.timestamp,
    required this.category,
    this.note,
  });

  factory BloodOxygenRecord.create({required int spO2, String? note}) {
    final timestamp = DateTime.now();
    return BloodOxygenRecord(
      id: timestamp.millisecondsSinceEpoch.toString(),
      spO2: spO2,
      timestamp: timestamp,
      category: BloodOxygenCategory.fromSpO2(spO2),
      note: note,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'spO2': spO2,
      'timestamp': timestamp.millisecondsSinceEpoch,
      'category': category.name,
      'note': note,
    };
  }

  factory BloodOxygenRecord.fromMap(Map<String, dynamic> map) {
    return BloodOxygenRecord(
      id: map['id'] as String,
      spO2: map['spO2'] as int,
      timestamp: DateTime.fromMillisecondsSinceEpoch(map['timestamp'] as int),
      category: BloodOxygenCategory.values.firstWhere(
        (e) => e.name == map['category'],
        orElse: () => BloodOxygenCategory.normal,
      ),
      note: map['note'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory BloodOxygenRecord.fromJson(String source) =>
      BloodOxygenRecord.fromMap(json.decode(source) as Map<String, dynamic>);

  BloodOxygenRecord copyWith({
    String? id,
    int? spO2,
    DateTime? timestamp,
    BloodOxygenCategory? category,
    String? note,
  }) {
    return BloodOxygenRecord(
      id: id ?? this.id,
      spO2: spO2 ?? this.spO2,
      timestamp: timestamp ?? this.timestamp,
      category: category ?? this.category,
      note: note ?? this.note,
    );
  }

  @override
  String toString() {
    return 'BloodOxygenRecord(id: $id, spO2: $spO2, timestamp: $timestamp, category: $category, note: $note)';
  }

  @override
  bool operator ==(covariant BloodOxygenRecord other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.spO2 == spO2 &&
        other.timestamp == timestamp &&
        other.category == category &&
        other.note == note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        spO2.hashCode ^
        timestamp.hashCode ^
        category.hashCode ^
        note.hashCode;
  }
}
