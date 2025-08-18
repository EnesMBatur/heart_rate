import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/heart_rate_measurement.dart';
import '../../../services/blood_pressure_service.dart';
import '../../../services/blood_sugar_service.dart';

class HomeViewModel extends ChangeNotifier {
  HeartRateMeasurement? _lastMeasurement;
  bool _isLoading = false;
  int _heartRateRecords = 0;
  int _bloodPressureRecords = 0;
  int _bloodSugarRecords = 0;
  int _weightBmiRecords = 0;

  // Getters
  HeartRateMeasurement? get lastMeasurement => _lastMeasurement;
  bool get isLoading => _isLoading;
  bool get hasLastMeasurement => _lastMeasurement != null;
  int get heartRateRecords => _heartRateRecords;
  int get bloodPressureRecords => _bloodPressureRecords;
  int get bloodSugarRecords => _bloodSugarRecords;
  int get weightBmiRecords => _weightBmiRecords;

  /// Initialize the ViewModel
  Future<void> initialize() async {
    _isLoading = true;
    notifyListeners();

    await Future.wait([_loadLastMeasurement(), _loadRecordCounts()]);

    _isLoading = false;
    notifyListeners();
  }

  /// Load the last measurement from SharedPreferences
  Future<void> _loadLastMeasurement() async {
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
    }
  }

  /// Load record counts from SharedPreferences
  Future<void> _loadRecordCounts() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // Load heart rate history count
      final heartRateHistory = prefs.getStringList('heart_rate_history') ?? [];
      _heartRateRecords = heartRateHistory.length;

      // Load blood pressure records count from service
      final bloodPressureService = BloodPressureService();
      final bloodPressureMeasurements = await bloodPressureService
          .getMeasurements();
      _bloodPressureRecords = bloodPressureMeasurements.length;

      // Load blood sugar records count from service
      final bloodSugarService = BloodSugarService();
      final bloodSugarMeasurements = await bloodSugarService.getMeasurements();
      _bloodSugarRecords = bloodSugarMeasurements.length;

      // For now, we'll set mock values for other records
      // These can be implemented later when those features are added
      _weightBmiRecords = prefs.getInt('weight_bmi_records') ?? 0;
    } catch (e) {
      debugPrint('Error loading record counts: $e');
    }
  }

  /// Refresh all data
  Future<void> refresh() async {
    await initialize();
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
}
