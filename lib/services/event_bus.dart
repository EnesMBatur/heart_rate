import 'dart:async';

/// Simple Event Bus for global state notifications
class EventBus {
  static final EventBus _instance = EventBus._internal();
  factory EventBus() => _instance;
  EventBus._internal();

  final StreamController<String> _eventController =
      StreamController<String>.broadcast();

  Stream<String> get events => _eventController.stream;

  void fire(String event) {
    _eventController.add(event);
  }

  void dispose() {
    _eventController.close();
  }
}

/// Event types
class Events {
  static const String heartRateDataChanged = 'heart_rate_data_changed';
  static const String bloodOxygenDataChanged = 'blood_oxygen_data_changed';
  static const String bloodPressureDataChanged = 'blood_pressure_data_changed';
  static const String bloodSugarDataChanged = 'blood_sugar_data_changed';
  static const String bmiDataChanged = 'bmi_data_changed';
}
