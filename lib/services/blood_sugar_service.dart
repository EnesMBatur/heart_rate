import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/blood_sugar_measurement.dart';

class BloodSugarService {
  static const String _storageKey = 'blood_sugar_measurements';

  Future<List<BloodSugarMeasurement>> getMeasurements() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final measurementsJson = prefs.getStringList(_storageKey) ?? [];

      return measurementsJson
          .map((json) => BloodSugarMeasurement.fromJson(jsonDecode(json)))
          .toList();
    } catch (e) {
      throw Exception('Failed to load blood sugar measurements: $e');
    }
  }

  Future<void> saveMeasurement(BloodSugarMeasurement measurement) async {
    try {
      final measurements = await getMeasurements();

      // Check if measurement with same ID exists (for updates)
      final existingIndex = measurements.indexWhere(
        (m) => m.id == measurement.id,
      );

      if (existingIndex != -1) {
        // Update existing measurement
        measurements[existingIndex] = measurement;
      } else {
        // Add new measurement
        measurements.add(measurement);
      }

      await _saveMeasurements(measurements);
    } catch (e) {
      throw Exception('Failed to save blood sugar measurement: $e');
    }
  }

  Future<void> deleteMeasurement(BloodSugarMeasurement measurement) async {
    try {
      final measurements = await getMeasurements();
      measurements.removeWhere((m) => m.id == measurement.id);
      await _saveMeasurements(measurements);
    } catch (e) {
      throw Exception('Failed to delete blood sugar measurement: $e');
    }
  }

  Future<void> _saveMeasurements(
    List<BloodSugarMeasurement> measurements,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final measurementsJson = measurements
        .map((measurement) => jsonEncode(measurement.toJson()))
        .toList();

    await prefs.setStringList(_storageKey, measurementsJson);
  }

  Future<BloodSugarMeasurement?> getLatestMeasurement() async {
    try {
      final measurements = await getMeasurements();
      if (measurements.isEmpty) return null;

      measurements.sort((a, b) => b.timestamp.compareTo(a.timestamp));
      return measurements.first;
    } catch (e) {
      return null;
    }
  }

  Future<Map<String, dynamic>> getStatistics() async {
    try {
      final measurements = await getMeasurements();

      if (measurements.isEmpty) {
        return {
          'average': 0.0,
          'minimum': 0.0,
          'maximum': 0.0,
          'totalRecords': 0,
        };
      }

      final values = measurements.map((m) => m.value).toList();
      values.sort();

      final double average = values.reduce((a, b) => a + b) / values.length;
      final double minimum = values.first;
      final double maximum = values.last;

      return {
        'average': double.parse(average.toStringAsFixed(1)),
        'minimum': minimum,
        'maximum': maximum,
        'totalRecords': measurements.length,
      };
    } catch (e) {
      return {
        'average': 0.0,
        'minimum': 0.0,
        'maximum': 0.0,
        'totalRecords': 0,
      };
    }
  }
}
