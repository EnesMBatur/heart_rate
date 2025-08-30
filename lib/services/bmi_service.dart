import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/bmi_record.dart';

class BMIService {
  static const String _storageKey = 'bmi_records';

  Future<List<BMIRecord>> getRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final items = prefs.getStringList(_storageKey) ?? [];
    return items
        .map((e) => BMIRecord.fromMap(jsonDecode(e) as Map<String, dynamic>))
        .toList();
  }

  Future<void> saveRecord(BMIRecord record) async {
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
        'avgWeight': 0.0,
        'maxWeight': 0.0,
        'minWeight': 0.0,
        'avgBMI': 0.0,
        'maxBMI': 0.0,
        'minBMI': 0.0,
        'count': 0,
      };
    }
    final weights = list.map((e) => e.weightKg).toList()..sort();
    final bmis = list.map((e) => e.bmi).toList()..sort();
    final avgW = weights.reduce((a, b) => a + b) / weights.length;
    final avgBMI = bmis.reduce((a, b) => a + b) / bmis.length;
    return {
      'avgWeight': double.parse(avgW.toStringAsFixed(1)),
      'maxWeight': weights.last,
      'minWeight': weights.first,
      'avgBMI': double.parse(avgBMI.toStringAsFixed(1)),
      'maxBMI': double.parse(bmis.last.toStringAsFixed(1)),
      'minBMI': double.parse(bmis.first.toStringAsFixed(1)),
      'count': list.length,
    };
  }

  Future<void> _persist(List<BMIRecord> list) async {
    final prefs = await SharedPreferences.getInstance();
    final items = list.map((e) => jsonEncode(e.toMap())).toList();
    await prefs.setStringList(_storageKey, items);
  }
}
