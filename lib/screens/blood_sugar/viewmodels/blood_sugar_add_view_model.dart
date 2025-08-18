import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../models/blood_sugar_measurement.dart';
import '../../../services/blood_sugar_service.dart';

class BloodSugarAddViewModel extends ChangeNotifier {
  final BloodSugarService _service = BloodSugarService();
  final TextEditingController noteController = TextEditingController();
  final Uuid _uuid = const Uuid();

  DateTime _selectedDateTime = DateTime.now();
  String _selectedUnit = 'mg/dL';
  double _bloodSugarValue = 115.0;
  BloodSugarState _selectedState = BloodSugarState.default_;
  String _selectedGender = 'Male';
  int _selectedAge = 28;
  bool _isEditing = false;
  String? _editingId;

  // Getters
  DateTime get selectedDateTime => _selectedDateTime;
  String get selectedUnit => _selectedUnit;
  double get bloodSugarValue => _bloodSugarValue;
  BloodSugarState get selectedState => _selectedState;
  String get selectedGender => _selectedGender;
  int get selectedAge => _selectedAge;
  bool get isEditing => _isEditing;

  void setDateTime(DateTime dateTime) {
    _selectedDateTime = dateTime;
    notifyListeners();
  }

  void setUnit(String unit) {
    if (_selectedUnit != unit) {
      _selectedUnit = unit;
      // Convert the current value to the new unit
      if (unit == 'mmol/L') {
        _bloodSugarValue = _bloodSugarValue * 0.0555; // mg/dL to mmol/L
      } else {
        _bloodSugarValue = _bloodSugarValue / 0.0555; // mmol/L to mg/dL
      }
      notifyListeners();
    }
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

  void setAge(int age) {
    if (age >= 1 && age <= 120) {
      _selectedAge = age;
      notifyListeners();
    }
  }

  void setEditingMeasurement(BloodSugarMeasurement measurement) {
    _isEditing = true;
    _editingId = measurement.id;
    _selectedDateTime = measurement.timestamp;
    _bloodSugarValue = measurement.value;
    _selectedState = measurement.state;
    _selectedGender = measurement.gender;
    _selectedAge = measurement.age;
    noteController.text = measurement.note ?? '';
    notifyListeners();
  }

  Future<void> saveMeasurement() async {
    try {
      // Convert mmol/L to mg/dL for storage if needed
      double valueInMgDl = _selectedUnit == 'mmol/L'
          ? _bloodSugarValue / 0.0555
          : _bloodSugarValue;

      final measurement = BloodSugarMeasurement(
        id: _isEditing ? _editingId! : _uuid.v4(),
        value: valueInMgDl,
        state: _selectedState,
        timestamp: _selectedDateTime,
        note: noteController.text.isNotEmpty ? noteController.text : null,
        gender: _selectedGender,
        age: _selectedAge,
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
