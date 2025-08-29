import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:convert';
import '../../../models/heart_rate_measurement.dart';
import '../../../services/event_bus.dart';
import '../../../locale/lang/locale_keys.g.dart';

enum TimeRange {
  today,
  days7,
  days14,
  days30;

  String get localizedName {
    switch (this) {
      case TimeRange.today:
        return LocaleKeys.general_today.tr();
      case TimeRange.days7:
        return LocaleKeys.blood_sugar_7_days.tr();
      case TimeRange.days14:
        return LocaleKeys.blood_sugar_14_days.tr();
      case TimeRange.days30:
        return LocaleKeys.blood_sugar_30_days.tr();
    }
  }
}

class HeartRateViewModel extends ChangeNotifier {
  List<HeartRateMeasurement> _measurements = [];
  bool _isLoading = false;
  bool _showStatistics = true;
  TimeRange _selectedTimeRange = TimeRange.days7;
  HeartRateMeasurement? _selectedMeasurement;

  // Callback for when data changes (to notify other screens)
  VoidCallback? onDataChanged;

  List<HeartRateMeasurement> get measurements => _measurements;
  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  TimeRange get selectedTimeRange => _selectedTimeRange;
  HeartRateMeasurement? get selectedMeasurement => _selectedMeasurement;
  List<HeartRateMeasurement> get recentMeasurements => _measurements;
  int get totalRecords => _measurements.length;

  HeartRateViewModel() {
    loadMeasurements();
  }

  Future<void> loadMeasurements() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();

      // Try to load from new detailed measurements first
      final detailedMeasurements =
          prefs.getStringList('heart_rate_measurements') ?? [];

      if (detailedMeasurements.isNotEmpty) {
        // Load detailed measurements
        _measurements = detailedMeasurements
            .map(
              (jsonString) =>
                  HeartRateMeasurement.fromJson(jsonDecode(jsonString)),
            )
            .toList();
      } else {
        // Fallback to legacy history format
        final historyData = prefs.getStringList('heart_rate_history') ?? [];
        _measurements = historyData
            .map((e) {
              final parts = e.split('|');
              if (parts.length >= 2) {
                return HeartRateMeasurement(
                  heartRate: int.parse(parts[1]),
                  timestamp: DateTime.parse(parts[0]),
                  stress: 3, // Default values for legacy data
                  tension: 3,
                  energy: 3,
                );
              }
              return null;
            })
            .where((measurement) => measurement != null)
            .cast<HeartRateMeasurement>()
            .toList();
      }

      // En son eklenen/güncellenen üstte olacak şekilde sırala
      _measurements.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } catch (e) {
      debugPrint('Error loading heart rate measurements: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await loadMeasurements();
  }

  void toggleView() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void setTimeRange(TimeRange timeRange) {
    _selectedTimeRange = timeRange;
    notifyListeners();
  }

  void selectMeasurement(HeartRateMeasurement? measurement) {
    _selectedMeasurement = measurement;
    notifyListeners();
  }

  List<HeartRateMeasurement> getFilteredMeasurements() {
    final now = DateTime.now();
    DateTime filterDate;

    switch (_selectedTimeRange) {
      case TimeRange.today:
        filterDate = DateTime(now.year, now.month, now.day);
        break;
      case TimeRange.days7:
        filterDate = now.subtract(const Duration(days: 7));
        break;
      case TimeRange.days14:
        filterDate = now.subtract(const Duration(days: 14));
        break;
      case TimeRange.days30:
        filterDate = now.subtract(const Duration(days: 30));
        break;
    }

    return _measurements
        .where((measurement) => measurement.timestamp.isAfter(filterDate))
        .toList();
  }

  List<HeartRateMeasurement> getChartData() {
    return getFilteredMeasurements();
  }

  Future<Map<String, dynamic>> getStatistics() async {
    final filteredMeasurements = getFilteredMeasurements();

    if (filteredMeasurements.isEmpty) {
      return {
        'avgHeartRate': 0.0,
        'maxHeartRate': 0.0,
        'minHeartRate': 0.0,
        'avgStress': 0.0,
        'avgTension': 0.0,
        'avgEnergy': 0.0,
        'count': 0,
      };
    }

    final heartRates = filteredMeasurements.map((e) => e.heartRate).toList();
    final stressLevels = filteredMeasurements.map((e) => e.stress).toList();
    final tensionLevels = filteredMeasurements.map((e) => e.tension).toList();
    final energyLevels = filteredMeasurements.map((e) => e.energy).toList();

    heartRates.sort();

    final avgHeartRate = heartRates.reduce((a, b) => a + b) / heartRates.length;
    final avgStress =
        stressLevels.reduce((a, b) => a + b) / stressLevels.length;
    final avgTension =
        tensionLevels.reduce((a, b) => a + b) / tensionLevels.length;
    final avgEnergy =
        energyLevels.reduce((a, b) => a + b) / energyLevels.length;

    return {
      'avgHeartRate': double.parse(avgHeartRate.toStringAsFixed(1)),
      'maxHeartRate': heartRates.last.toDouble(),
      'minHeartRate': heartRates.first.toDouble(),
      'avgStress': double.parse(avgStress.toStringAsFixed(1)),
      'avgTension': double.parse(avgTension.toStringAsFixed(1)),
      'avgEnergy': double.parse(avgEnergy.toStringAsFixed(1)),
      'count': filteredMeasurements.length,
    };
  }

  Future<void> deleteMeasurement(HeartRateMeasurement measurement) async {
    try {
      // Remove from local list
      _measurements.removeWhere(
        (m) =>
            m.timestamp == measurement.timestamp &&
            m.heartRate == measurement.heartRate,
      );

      final prefs = await SharedPreferences.getInstance();

      // Update detailed measurements JSON list
      final measurementsList = _measurements
          .map((e) => e.toJsonString())
          .toList();
      await prefs.setStringList('heart_rate_measurements', measurementsList);

      // Also update legacy format for backward compatibility
      final legacyHistory = _measurements
          .map((e) => '${e.timestamp.toIso8601String()}|${e.heartRate}')
          .toList();
      await prefs.setStringList('heart_rate_history', legacyHistory);

      // Update last measurement if it was deleted
      if (_measurements.isNotEmpty) {
        final lastMeasurement =
            _measurements.first; // Already sorted by timestamp desc
        await prefs.setInt('last_heart_rate', lastMeasurement.heartRate);
        await prefs.setString(
          'last_timestamp',
          lastMeasurement.timestamp.toIso8601String(),
        );
      } else {
        // No measurements left, clear last measurement
        await prefs.remove('last_heart_rate');
        await prefs.remove('last_timestamp');
      }

      notifyListeners();

      // Notify other screens that data has changed
      onDataChanged?.call();

      // Fire global event for home screen to refresh
      EventBus().fire(Events.heartRateDataChanged);
    } catch (e) {
      debugPrint('Error deleting heart rate measurement: $e');
    }
  }
}
