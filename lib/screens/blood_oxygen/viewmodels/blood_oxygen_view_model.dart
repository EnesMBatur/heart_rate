import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../models/blood_oxygen_record.dart';
import '../../../services/blood_oxygen_service.dart';
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

class BloodOxygenViewModel extends ChangeNotifier {
  final BloodOxygenService _service = BloodOxygenService();
  bool _isLoading = false;
  bool _showStatistics = true;
  TimeRange _selectedTimeRange = TimeRange.days7;
  List<BloodOxygenRecord> _records = [];

  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  TimeRange get selectedTimeRange => _selectedTimeRange;
  List<BloodOxygenRecord> get records => _records;
  int get totalRecords => _records.length;

  BloodOxygenViewModel() {
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

  Future<void> add(BloodOxygenRecord record) async {
    await _service.saveRecord(record);
    await load();

    // Home screen'i güncellemek için event gönder
    EventBus().fire('blood_oxygen_data_changed');
  }

  Future<void> update(BloodOxygenRecord record) async {
    await _service.saveRecord(record);
    await load();

    // Home screen'i güncellemek için event gönder
    EventBus().fire('blood_oxygen_data_changed');
  }

  Future<void> delete(String id) async {
    await _service.deleteRecord(id);
    await load();
  }

  Future<void> deleteRecord(BloodOxygenRecord record) async {
    await _service.deleteRecord(record.id);
    await load();
    notifyListeners();

    // Home screen'i güncellemek için event gönder
    EventBus().fire('blood_oxygen_data_changed');
  }

  Future<Map<String, dynamic>> stats() => _service.getStatistics();

  void toggleView() {
    _showStatistics = !_showStatistics;
    notifyListeners();
  }

  void setTimeRange(TimeRange value) {
    _selectedTimeRange = value;
    notifyListeners();
  }

  List<BloodOxygenRecord> getChartData() {
    final now = DateTime.now();
    DateTime startDate;

    switch (_selectedTimeRange) {
      case TimeRange.today:
        startDate = DateTime(now.year, now.month, now.day);
        break;
      case TimeRange.days7:
        startDate = now.subtract(const Duration(days: 7));
        break;
      case TimeRange.days14:
        startDate = now.subtract(const Duration(days: 14));
        break;
      case TimeRange.days30:
        startDate = now.subtract(const Duration(days: 30));
        break;
    }

    final filteredRecords = _records
        .where((record) => record.timestamp.isAfter(startDate))
        .toList();

    filteredRecords.sort((a, b) => a.timestamp.compareTo(b.timestamp));
    return filteredRecords;
  }
}
