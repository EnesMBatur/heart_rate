import 'package:flutter/material.dart';
import '../../../models/blood_pressure_measurement.dart';
import '../../../services/blood_pressure_service.dart';

class BloodPressureViewModel extends ChangeNotifier {
  final BloodPressureService _service = BloodPressureService();

  List<BloodPressureMeasurement> _measurements = [];
  bool _isLoading = false;
  bool _showStatistics = true;
  String _selectedPeriod = 'Week';
  String _selectedTimeRange = '7 Days';
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

  // Get measurements filtered by time range
  List<BloodPressureMeasurement> getFilteredMeasurements() {
    final now = DateTime.now();
    int daysToSubtract;

    switch (_selectedTimeRange) {
      case 'Today':
        daysToSubtract = 0;
        break;
      case '7 Days':
        daysToSubtract = 7;
        break;
      case '14 Days':
        daysToSubtract = 14;
        break;
      case '30 Days':
        daysToSubtract = 30;
        break;
      default:
        daysToSubtract = 7;
    }

    final startDate = DateTime(now.year, now.month, now.day - daysToSubtract);

    return _measurements.where((measurement) {
      return measurement.timestamp.isAfter(startDate) ||
          measurement.timestamp.isAtSameMomentAs(startDate);
    }).toList();
  }

  // Get chart data - return individual measurements instead of grouped by date
  List<BloodPressureMeasurement> getChartData() {
    final filteredMeasurements = getFilteredMeasurements();

    // Sort measurements by timestamp (oldest to newest for chart display)
    filteredMeasurements.sort((a, b) => a.timestamp.compareTo(b.timestamp));

    return filteredMeasurements;
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
    final filteredMeasurements = getFilteredMeasurements();

    if (filteredMeasurements.isEmpty) {
      return {
        'systolicAvg': 0,
        'diastolicAvg': 0,
        'pulseAvg': 0,
        'totalMeasurements': 0,
      };
    }

    final systolicSum = filteredMeasurements.fold<int>(
      0,
      (sum, m) => sum + m.systolic,
    );
    final diastolicSum = filteredMeasurements.fold<int>(
      0,
      (sum, m) => sum + m.diastolic,
    );
    final pulseSum = filteredMeasurements.fold<int>(
      0,
      (sum, m) => sum + m.pulse,
    );

    return {
      'systolicAvg': (systolicSum / filteredMeasurements.length).round(),
      'diastolicAvg': (diastolicSum / filteredMeasurements.length).round(),
      'pulseAvg': (pulseSum / filteredMeasurements.length).round(),
      'totalMeasurements': filteredMeasurements.length,
    };
  }
}
