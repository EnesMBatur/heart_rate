import 'package:flutter/foundation.dart';
import 'package:camera/camera.dart';
import '../services/heart_rate_service.dart';

class HeartRateViewModel extends ChangeNotifier {
  // Constants
  static const int _initialSampleCount = 400; // Reduced from 900 to 300
  static const int _minAnalysisSampleCount = 150; // Minimum for analysis
  static const int _maxRecentHrCount = 16;
  static const double _frameRate = 25.0;
  static const int _measurementDurationSeconds =
      30; // 30 seconds measurement duration
  static const int _minStableHeartRateSeconds =
      10; // Minimum time with stable heart rate

  // Measurement state
  bool _isMeasuring = false;
  bool _measurementCompleted = false;
  int _validMeasurements = 0;
  DateTime? _measurementStartTime;
  DateTime? _stableHeartRateStartTime;
  bool _hasFoundHeartRate = false;

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
    _measurementStartTime = DateTime.now();
    _stableHeartRateStartTime = null;
    _hasFoundHeartRate = false;
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

    // Start analyzing earlier - when we have at least 150 samples (6 seconds at 25fps)
    if (_heartRateValues.length >= _minAnalysisSampleCount) {
      _performAnalysis();
    }
  }

  /// Perform PPG analysis
  void _performAnalysis() {
    final analysisResult = HeartRateService.performAdvancedAnalysis(
      _heartRateValues,
      initialSampleCount: _minAnalysisSampleCount, // Use minimum sample count
      qualityThreshold: 0.7, // Slightly lower threshold for faster detection
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

      // İlk kez kalp atışı bulunduğunda zaman takibini başlat
      if (!_hasFoundHeartRate && _currentHeartRate > 0) {
        _hasFoundHeartRate = true;
        _stableHeartRateStartTime = DateTime.now();
        debugPrint(
          '🎯 İlk kalp atışı bulundu: $_currentHeartRate BPM - Zaman takibi başlatıldı',
        );
      }

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

    // Sliding window: remove oldest samples to keep data fresh
    if (_heartRateValues.length > _initialSampleCount) {
      _heartRateValues.removeRange(
        0,
        25,
      ); // Remove older samples more frequently
    }
  }

  /// Check if measurement should complete
  bool _shouldCompleteMeasurement() {
    // İlk kalp atışı henüz bulunmadıysa devam et
    if (!_hasFoundHeartRate || _stableHeartRateStartTime == null) {
      return false;
    }

    // Kalp atışı bulunduktan sonra en az minimum süre geçmeli
    final timeSinceHeartRateFound = DateTime.now().difference(
      _stableHeartRateStartTime!,
    );
    final hasMinimumTime =
        timeSinceHeartRateFound.inSeconds >= _minStableHeartRateSeconds;

    // En az minimum kaliteli ölçüm sayısı gerekli
    if (_validMeasurements < 8) return false;

    // Son ölçümlerin istikrarlı olup olmadığını kontrol et
    if (_recentHeartRates.length >= 4) {
      final avg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final maxDeviation = _recentHeartRates
          .map((hr) => (hr - avg).abs())
          .reduce((a, b) => a > b ? a : b);

      final isStable = maxDeviation <= 8.0; // Daha sıkı tolerans
      final isValidHRV = _currentHRV > 5.0; // Daha yüksek HRV gereksinimi
      final isGoodQuality =
          _signalQuality > 0.8; // Daha yüksek kalite gereksinimi

      // Toplam ölçüm süresi kontrolü (maksimum 30 saniye)
      final totalTime = DateTime.now().difference(_measurementStartTime!);
      final hasReachedMaxTime =
          totalTime.inSeconds >= _measurementDurationSeconds;

      debugPrint(
        '🎯 Tamamlama Kontrolü: Time=${timeSinceHeartRateFound.inSeconds}s/${_minStableHeartRateSeconds}s, Stable=$isStable (dev=${maxDeviation.toInt()}), HRV=$isValidHRV (${_currentHRV.toInt()}), Quality=$isGoodQuality (${(_signalQuality * 100).toInt()}%)',
      );

      // Ya yeterli zaman geçti ve kaliteli ya da maksimum zamana ulaşıldı
      return (hasMinimumTime && isStable && isValidHRV && isGoodQuality) ||
          hasReachedMaxTime;
    }

    return false;
  }

  /// Get progress percentage
  double get progress {
    if (_measurementCompleted) return 1.0;
    if (_validMeasurements > 0) {
      return (_validMeasurements / 6).clamp(0.0, 1.0); // Changed from 8 to 6
    }
    return 0.1;
  }

  /// Get status message
  String getStatusMessage() {
    if (_measurementCompleted) {
      return 'Kaliteli ölçüm tamamlandı!';
    } else if (_validMeasurements > 0) {
      return 'Kaliteli veri: $_validMeasurements/6 | HRV: ${_currentHRV.toStringAsFixed(1)} | Kalite: ${(_signalQuality * 100).toInt()}%';
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
