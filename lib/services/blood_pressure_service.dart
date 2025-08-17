import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/blood_pressure_measurement.dart';

class BloodPressureService {
  static const String _storageKey = 'blood_pressure_measurements';

  Future<List<BloodPressureMeasurement>> getMeasurements() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? data = prefs.getString(_storageKey);

      if (data == null) return [];

      final List<dynamic> jsonList = json.decode(data);
      final measurements = jsonList
          .map((json) => BloodPressureMeasurement.fromJson(json))
          .toList();

      // En son eklenen/güncellenen üstte olacak şekilde sırala
      measurements.sort((a, b) => b.timestamp.compareTo(a.timestamp));

      return measurements;
    } catch (e) {
      print('Error loading measurements: $e');
      return [];
    }
  }

  Future<void> saveMeasurement(BloodPressureMeasurement measurement) async {
    try {
      final measurements = await getMeasurements();
      measurements.add(measurement);

      final prefs = await SharedPreferences.getInstance();
      final String jsonData = json.encode(
        measurements.map((m) => m.toJson()).toList(),
      );

      await prefs.setString(_storageKey, jsonData);
    } catch (e) {
      print('Error saving measurement: $e');
    }
  }

  Future<void> deleteMeasurement(String id) async {
    try {
      final measurements = await getMeasurements();
      measurements.removeWhere((m) => m.id == id);

      final prefs = await SharedPreferences.getInstance();
      final String jsonData = json.encode(
        measurements.map((m) => m.toJson()).toList(),
      );

      await prefs.setString(_storageKey, jsonData);
    } catch (e) {
      print('Error deleting measurement: $e');
    }
  }

  Future<void> clearAllMeasurements() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_storageKey);
    } catch (e) {
      print('Error clearing measurements: $e');
    }
  }
}
