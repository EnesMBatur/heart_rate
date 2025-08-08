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
  int _consecutiveNoFingerFrames = 0;

  // Getters
  bool get isMeasuring => _isMeasuring;
  bool get measurementCompleted => _measurementCompleted;
  int get validMeasurements => _validMeasurements;
  int get currentHeartRate => _currentHeartRate;
  double get signalQuality => _signalQuality;
  double get currentHRV => _currentHRV;
  int get sampleCount => _heartRateValues.length;
  bool get isCalibrating =>
      _isMeasuring && _heartRateValues.length < _minAnalysisSampleCount;

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
    _consecutiveNoFingerFrames = 0;
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
      '🔍 Finger detect: intensity=${intensity.toInt()} -> $isFingerPresent',
    );

    if (!isFingerPresent) {
      _consecutiveNoFingerFrames++;
      _currentHeartRate = 0;
      _signalQuality = 0.0;

      // Clear data if finger has been missing for too long (3 seconds)
      if (_consecutiveNoFingerFrames > 75) {
        // 3 seconds at 25fps
        _heartRateValues.clear();
        _recentHeartRates.clear();
        _validMeasurements = 0;
        _hasFoundHeartRate = false;
        _stableHeartRateStartTime = null;
        debugPrint('🧹 Parmak uzun süre bulunamadı - veriler temizlendi');
      }

      notifyListeners();
      return;
    }

    // Finger detected - reset counters
    _consecutiveNoFingerFrames = 0;

    // Add intensity data
    _heartRateValues.add(intensity);

    // Debug logging - more frequent for testing
    if (_heartRateValues.length % 10 == 0) {
      // Changed from 30 to 10
      debugPrint(
        '📊 Veri Toplama: ${_heartRateValues.length} örnek, Son değer: ${intensity.toInt()}, Parmak: $isFingerPresent',
      );
    }

    // Start analyzing earlier - when we have at least 150 samples (6 seconds at 25fps)
    if (_heartRateValues.length >= _minAnalysisSampleCount) {
      _performAnalysis();
    }
  }

  /// Perform PPG analysis with enhanced validation
  void _performAnalysis() {
    // Try ultra-advanced analysis first (with filtering and enhanced validation)
    var analysisResult = HeartRateService.performUltraAdvancedAnalysis(
      _heartRateValues,
      initialSampleCount: _minAnalysisSampleCount,
      qualityThreshold: 0.75, // Higher threshold for better quality
      frameRate: _frameRate,
    );

    // Fallback to standard analysis if ultra-advanced fails
    analysisResult ??= HeartRateService.performAdvancedAnalysis(
      _heartRateValues,
      initialSampleCount: _minAnalysisSampleCount,
      qualityThreshold: 0.7, // Slightly lower fallback threshold
      frameRate: _frameRate,
    );

    if (analysisResult != null) {
      final heartRate = analysisResult['heartRate'] as int;
      final quality = analysisResult['quality'] as double;
      final hrv = analysisResult['hrv'] as double;
      final rrConsistency = analysisResult['rrConsistency'] as double;
      final isFiltered = analysisResult['filteredSignalUsed'] as bool? ?? false;

      // Enhanced validation: Reject unrealistic readings
      if (!_isRealisticHeartRate(heartRate, quality, hrv, rrConsistency)) {
        debugPrint(
          '❌ Sahte sinyal tespit edildi - HR: $heartRate, Q: ${(quality * 100).toInt()}%, HRV: $hrv, Consistency: ${(rrConsistency * 100).toInt()}%',
        );
        return;
      }

      _validMeasurements++;

      // Add to recent heart rates
      _recentHeartRates.add(heartRate);
      if (_recentHeartRates.length > _maxRecentHrCount) {
        _recentHeartRates.removeAt(0);
      }

      // Calculate median for smoothing
      final sortedRates = List<int>.from(_recentHeartRates)..sort();
      final medianRate = sortedRates[sortedRates.length ~/ 2];

      _currentHeartRate = medianRate;
      _currentHRV = hrv;
      _signalQuality = quality;

      // İlk kez kalp atışı bulunduğunda zaman takibini başlat
      if (!_hasFoundHeartRate && _currentHeartRate > 0) {
        _hasFoundHeartRate = true;
        _stableHeartRateStartTime = DateTime.now();
        debugPrint(
          '🎯 İlk kalp atışı bulundu: $_currentHeartRate BPM - Zaman takibi başlatıldı${isFiltered ? ' (Filtered)' : ''}',
        );
      }

      debugPrint(
        '✅ Kaliteli Ölçüm: $_currentHeartRate BPM, HRV: ${_currentHRV.toStringAsFixed(2)}, Kalite: ${(_signalQuality * 100).toInt()}%, Consistency: ${(rrConsistency * 100).toInt()}%${isFiltered ? ' [FILTERED]' : ''}',
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

  /// Enhanced validation for more realistic heart rate readings
  bool _isRealisticHeartRate(
    int heartRate,
    double quality,
    double hrv,
    double rrConsistency,
  ) {
    // Basic range check - more lenient range for edge cases
    if (heartRate < 40 || heartRate > 200) return false;

    // Quality threshold - adaptive based on conditions
    final minQuality = _recentHeartRates.length < 3
        ? 0.6
        : 0.7; // More lenient initially
    if (quality < minQuality) return false;

    // HRV reasonableness - more realistic range
    if (hrv < 3 || hrv > 200) return false;

    // R-R interval consistency - adaptive based on measurement phase
    final minConsistency = _validMeasurements < 3
        ? 0.5
        : 0.6; // More lenient initially
    if (rrConsistency < minConsistency) return false;

    // Context check: if we have previous readings, new reading shouldn't be too different
    if (_recentHeartRates.isNotEmpty) {
      final avgRecent =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final deviation = (heartRate - avgRecent).abs();

      // More lenient deviation threshold for natural variations
      final maxDeviation = _recentHeartRates.length < 3
          ? 35
          : 25; // Allow more variation initially
      if (deviation > maxDeviation) return false;
    }

    // Additional check: ensure HRV is reasonable for the heart rate
    // Generally, higher heart rates tend to have lower HRV
    if (heartRate > 120 && hrv > 80)
      return false; // High HR with very high HRV is suspicious
    if (heartRate < 50 && hrv < 8)
      return false; // Very low HR with very low HRV is suspicious

    return true;
  }

  /// Enhanced measurement completion logic with faster response
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

    // Dynamic minimum measurement count based on signal quality
    final minMeasurements = _signalQuality > 0.85
        ? 4
        : 6; // Fewer measurements needed for excellent signal
    if (_validMeasurements < minMeasurements) return false;

    // Son ölçümlerin istikrarlı olup olmadığını kontrol et
    if (_recentHeartRates.length >= 3) {
      // Reduced from 4 for faster response
      final avg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final maxDeviation = _recentHeartRates
          .map((hr) => (hr - avg).abs())
          .reduce((a, b) => a > b ? a : b);

      // Dynamic stability threshold based on signal quality
      final stabilityThreshold = _signalQuality > 0.85
          ? 6.0
          : 8.0; // Tighter for high quality
      final isStable = maxDeviation <= stabilityThreshold;

      // Dynamic HRV threshold based on heart rate
      final minHRV = _currentHeartRate > 100
          ? 3.0
          : 5.0; // Lower threshold for higher HR
      final isValidHRV = _currentHRV > minHRV;

      // Dynamic quality threshold based on measurement count
      final qualityThreshold = _validMeasurements >= 8
          ? 0.75
          : 0.8; // More lenient with more data
      final isGoodQuality = _signalQuality > qualityThreshold;

      // Toplam ölçüm süresi kontrolü (maksimum 30 saniye)
      final totalTime = DateTime.now().difference(_measurementStartTime!);
      final hasReachedMaxTime =
          totalTime.inSeconds >= _measurementDurationSeconds;

      // Early completion for excellent signals
      final hasExcellentSignal =
          _signalQuality > 0.9 &&
          isStable &&
          isValidHRV &&
          _validMeasurements >= 4 &&
          timeSinceHeartRateFound.inSeconds >= 8;

      debugPrint(
        '🎯 Tamamlama Kontrolü: Time=${timeSinceHeartRateFound.inSeconds}s/${_minStableHeartRateSeconds}s, '
        'Stable=$isStable (dev=${maxDeviation.toInt()}, threshold=${stabilityThreshold.toInt()}), '
        'HRV=$isValidHRV (${_currentHRV.toInt()}, min=${minHRV.toInt()}), '
        'Quality=$isGoodQuality (${(_signalQuality * 100).toInt()}%, min=${(qualityThreshold * 100).toInt()}%), '
        'Measurements=$_validMeasurements/$minMeasurements, '
        'Excellent=$hasExcellentSignal',
      );

      // Enhanced completion criteria
      return hasExcellentSignal || // Early completion for excellent signals
          (hasMinimumTime &&
              isStable &&
              isValidHRV &&
              isGoodQuality) || // Normal completion
          hasReachedMaxTime; // Timeout completion
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

  /// Get enhanced status message with more detailed feedback
  String getStatusMessage() {
    if (isCalibrating) {
      return 'Gelişmiş sinyal analizi... Parmağınızı kameranın üzerine yerleştirin ve sabit tutun.';
    } else if (_measurementCompleted) {
      return 'Yüksek kaliteli ölçüm tamamlandı! ✨';
    } else if (_validMeasurements > 0) {
      final qualityPercent = (_signalQuality * 100).toInt();
      final stabilityIndicator = _recentHeartRates.length >= 3
          ? _getStabilityIndicator()
          : '';

      return 'Kaliteli veri: $_validMeasurements/${_getTargetMeasurements()} | '
          'HRV: ${_currentHRV.toStringAsFixed(1)} ms | '
          'Kalite: $qualityPercent%$stabilityIndicator';
    } else {
      return 'Nabız analiz ediliyor... Parmağınızı sabit tutun.';
    }
  }

  /// Get target measurements based on signal quality
  int _getTargetMeasurements() {
    return _signalQuality > 0.85 ? 4 : 6;
  }

  /// Get stability indicator for status
  String _getStabilityIndicator() {
    if (_recentHeartRates.length < 3) return '';

    final avg =
        _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
    final maxDeviation = _recentHeartRates
        .map((hr) => (hr - avg).abs())
        .reduce((a, b) => a > b ? a : b);

    if (maxDeviation <= 5) return ' 🟢'; // Very stable
    if (maxDeviation <= 10) return ' 🟡'; // Moderately stable
    return ' 🔴'; // Unstable
  }

  @override
  void dispose() {
    _heartRateValues.clear();
    _recentHeartRates.clear();
    super.dispose();
  }
}
