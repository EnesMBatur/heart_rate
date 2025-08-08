import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/heart_rate_measurement.dart';

class HomeViewModel extends ChangeNotifier {
  HeartRateMeasurement? _lastMeasurement;
  bool _isLoading = false;

  // Getters
  HeartRateMeasurement? get lastMeasurement => _lastMeasurement;
  bool get isLoading => _isLoading;
  bool get hasLastMeasurement => _lastMeasurement != null;

  /// Load the last measurement from SharedPreferences
  Future<void> loadLastMeasurement() async {
    _isLoading = true;
    notifyListeners();

    try {
      final prefs = await SharedPreferences.getInstance();
      final lastHeartRate = prefs.getInt('last_heart_rate');
      final lastTimestamp = prefs.getString('last_timestamp');

      if (lastHeartRate != null && lastTimestamp != null) {
        _lastMeasurement = HeartRateMeasurement(
          heartRate: lastHeartRate,
          timestamp: DateTime.parse(lastTimestamp),
          stress: _calculateStressLevel(lastHeartRate),
          tension: _calculateTensionLevel(lastHeartRate),
          energy: _calculateEnergyLevel(lastHeartRate),
        );
      }
    } catch (e) {
      debugPrint('Error loading last measurement: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Calculate stress level based on heart rate
  int _calculateStressLevel(int heartRate) {
    if (heartRate < 60) return 1;
    if (heartRate < 80) return 2;
    if (heartRate < 100) return 3;
    if (heartRate < 120) return 4;
    return 5;
  }

  /// Calculate tension level based on heart rate
  int _calculateTensionLevel(int heartRate) {
    if (heartRate < 70) return 1;
    if (heartRate < 90) return 2;
    if (heartRate < 110) return 3;
    if (heartRate < 130) return 4;
    return 5;
  }

  /// Calculate energy level based on heart rate
  int _calculateEnergyLevel(int heartRate) {
    if (heartRate < 60) return 2;
    if (heartRate < 80) return 5;
    if (heartRate < 100) return 4;
    if (heartRate < 120) return 3;
    return 2;
  }

  /// Clear the last measurement
  void clearLastMeasurement() {
    _lastMeasurement = null;
    notifyListeners();
  }

  /// Refresh data
  Future<void> refresh() async {
    await loadLastMeasurement();
  }
}
