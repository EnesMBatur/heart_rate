import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/blood_oxygen_record.dart';

class BloodOxygenService {
  static const String _storageKey = 'blood_oxygen_records';

  Future<List<BloodOxygenRecord>> getRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(_storageKey) ?? [];
    return items
        .map(
          (e) =>
              BloodOxygenRecord.fromMap(jsonDecode(e) as Map<String, dynamic>),
        )
        .toList();
  }

  Future<void> saveRecord(BloodOxygenRecord record) async {
    final list = await getRecords();
    final idx = list.indexWhere((r) => r.id == record.id);
    if (idx >= 0) {
      list[idx] = record;
    } else {
      list.add(record);
    }
    await _persist(list);
  }

  Future<void> deleteRecord(String id) async {
    final list = await getRecords();
    list.removeWhere((r) => r.id == id);
    await _persist(list);
  }

  Future<void> clearAllRecords() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_storageKey);
  }

  Future<Map<String, dynamic>> getStatistics() async {
    final list = await getRecords();
    if (list.isEmpty) {
      return {
        'avgSpO2': 0.0,
        'maxSpO2': 0,
        'minSpO2': 0,
        'count': 0,
        'normalCount': 0,
        'concerningCount': 0,
        'lowCount': 0,
      };
    }

    final spO2Values = list.map((e) => e.spO2).toList()..sort();
    final avgSpO2 = spO2Values.reduce((a, b) => a + b) / spO2Values.length;

    final normalCount = list
        .where((r) => r.category == BloodOxygenCategory.normal)
        .length;
    final concerningCount = list
        .where((r) => r.category == BloodOxygenCategory.concerning)
        .length;
    final lowCount = list
        .where((r) => r.category == BloodOxygenCategory.low)
        .length;

    return {
      'avgSpO2': double.parse(avgSpO2.toStringAsFixed(1)),
      'maxSpO2': spO2Values.last,
      'minSpO2': spO2Values.first,
      'count': list.length,
      'normalCount': normalCount,
      'concerningCount': concerningCount,
      'lowCount': lowCount,
    };
  }

  Future<void> _persist(List<BloodOxygenRecord> list) async {
    final prefs = await SharedPreferences.getInstance();
    final items = list.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList(_storageKey, items);
  }
}
