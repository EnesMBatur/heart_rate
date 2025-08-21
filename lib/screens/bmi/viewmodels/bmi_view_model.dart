import 'package:flutter/material.dart';
import '../../../models/bmi_record.dart';
import '../../../services/bmi_service.dart';

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
  }

  Future<void> update(BMIRecord record) async {
    await _service.saveRecord(record);
    await load();
  }

  Future<void> delete(String id) async {
    await _service.deleteRecord(id);
    await load();
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
}
