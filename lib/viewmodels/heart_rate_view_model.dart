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
      15; // Increased from 10 to 15 seconds

  // Enhanced completion requirements
  static const int _minBeatsToFinish = 14; // ~14 RR ≈ 12–15 sn stable data
  static const int _minTotalMeasurementSeconds = 18; // minimum 18 seconds total

  // Measurement state
  bool _isMeasuring = false;
  bool _measurementCompleted = false;
  int _validMeasurements = 0;
  DateTime? _measurementStartTime;
  DateTime? _stableHeartRateStartTime;
  bool _hasFoundHeartRate = false;
  int _accumulatedRR = 0; // Total RR intervals collected

  // Heart rate data
  final List<double> _heartRateValues = [];
  final List<int> _recentHeartRates = [];
  int _currentHeartRate = 0;
  double _signalQuality = 0.0;
  double _currentHRV = 0.0;
  int _consecutiveNoFingerFrames = 0;
  bool _isFingerDetected = false;

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
  bool get isFingerDetected => _isFingerDetected;

  /// Fast transition to Phase 2: High quality signal detected
  bool get hasHighQualitySignal =>
      _isMeasuring &&
      _heartRateValues.isNotEmpty &&
      _signalQuality > 0.7 &&
      _validMeasurements > 0;

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
    _isFingerDetected = false;
    _accumulatedRR = 0; // Reset RR count
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

    // Calculate frame stats first, then use rApprox as intensity for better PPG signal
    final stats = HeartRateService.computeFrameStats(image);
    final intensity =
        stats.rApprox; // Use red channel approximation instead of avgY

    // Enhanced finger detection with frame stats
    final isFingerPresent = HeartRateService.isFingerPresentWithStats(
      intensity,
      stats,
    );

    debugPrint(
      '🔍 Enhanced Detection: intensity=${intensity.toInt()}, finger=$isFingerPresent, '
      'avgY=${stats.avgY.toInt()}, stdY=${stats.stdY.toInt()}, redScore=${stats.redScore.toStringAsFixed(2)}',
    );

    if (!isFingerPresent) {
      _consecutiveNoFingerFrames++;
      _isFingerDetected = false;
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
        _accumulatedRR = 0;
        debugPrint('🧹 Parmak uzun süre bulunamadı - veriler temizlendi');
      }

      notifyListeners();
      return;
    }

    // Finger detected - reset counters
    _consecutiveNoFingerFrames = 0;
    _isFingerDetected = true;

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
      qualityThreshold: 0.55, // Lowered for improved RMS/MAD SNR calculation
      frameRate: _frameRate,
    );

    // Fallback to standard analysis if ultra-advanced fails
    analysisResult ??= HeartRateService.performAdvancedAnalysis(
      _heartRateValues,
      initialSampleCount: _minAnalysisSampleCount,
      qualityThreshold: 0.5, // Slightly lower fallback threshold
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

      // Track accumulated RR intervals for completion criteria
      final rrCount = (analysisResult['rrCount'] as int?) ?? 0;
      _accumulatedRR += rrCount;

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
    if (heartRate > 120 && hrv > 80) {
      return false; // High HR with very high HRV is suspicious
    }
    if (heartRate < 50 && hrv < 8) {
      return false; // Very low HR with very low HRV is suspicious
    }

    return true;
  }

  /// Enhanced measurement completion logic with stricter requirements
  bool _shouldCompleteMeasurement() {
    // İlk kalp atışı henüz bulunmadıysa devam et
    if (!_hasFoundHeartRate || _stableHeartRateStartTime == null) {
      return false;
    }

    final sinceStart = DateTime.now().difference(_measurementStartTime!);
    final sinceFirstHR = DateTime.now().difference(_stableHeartRateStartTime!);

    // Mandatory minimums - stricter requirements
    final minTotalTimeOk =
        sinceStart.inSeconds >= _minTotalMeasurementSeconds; // 18 seconds
    final minStableOk =
        sinceFirstHR.inSeconds >= _minStableHeartRateSeconds; // 15 seconds
    final beatsOk = _accumulatedRR >= _minBeatsToFinish; // ≥14 RR intervals
    final qualityOk = _signalQuality >= 0.78; // Higher quality threshold
    final measurementsOk =
        _validMeasurements >= 8; // Minimum valid measurements

    bool stableOk = false;
    if (_recentHeartRates.length >= 5) {
      final avg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final maxDev = _recentHeartRates
          .map((hr) => (hr - avg).abs())
          .reduce((a, b) => a > b ? a : b);
      stableOk = maxDev <= 6.0; // Stricter stability: ≤6 bpm deviation
    }

    final isValidHRV = _currentHRV > 3.0; // Reasonable HRV

    // Timeout condition (max 30 seconds)
    final timeout = sinceStart.inSeconds >= _measurementDurationSeconds;

    debugPrint(
      '🎯 Enhanced Completion Check: '
      'TotalTime=${sinceStart.inSeconds}s/${_minTotalMeasurementSeconds}s ✓$minTotalTimeOk, '
      'StableTime=${sinceFirstHR.inSeconds}s/${_minStableHeartRateSeconds}s ✓$minStableOk, '
      'RR=$_accumulatedRR/$_minBeatsToFinish ✓$beatsOk, '
      'Quality=${(_signalQuality * 100).toInt()}%/78% ✓$qualityOk, '
      'Measurements=$_validMeasurements/8 ✓$measurementsOk, '
      'Stable=✓$stableOk, HRV=✓$isValidHRV, '
      'Timeout=✓$timeout',
    );

    // Enhanced completion criteria - NO early completion, more robust requirements
    return (minTotalTimeOk &&
            minStableOk &&
            beatsOk &&
            qualityOk &&
            measurementsOk &&
            stableOk &&
            isValidHRV) ||
        timeout;
  }

  /// Get progress percentage - now time-based for better UX
  double get progress {
    if (_measurementCompleted) return 1.0;
    if (_measurementStartTime == null) return 0.0;

    final elapsed = DateTime.now()
        .difference(_measurementStartTime!)
        .inMilliseconds;
    final total = _measurementDurationSeconds * 1000;
    return (elapsed / total).clamp(0.0, 0.98); // Keep near 98% until completion
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
