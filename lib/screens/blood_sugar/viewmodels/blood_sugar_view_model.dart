import 'package:flutter/material.dart';
import '../../../models/blood_sugar_measurement.dart';
import '../../../services/blood_sugar_service.dart';

class BloodSugarViewModel extends ChangeNotifier {
  final BloodSugarService _service = BloodSugarService();

  List<BloodSugarMeasurement> _measurements = [];
  bool _isLoading = false;
  bool _showStatistics = true;
  String _selectedPeriod = 'Week';
  String _selectedTimeRange = '7 Days';
  BloodSugarMeasurement? _selectedMeasurement;

  List<BloodSugarMeasurement> get measurements => _measurements;
  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  String get selectedPeriod => _selectedPeriod;
  String get selectedTimeRange => _selectedTimeRange;
  BloodSugarMeasurement? get selectedMeasurement => _selectedMeasurement;
  List<BloodSugarMeasurement> get recentMeasurements => _measurements;
  int get totalRecords => _measurements.length;

  BloodSugarViewModel() {
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

  Future<void> addMeasurement(BloodSugarMeasurement measurement) async {
    try {
      await _service.saveMeasurement(measurement);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error adding measurement: $e');
    }
  }

  Future<void> updateMeasurement(BloodSugarMeasurement measurement) async {
    try {
      await _service.saveMeasurement(measurement);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error updating measurement: $e');
    }
  }

  Future<void> deleteMeasurement(BloodSugarMeasurement measurement) async {
    try {
      await _service.deleteMeasurement(measurement);
      await loadMeasurements(); // Refresh the list
    } catch (e) {
      debugPrint('Error deleting measurement: $e');
    }
  }

  void toggleView() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void setPeriod(String period) {
    _selectedPeriod = period;
    notifyListeners();
  }

  void setTimeRange(String timeRange) {
    _selectedTimeRange = timeRange;
    notifyListeners();
  }

  void setSelectedMeasurement(BloodSugarMeasurement? measurement) {
    _selectedMeasurement = measurement;
    notifyListeners();
  }

  Future<Map<String, dynamic>> getStatistics() async {
    return await _service.getStatistics();
  }

  List<BloodSugarMeasurement> getChartData() {
    final now = DateTime.now();
    DateTime startDate;

    switch (_selectedTimeRange) {
      case 'Today':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case '7 Days':
        startDate = now.subtract(const Duration(days: 7));
        break;
      case '14 Days':
        startDate = now.subtract(const Duration(days: 14));
        break;
      case '30 Days':
        startDate = now.subtract(const Duration(days: 30));
        break;
      default:
        startDate = now.subtract(const Duration(days: 7));
    }

    return _measurements
        .where((measurement) => measurement.timestamp.isAfter(startDate))
        .toList()
      ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
  }

  List<BloodSugarMeasurement> getMeasurementsByPeriod(String period) {
    final now = DateTime.now();
    DateTime startDate;

    switch (period) {
      case 'Day':
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case 'Week':
        startDate = now.subtract(const Duration(days: 7));
        break;
      case 'Month':
        startDate = now.subtract(const Duration(days: 30));
        break;
      case 'Year':
        startDate = now.subtract(const Duration(days: 365));
        break;
      default:
        startDate = now.subtract(const Duration(days: 7));
    }

    return _measurements
        .where((measurement) => measurement.timestamp.isAfter(startDate))
        .toList()
      ..sort((a, b) => b.timestamp.compareTo(a.timestamp));
  }
}
