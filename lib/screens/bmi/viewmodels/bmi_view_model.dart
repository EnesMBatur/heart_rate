import 'package:flutter/material.dart';
import '../../../models/bmi_record.dart';
import '../../../services/bmi_service.dart';
import '../../../services/event_bus.dart';

class BMIViewModel extends ChangeNotifier {
  final BMIService _service = BMIService();
  bool _isLoading = false;
  bool _showStatistics = true;
  String _selectedTimeRange = '7 Days';
  List<BMIRecord> _records = [];

  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  String get selectedTimeRange => _selectedTimeRange;
  List<BMIRecord> get records => _records;
  int get totalRecords => _records.length;

  BMIViewModel() {
    load();
  }

  Future<void> load() async {
    _isLoading = true;
    notifyListeners();
    try {
      _records = await _service.getRecords();
      _records.sort((a, b) => b.timestamp.compareTo(a.timestamp));
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> add(BMIRecord record) async {
    await _service.saveRecord(record);
    await load();

    // Home screen'i güncellemek için event gönder
    EventBus().fire('bmi_data_changed');
  }

  Future<void> update(BMIRecord record) async {
    await _service.saveRecord(record);
    await load();
  }

  Future<void> delete(String id) async {
    await _service.deleteRecord(id);
    await load();
  }

  Future<void> deleteRecord(BMIRecord record) async {
    await _service.deleteRecord(record.id);
    await load();

    // Home screen'i güncellemek için event gönder
    EventBus().fire('bmi_data_changed');
  }

  Future<Map<String, dynamic>> stats() => _service.getStatistics();

  void toggleView() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void setTimeRange(String value) {
    _selectedTimeRange = value;
    notifyListeners();
  }

  List<BMIRecord> getChartData() {
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

    final filteredRecords = _records
        .where((record) => record.timestamp.isAfter(startDate))
        .toList();

    filteredRecords.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return filteredRecords;
  }
}
