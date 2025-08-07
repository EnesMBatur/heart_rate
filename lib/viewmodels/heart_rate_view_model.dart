import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import '../services/heart_rate_service.dart';

class HeartRateViewModel extends ChangeNotifier {
  // Constants
  static const int _initialSampleCount = 900;
  static const int _maxRecentHrCount = 16;
  static const double _frameRate = 25.0;

  // Measurement state
  bool _isMeasuring = false;
  bool _measurementCompleted = false;
  int _validMeasurements = 0;

  // Heart rate data
  final List<double> _heartRateValues = [];
  final List<int> _recentHeartRates = [];
  int _currentHeartRate = 0;
  double _signalQuality = 0.0;
  double _currentHRV = 0.0;

  // Getters
  bool get isMeasuring => _isMeasuring;
  bool get measurementCompleted => _measurementCompleted;
  int get validMeasurements => _validMeasurements;
  int get currentHeartRate => _currentHeartRate;
  double get signalQuality => _signalQuality;
  double get currentHRV => _currentHRV;
  int get sampleCount => _heartRateValues.length;

  // Callback for measurement completion
  VoidCallback? onMeasurementComplete;

  /// Start measurement
  void startMeasurement() {
    _isMeasuring = true;
    _measurementCompleted = false;
    _validMeasurements = 0;
    _heartRateValues.clear();
    _recentHeartRates.clear();
    _currentHeartRate = 0;
    _signalQuality = 0.0;
    _currentHRV = 0.0;
    notifyListeners();
  }

  /// Stop measurement
  void stopMeasurement() {
    _isMeasuring = false;
    notifyListeners();
  }

  /// Process new camera image
  void processImage(CameraImage image) {
    if (!_isMeasuring || _measurementCompleted) return;

    // Calculate intensity
    final intensity = HeartRateService.calculateAverageIntensity(image);

    // Check finger presence
    final isFingerPresent = HeartRateService.isFingerPresent(intensity);

    debugPrint(
      '🔍 Finger detect: intensity=${intensity.toInt()}, threshold=${HeartRateService.fingerThreshold} -> $isFingerPresent',
    );

    if (!isFingerPresent) {
      _currentHeartRate = 0;
      _signalQuality = 0.0;
      notifyListeners();
      return;
    }

    // Add intensity data
    _heartRateValues.add(intensity);

    // Debug logging
    if (_heartRateValues.length % 30 == 0) {
      debugPrint(
        '📊 Veri Toplama: ${_heartRateValues.length} örnek, Son değer: ${intensity.toInt()}',
      );
    }

    // Analyze when we have enough data
    if (_heartRateValues.length >= _initialSampleCount) {
      _performAnalysis();
    }
  }

  /// Perform PPG analysis
  void _performAnalysis() {
    final analysisResult = HeartRateService.performAdvancedAnalysis(
      _heartRateValues,
      initialSampleCount: _initialSampleCount,
      qualityThreshold: 0.7,
      frameRate: _frameRate,
    );

    if (analysisResult != null) {
      _validMeasurements++;

      // Add to recent heart rates
      _recentHeartRates.add(analysisResult['heartRate'] as int);
      if (_recentHeartRates.length > _maxRecentHrCount) {
        _recentHeartRates.removeAt(0);
      }

      // Calculate median for smoothing
      final sortedRates = List<int>.from(_recentHeartRates)..sort();
      final medianRate = sortedRates[sortedRates.length ~/ 2];

      _currentHeartRate = medianRate;
      _currentHRV = analysisResult['hrv'] as double;
      _signalQuality = analysisResult['quality'] as double;

      debugPrint(
        '✅ Kaliteli Ölçüm: $_currentHeartRate BPM, HRV: ${_currentHRV.toStringAsFixed(2)}, Kalite: ${(_signalQuality * 100).toInt()}%',
      );

      // Check if measurement should complete
      if (_shouldCompleteMeasurement()) {
        debugPrint('🎯 Ölçüm tamamlandı - yeterli kaliteli veri toplandı');
        _measurementCompleted = true;
        onMeasurementComplete?.call();
      }

      notifyListeners();
    } else {
      debugPrint('❌ Düşük kaliteli sinyal - devam ediliyor');
    }

    // Sliding window: remove oldest samples
    if (_heartRateValues.length > _initialSampleCount) {
      _heartRateValues.removeRange(0, 30);
    }
  }

  /// Check if measurement should complete
  bool _shouldCompleteMeasurement() {
    // Need at least 8 quality measurements
    if (_validMeasurements < 8) return false;

    // Check stability of recent measurements
    if (_recentHeartRates.length >= 4) {
      final avg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final maxDeviation = _recentHeartRates
          .map((hr) => (hr - avg).abs())
          .reduce((a, b) => a > b ? a : b);

      final isStable = maxDeviation <= 8.0;
      final isValidHRV = _currentHRV > 5.0;
      final isGoodQuality = _signalQuality > 0.8;

      debugPrint(
        '🎯 Tamamlama Kontrolü: Stable=$isStable (dev=${maxDeviation.toInt()}), HRV=$isValidHRV (${_currentHRV.toInt()}), Quality=$isGoodQuality (${(_signalQuality * 100).toInt()}%)',
      );

      return isStable && isValidHRV && isGoodQuality;
    }

    return false;
  }

  /// Get progress percentage
  double get progress {
    if (_measurementCompleted) return 1.0;
    if (_validMeasurements > 0) {
      return (_validMeasurements / 8).clamp(0.0, 1.0);
    }
    return 0.1;
  }

  /// Get status message
  String getStatusMessage() {
    if (_measurementCompleted) {
      return 'Kaliteli ölçüm tamamlandı!';
    } else if (_validMeasurements > 0) {
      return 'Kaliteli veri: $_validMeasurements/8 | HRV: ${_currentHRV.toStringAsFixed(1)} | Kalite: ${(_signalQuality * 100).toInt()}%';
    } else {
      return 'Nabız analiz ediliyor...';
    }
  }

  @override
  void dispose() {
    _heartRateValues.clear();
    _recentHeartRates.clear();
    super.dispose();
  }
}
