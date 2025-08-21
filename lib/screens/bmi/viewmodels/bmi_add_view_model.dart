import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../models/bmi_record.dart';

class BMIAddViewModel extends ChangeNotifier {
  final TextEditingController noteController = TextEditingController();
  final _uuid = const Uuid();

  double _weight = 75; // kg
  double _height = 180; // cm
  DateTime _timestamp = DateTime.now();
  String? _editingId;

  double get weight => _weight;
  double get height => _height;
  DateTime get timestamp => _timestamp;
  bool get isEditing => _editingId != null;
  String? get editingId => _editingId;

  void setWeight(double v) {
    _weight = v;
    notifyListeners();
  }

  void setHeight(double v) {
    _height = v;
    notifyListeners();
  }

  void setTimestamp(DateTime dt) {
    _timestamp = dt;
    notifyListeners();
  }

  void setEditing(BMIRecord record) {
    _editingId = record.id;
    _weight = record.weightKg;
    _height = record.heightCm;
    _timestamp = record.timestamp;
    noteController.text = record.note ?? '';
    notifyListeners();
  }

  BMIRecord buildRecord() {
    return BMIRecord(
      id: isEditing ? _editingId! : _uuid.v4(),
      weightKg: double.parse(_weight.toStringAsFixed(1)),
      heightCm: double.parse(_height.toStringAsFixed(1)),
      timestamp: _timestamp,
      note: noteController.text.isNotEmpty ? noteController.text : null,
    );
  }

  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }
}
