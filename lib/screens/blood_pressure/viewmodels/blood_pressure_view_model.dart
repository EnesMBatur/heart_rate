import 'package:flutter/material.dart';
import '../../../models/blood_pressure_measurement.dart';
import '../../../services/blood_pressure_service.dart';

class BloodPressureViewModel extends ChangeNotifier {
  final BloodPressureService _service = BloodPressureService();

  List<BloodPressureMeasurement> _measurements = [];
  bool _isLoading = false;
  bool _showStatistics = true;
  String _selectedPeriod = 'Week';
  String _selectedTimeRange = 'Week';
  BloodPressureMeasurement? _selectedMeasurement;

  List<BloodPressureMeasurement> get measurements => _measurements;
  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  String get selectedPeriod => _selectedPeriod;
  String get selectedTimeRange => _selectedTimeRange;
  BloodPressureMeasurement? get selectedMeasurement => _selectedMeasurement;
  List<BloodPressureMeasurement> get recentMeasurements => _measurements;
  int get totalRecords => _measurements.length;

  BloodPressureViewModel() {
    loadMeasurements();
  }

  Future<void> loadMeasurements() async {
    _isLoading = true;
    notifyListeners();

    try {
      _measurements = await _service.getMeasurements();
      // En son eklenen/güncellenen üstte olacak şekilde sırala
      _measurements.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } catch (e) {
      debugPrint('Error loading measurements: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addMeasurement(BloodPressureMeasurement measurement) async {
    try {
      await _service.saveMeasurement(measurement);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error adding measurement: $e');
    }
  }

  Future<void> refresh() async {
    await loadMeasurements();
  }

  void toggleStatistics() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void toggleView() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void selectMeasurement(BloodPressureMeasurement measurement) {
    _selectedMeasurement = measurement;
    notifyListeners();
  }

  void setTimeRange(String timeRange) {
    _selectedTimeRange = timeRange;
    notifyListeners();
  }

  Future<void> updateMeasurement(BloodPressureMeasurement measurement) async {
    try {
      // First delete the old measurement, then add the updated one
      await _service.deleteMeasurement(measurement.id);
      await _service.saveMeasurement(measurement);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error updating measurement: $e');
    }
  }

  Future<void> deleteMeasurement(BloodPressureMeasurement measurement) async {
    try {
      await _service.deleteMeasurement(measurement.id);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error deleting measurement: $e');
    }
  }

  // Stats calculations
  Map<String, dynamic> getStats() {
    if (_measurements.isEmpty) {
      return {
        'systolicAvg': 0,
        'diastolicAvg': 0,
        'pulseAvg': 0,
        'totalMeasurements': 0,
      };
    }

    final systolicSum = _measurements.fold<int>(
      0,
      (sum, m) => sum + m.systolic,
    );
    final diastolicSum = _measurements.fold<int>(
      0,
      (sum, m) => sum + m.diastolic,
    );
    final pulseSum = _measurements.fold<int>(0, (sum, m) => sum + m.pulse);

    return {
      'systolicAvg': (systolicSum / _measurements.length).round(),
      'diastolicAvg': (diastolicSum / _measurements.length).round(),
      'pulseAvg': (pulseSum / _measurements.length).round(),
      'totalMeasurements': _measurements.length,
    };
  }
}
