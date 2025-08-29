import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../../../models/bmi_record.dart';
import '../../../services/bmi_service.dart';
import '../../../services/event_bus.dart';

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

enum BMICategory {
  verySevereUnderweight,
  severeUnderweight,
  underweight,
  normal,
  overweight,
  obeseClass1,
  obeseClass2,
  obeseClass3;

  String get localizedName {
    switch (this) {
      case BMICategory.verySevereUnderweight:
        return LocaleKeys.bmi_categories_very_severe_underweight.tr();
      case BMICategory.severeUnderweight:
        return LocaleKeys.bmi_categories_severe_underweight.tr();
      case BMICategory.underweight:
        return LocaleKeys.bmi_categories_underweight.tr();
      case BMICategory.normal:
        return LocaleKeys.bmi_categories_normal.tr();
      case BMICategory.overweight:
        return LocaleKeys.bmi_categories_overweight.tr();
      case BMICategory.obeseClass1:
        return LocaleKeys.bmi_categories_obese_class_1.tr();
      case BMICategory.obeseClass2:
        return LocaleKeys.bmi_categories_obese_class_2.tr();
      case BMICategory.obeseClass3:
        return LocaleKeys.bmi_categories_obese_class_3.tr();
    }
  }

  String get rangeText {
    switch (this) {
      case BMICategory.verySevereUnderweight:
        return LocaleKeys.bmi_ranges_very_severe_underweight.tr();
      case BMICategory.severeUnderweight:
        return LocaleKeys.bmi_ranges_severe_underweight.tr();
      case BMICategory.underweight:
        return LocaleKeys.bmi_ranges_underweight.tr();
      case BMICategory.normal:
        return LocaleKeys.bmi_ranges_normal.tr();
      case BMICategory.overweight:
        return LocaleKeys.bmi_ranges_overweight.tr();
      case BMICategory.obeseClass1:
        return LocaleKeys.bmi_ranges_obese_class_1.tr();
      case BMICategory.obeseClass2:
        return LocaleKeys.bmi_ranges_obese_class_2.tr();
      case BMICategory.obeseClass3:
        return LocaleKeys.bmi_ranges_obese_class_3.tr();
    }
  }

  Color get color {
    switch (this) {
      case BMICategory.verySevereUnderweight:
        return const Color(0xFF1976D2);
      case BMICategory.severeUnderweight:
        return const Color(0xFF42A5F5);
      case BMICategory.underweight:
        return const Color(0xFF26C6DA);
      case BMICategory.normal:
        return const Color(0xFF4CAF50);
      case BMICategory.overweight:
        return const Color(0xFFFFC107);
      case BMICategory.obeseClass1:
        return const Color(0xFFFF9800);
      case BMICategory.obeseClass2:
        return const Color(0xFFF44336);
      case BMICategory.obeseClass3:
        return const Color(0xFFD32F2F);
    }
  }
}

class BMIViewModel extends ChangeNotifier {
  final BMIService _service = BMIService();
  bool _isLoading = false;
  bool _showStatistics = true;
  TimeRange _selectedTimeRange = TimeRange.days7;
  List<BMIRecord> _records = [];

  bool get isLoading => _isLoading;
  bool get showStatistics => _showStatistics;
  TimeRange get selectedTimeRange => _selectedTimeRange;
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

  void setTimeRange(TimeRange value) {
    _selectedTimeRange = value;
    notifyListeners();
  }

  List<BMIRecord> getChartData() {
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
