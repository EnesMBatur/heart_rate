// lib/features/blood_sugar/add/viewmodels/blood_sugar_add_view_model.dart
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../../../models/blood_sugar_measurement.dart';
import '../../../services/blood_sugar_service.dart';

class BloodSugarAddViewModel extends ChangeNotifier {
  // Dönüşüm sabitleri
  static const double _MGDL_TO_MMOL = 0.0555;
  static const double _MMOL_TO_MGDL = 1 / _MGDL_TO_MMOL; // 18.018...

  final BloodSugarService _service = BloodSugarService();
  final TextEditingController noteController = TextEditingController();
  final Uuid _uuid = const Uuid();

  DateTime _selectedDateTime = DateTime.now();
  String _selectedUnit = 'mg/dL';
  double _bloodSugarValue = 100.0; // başlangıç: 100 mg/dL
  BloodSugarState _selectedState = BloodSugarState.default_;
  String _selectedGender = 'Male';
  bool _isEditing = false;
  String? _editingId;

  // Getters
  DateTime get selectedDateTime => _selectedDateTime;
  String get selectedUnit => _selectedUnit;
  double get bloodSugarValue => _bloodSugarValue;
  BloodSugarState get selectedState => _selectedState;
  String get selectedGender => _selectedGender;
  bool get isEditing => _isEditing;
  String? get editingId => _editingId;

  void setDateTime(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  /// Birim değiştirirken mevcut değeri hedef birime **dönüştürerek** korur.
  /// Erken yuvarlama yapılmaz (sadece gösterimde 1 ondalık görünsün).
  void setUnit(String unit) {
    if (_selectedUnit == unit) return;

    if (_selectedUnit == 'mg/dL' && unit == 'mmol/L') {
      _bloodSugarValue = _bloodSugarValue * _MGDL_TO_MMOL; // 100 -> 5.55
    } else if (_selectedUnit == 'mmol/L' && unit == 'mg/dL') {
      _bloodSugarValue = _bloodSugarValue * _MMOL_TO_MGDL; // 5.55 -> ~100
    }

    _selectedUnit = unit;
    notifyListeners();
  }

  void setBloodSugarValue(double value) {
    _bloodSugarValue = value;
    notifyListeners();
  }

  void setState(BloodSugarState state) {
    _selectedState = state;
    notifyListeners();
  }

  void setGender(String gender) {
    _selectedGender = gender;
    notifyListeners();
  }

  void setEditingMeasurement(BloodSugarMeasurement measurement) {
    _isEditing = true;
    _editingId = measurement.id;
    _selectedDateTime = measurement.timestamp;

    // Depoda mg/dL tuttuğunu varsayıyoruz -> ekranda mg/dL ile aç
    _selectedUnit = 'mg/dL';
    _bloodSugarValue = measurement.value; // erken yuvarlama yok

    _selectedState = measurement.state;
    noteController.text = measurement.note ?? '';
    notifyListeners();
  }

  Future<void> saveMeasurement() async {
    try {
      // Depolamada mg/dL kullan (kaydetmeden 1 ondalığa yuvarlayabilirsin)
      final double valueInMgDl = _selectedUnit == 'mmol/L'
          ? _bloodSugarValue * _MMOL_TO_MGDL
          : _bloodSugarValue;

      final measurement = BloodSugarMeasurement(
        id: _isEditing ? _editingId! : _uuid.v4(),
        value: double.parse(valueInMgDl.toStringAsFixed(1)), // örn. 100.0
        state: _selectedState,
        timestamp: _selectedDateTime,
        note: noteController.text.isNotEmpty ? noteController.text : null,
      );

      await _service.saveMeasurement(measurement);
    } catch (e) {
      throw Exception('Failed to save measurement: $e');
    }
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
