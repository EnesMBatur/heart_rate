import 'dart:math';
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';

class HeartRateService {
  // --- Enhanced Signal Processing with Band-Pass Filtering ---
  static final List<double> _recentSignalValues = [];
  static final List<double> _signalVariations = [];
  static final List<double> _filteredSignal = [];
  static bool _fingerPresent = false;
  static int _stableSignalCounter = 0;

  // Enhanced constants for better signal processing
  static const double defaultFrameRate = 25.0;
  static const int signalBufferSize = 150; // 5-6 seconds of data
  static const int minimumVariationSamples = 75; // 2-3 seconds
  static const double heartRateVariationThreshold = 0.5;

  // Band-pass filter parameters (0.5-4 Hz for heart rate)
  static const double lowCutoffHz = 0.5; // 30 BPM
  static const double highCutoffHz = 4.0; // 240 BPM
  static const int filterOrder = 2;

  // Dynamic threshold parameters
  static double _currentNoiseFloor = 0.0;
  static double _adaptiveThreshold = 0.5;
  static int _noiseCalibrationFrames = 0;

  /// Reset all data for new measurement session
  static void resetCalibration() {
    _recentSignalValues.clear();
    _signalVariations.clear();
    _filteredSignal.clear();
    _fingerPresent = false;
    _stableSignalCounter = 0;
    _currentNoiseFloor = 0.0;
    _adaptiveThreshold = heartRateVariationThreshold;
    _noiseCalibrationFrames = 0;
  }

  /// Get finger detection status
  static bool get fingerPresent => _fingerPresent;

  /// Apply band-pass filter to isolate heart rate frequencies (0.5-4 Hz)
  static List<double> _applyBandPassFilter(List<double> signal) {
    if (signal.length < 10) return signal;

    // Simple butterworth-like filter implementation
    // High-pass filter (remove DC and very low frequencies < 0.5 Hz)
    final highPassed = _applyHighPassFilter(
      signal,
      lowCutoffHz,
      defaultFrameRate,
    );

    // Low-pass filter (remove high frequencies > 4 Hz)
    final bandPassed = _applyLowPassFilter(
      highPassed,
      highCutoffHz,
      defaultFrameRate,
    );

    return bandPassed;
  }

  /// High-pass filter implementation
  static List<double> _applyHighPassFilter(
    List<double> signal,
    double cutoffHz,
    double sampleRate,
  ) {
    if (signal.length < 5) return signal;

    final alpha = _calculateFilterAlpha(cutoffHz, sampleRate);
    final filtered = <double>[];

    // Initialize
    filtered.add(signal[0]);

    for (int i = 1; i < signal.length; i++) {
      final filteredValue =
          alpha * (filtered[i - 1] + signal[i] - signal[i - 1]);
      filtered.add(filteredValue);
    }

    return filtered;
  }

  /// Low-pass filter implementation
  static List<double> _applyLowPassFilter(
    List<double> signal,
    double cutoffHz,
    double sampleRate,
  ) {
    if (signal.length < 5) return signal;

    final alpha = _calculateFilterAlpha(cutoffHz, sampleRate);
    final filtered = <double>[];

    // Initialize
    filtered.add(signal[0]);

    for (int i = 1; i < signal.length; i++) {
      final filteredValue = alpha * signal[i] + (1.0 - alpha) * filtered[i - 1];
      filtered.add(filteredValue);
    }

    return filtered;
  }

  /// Calculate filter coefficient
  static double _calculateFilterAlpha(double cutoffHz, double sampleRate) {
    final omega = 2.0 * pi * cutoffHz / sampleRate;
    return omega / (omega + 1.0);
  }

  /// Enhanced finger detection with adaptive thresholding
  static bool detectFingerFromSignalEnhanced(double intensity) {
    // Add current sample to signal buffer
    _recentSignalValues.add(intensity);

    // Keep buffer at manageable size
    if (_recentSignalValues.length > signalBufferSize) {
      _recentSignalValues.removeAt(0);
    }

    // Calibrate noise floor for first few frames (when no finger expected)
    if (_noiseCalibrationFrames < 50 && _recentSignalValues.length < 25) {
      _currentNoiseFloor = _calculateSignalVariation(_recentSignalValues);
      _noiseCalibrationFrames++;
      // Much lower initial threshold for real-world conditions
      _adaptiveThreshold = max(0.3, min(1.0, _currentNoiseFloor * 1.2));
      debugPrint(
        '🔧 Noise calibration: floor=${_currentNoiseFloor.toStringAsFixed(3)}, threshold=${_adaptiveThreshold.toStringAsFixed(3)}',
      );
    }

    // Need enough samples to analyze
    if (_recentSignalValues.length < minimumVariationSamples) {
      return false;
    }

    // Apply band-pass filter to recent signal
    final filtered = _applyBandPassFilter(_recentSignalValues);
    _filteredSignal.clear();
    _filteredSignal.addAll(filtered);

    // Calculate signal variation in filtered signal
    final recentWindow = filtered.sublist(
      max(0, filtered.length - minimumVariationSamples),
    );
    final variation = _calculateSignalVariation(recentWindow);

    _signalVariations.add(variation);
    if (_signalVariations.length > 50) _signalVariations.removeAt(0);

    // Much more lenient threshold for real devices
    final dynamicThreshold = max(
      0.3,
      min(_adaptiveThreshold, 2.0),
    ); // Cap maximum threshold!
    bool hasHeartRatePattern = variation > dynamicThreshold;

    // Also check for absolute intensity changes (finger presence indicator)
    final hasIntensityChange = _checkIntensityFingerPresence();

    // Combine both checks for more reliable detection
    final overallFingerDetected = hasHeartRatePattern || hasIntensityChange;

    if (overallFingerDetected) {
      _stableSignalCounter++;
      if (_stableSignalCounter >= 5) {
        // Reduced from 8 for faster detection
        _fingerPresent = true;
      }
    } else {
      _stableSignalCounter = max(
        0,
        _stableSignalCounter - 1,
      ); // Gradual decrease instead of reset

      // Check if we've had consistently low variation (no finger for a while)
      if (_signalVariations.length >= 15) {
        // Reduced from 20
        final recentVariations = _signalVariations.sublist(
          _signalVariations.length - 15,
        );
        final avgRecentVariation =
            recentVariations.reduce((a, b) => a + b) / recentVariations.length;

        // If no meaningful signal for extended period, reset for fresh detection
        if (avgRecentVariation < dynamicThreshold * 0.3) {
          _fingerPresent = false;

          // Smart reset: Keep only recent samples for quicker re-detection
          if (_recentSignalValues.length > minimumVariationSamples * 2) {
            final samplesToKeep = _recentSignalValues.sublist(
              _recentSignalValues.length - minimumVariationSamples,
            );
            _recentSignalValues.clear();
            _recentSignalValues.addAll(samplesToKeep);

            final variationsToKeep = _signalVariations.sublist(
              _signalVariations.length - 10,
            );
            _signalVariations.clear();
            _signalVariations.addAll(variationsToKeep);

            debugPrint(
              '🔄 Enhanced signal reset: Cleared old data for fresh finger detection',
            );
          }
        }
      }
    }

    // Debug info - more detailed
    if (_recentSignalValues.length % 15 == 0) {
      // More frequent logging
      debugPrint(
        '🫀 Enhanced Analysis: variation=${variation.toStringAsFixed(3)}, '
        'threshold=${dynamicThreshold.toStringAsFixed(3)}, '
        'intensity=${intensity.toInt()}, '
        'stable=$_stableSignalCounter, finger=$_fingerPresent, '
        'heartPattern=$hasHeartRatePattern, intensityChange=$hasIntensityChange',
      );
    }

    return _fingerPresent;
  }

  /// Check for finger presence based on absolute intensity changes
  static bool _checkIntensityFingerPresence() {
    if (_recentSignalValues.length < 20) return false;

    // Check recent intensity values for finger-like characteristics
    final recent = _recentSignalValues.sublist(_recentSignalValues.length - 20);
    final avgIntensity = recent.reduce((a, b) => a + b) / recent.length;

    // Finger typically creates lower intensity (darker image) with flash
    // and shows some variation due to blood flow
    final isFingerLikeIntensity = avgIntensity < 200; // Not overexposed
    final hasMinimalVariation =
        recent
            .map((v) => (v - avgIntensity).abs())
            .reduce((a, b) => a > b ? a : b) >
        0.5;

    return isFingerLikeIntensity && hasMinimalVariation;
  }

  /// Add intensity sample and detect finger based on signal characteristics (legacy fallback)
  static bool detectFingerFromSignal(double intensity) {
    // Add current sample to signal buffer
    _recentSignalValues.add(intensity);

    // Keep buffer at manageable size
    if (_recentSignalValues.length > signalBufferSize) {
      _recentSignalValues.removeAt(0);
    }

    // Need enough samples to analyze
    if (_recentSignalValues.length < minimumVariationSamples) {
      return false;
    }

    // Calculate signal variation in recent window
    final recentWindow = _recentSignalValues.sublist(
      _recentSignalValues.length - minimumVariationSamples,
    );
    final variation = _calculateSignalVariation(recentWindow);

    _signalVariations.add(variation);
    if (_signalVariations.length > 50) _signalVariations.removeAt(0);

    // Finger is present if we detect heart rate-like variations
    bool hasHeartRatePattern = variation > heartRateVariationThreshold;

    if (hasHeartRatePattern) {
      _stableSignalCounter++;
      if (_stableSignalCounter >= 10) {
        // Need 10 consecutive good readings
        _fingerPresent = true;
      }
    } else {
      _stableSignalCounter = 0;
      if (!hasHeartRatePattern && _signalVariations.length > 20) {
        // Analyze the signal
        if (_recentSignalValues.length >= minimumVariationSamples) {
          final variation = _calculateSignalVariation(_recentSignalValues);
          _signalVariations.add(variation);

          if (variation > heartRateVariationThreshold) {
            _stableSignalCounter++;
            // Reduced threshold for faster detection
            if (_stableSignalCounter >= 8) {
              _fingerPresent = true;
            }
          } else {
            _stableSignalCounter = 0;

            // Check if we've had consistently low variation (no finger for a while)
            if (_signalVariations.length >= 30) {
              final recentVariations = _signalVariations.sublist(
                _signalVariations.length - 30,
              );
              final avgRecentVariation =
                  recentVariations.reduce((a, b) => a + b) /
                  recentVariations.length;

              // If no meaningful signal for extended period, reset buffers for fresh detection
              if (avgRecentVariation < heartRateVariationThreshold * 0.3) {
                _fingerPresent = false;

                // Smart reset: Clear old data to allow fresh detection
                if (_recentSignalValues.length > minimumVariationSamples * 2) {
                  // Keep only recent samples for quicker re-detection
                  final samplesToKeep = _recentSignalValues.sublist(
                    _recentSignalValues.length - minimumVariationSamples,
                  );
                  _recentSignalValues.clear();
                  _recentSignalValues.addAll(samplesToKeep);

                  final variationsToKeep = _signalVariations.sublist(
                    _signalVariations.length - 15,
                  );
                  _signalVariations.clear();
                  _signalVariations.addAll(variationsToKeep);
                  print(
                    '🔄 Signal reset: Cleared old data for fresh finger detection',
                  );
                }
              }
            }
          }
        }
      }
    }

    // Debug info
    if (_recentSignalValues.length % 25 == 0) {
      // Log every ~1 second
      print(
        '🫀 Signal Analysis: variation=${variation.toStringAsFixed(3)}, '
        'stable=$_stableSignalCounter, finger=$_fingerPresent',
      );
    }

    return _fingerPresent;
  }

  /// Calculate how much the signal varies (indicates heart rate)
  static double _calculateSignalVariation(List<double> window) {
    if (window.length < 10) return 0.0;

    // Simple peak-to-valley variation detection
    double min = window.reduce((a, b) => a < b ? a : b);
    double max = window.reduce((a, b) => a > b ? a : b);
    double range = max - min;

    // Also check for periodic behavior
    double mean = window.reduce((a, b) => a + b) / window.length;
    double variance =
        window.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        window.length;
    double standardDeviation = sqrt(variance);

    // Combine range and standard deviation for variation score
    return range * 0.7 + standardDeviation * 0.3;
  }

  /// Calculate average intensity from camera image
  static double calculateAverageIntensity(CameraImage image) {
    if (image.planes.isEmpty) return 0.0;
    final plane = image.planes[0];
    final bytes = plane.bytes;
    if (bytes.isEmpty) return 0.0;

    int sum = 0;
    for (int i = 0; i < bytes.length; i += 10) {
      sum += bytes[i];
    }
    return sum / (bytes.length / 10);
  }

  /// Enhanced main finger detection method - uses filtered signal analysis
  static bool isFingerPresent(double intensity) {
    return detectFingerFromSignalEnhanced(intensity);
  }

  /// Perform ultra-advanced PPG signal analysis with enhanced validation and filtering
  static Map<String, dynamic>? performUltraAdvancedAnalysis(
    List<double> signal, {
    int initialSampleCount = 400, // Reduced from 900 for faster response
    double qualityThreshold = 0.75, // Increased for better quality
    double frameRate = defaultFrameRate,
  }) {
    if (signal.length < initialSampleCount) return null;

    try {
      // 1. Apply band-pass filter first to clean the signal
      final filteredSignal = _applyBandPassFilter(signal);

      // 2. Enhanced signal quality check on filtered signal
      final quality = calculateEnhancedSignalQuality(filteredSignal);
      if (quality < qualityThreshold) return null;

      // 3. Signal variability check - prevent flat/fake signals
      final signalVariance = calculateVariance(filteredSignal);
      if (signalVariance < 3.0) {
        return null; // Slightly relaxed for filtered signal
      }

      // 4. Enhanced peak detection with adaptive threshold
      final peaks = detectPeaksAdvanced(filteredSignal);
      if (peaks.length < 3) return null;

      // 5. Calculate R-R intervals with enhanced validation
      final rrIntervals = <double>[];
      for (int i = 1; i < peaks.length; i++) {
        final intervalSamples = peaks[i] - peaks[i - 1];
        final intervalMs = (intervalSamples / frameRate) * 1000;

        // Stricter but more realistic heart rate range: 40-200 BPM
        if (intervalMs >= 300 && intervalMs <= 1500) {
          // 40-200 BPM range
          rrIntervals.add(intervalMs);
        }
      }

      if (rrIntervals.length < 2) return null;

      // 6. Enhanced R-R interval consistency check with outlier removal
      final cleanedRRIntervals = _removeOutliers(rrIntervals);
      if (cleanedRRIntervals.length < 2) return null;

      final rrVariance = calculateVariance(cleanedRRIntervals);
      final rrMean =
          cleanedRRIntervals.reduce((a, b) => a + b) /
          cleanedRRIntervals.length;
      final rrCv = sqrt(rrVariance) / rrMean; // Coefficient of variation

      // More lenient for filtered signal
      if (rrCv > 0.35) return null;

      // 7. Calculate heart rate with validation
      final avgRR = rrMean;
      final heartRate = (60000 / avgRR).round();
      if (heartRate < 40 || heartRate > 200) return null;

      // 8. Enhanced HRV metrics calculation
      final hrv = calculateRMSSD(cleanedRRIntervals);
      final sdnn = calculateSDNN(cleanedRRIntervals);
      final lfHf = calculateLFHFRatio(cleanedRRIntervals);

      // 9. Cross-validation with frequency domain analysis
      final frequencyHR = _calculateFrequencyDomainHR(
        filteredSignal,
        frameRate,
      );
      final hrDifference = (heartRate - frequencyHR).abs();

      // If time and frequency domain differ too much, signal might be noisy
      if (hrDifference > 15) {
        return null; // Allow some difference but not too much
      }

      // 10. Final enhanced validation
      if (hrv < 3.0 || hrv > 250.0) return null; // More realistic HRV range

      return {
        'heartRate': heartRate,
        'hrv': hrv,
        'sdnn': sdnn,
        'lfHfRatio': lfHf,
        'quality': quality,
        'rrCount': cleanedRRIntervals.length,
        'signalVariance': signalVariance,
        'rrConsistency': 1.0 - rrCv,
        'frequencyHR': frequencyHR,
        'timeDomainAccuracy': 1.0 - (hrDifference / 15.0).clamp(0.0, 1.0),
        'filteredSignalUsed': true,
      };
    } catch (e) {
      debugPrint('❌ Enhanced analysis error: $e');
      return null;
    }
  }

  /// Remove outliers from R-R intervals using IQR method
  static List<double> _removeOutliers(List<double> values) {
    if (values.length < 4) return values;

    final sorted = List<double>.from(values)..sort();
    final q1Index = (sorted.length * 0.25).floor();
    final q3Index = (sorted.length * 0.75).floor();

    final q1 = sorted[q1Index];
    final q3 = sorted[q3Index];
    final iqr = q3 - q1;

    final lowerBound = q1 - 1.5 * iqr;
    final upperBound = q3 + 1.5 * iqr;

    return values
        .where((value) => value >= lowerBound && value <= upperBound)
        .toList();
  }

  /// Calculate heart rate using frequency domain analysis (FFT approximation)
  static int _calculateFrequencyDomainHR(
    List<double> signal,
    double frameRate,
  ) {
    if (signal.length < 64) return 0;

    // Simple autocorrelation-based frequency detection
    final autocorrelation = _calculateAutocorrelation(signal);

    // Find the peak in autocorrelation that corresponds to heart rate frequency
    final minLag = (frameRate * 0.4).round(); // 150 BPM max
    final maxLag = (frameRate * 1.5).round(); // 40 BPM min

    double maxCorr = 0.0;
    int bestLag = minLag;

    for (int lag = minLag; lag < min(maxLag, autocorrelation.length); lag++) {
      if (autocorrelation[lag] > maxCorr) {
        maxCorr = autocorrelation[lag];
        bestLag = lag;
      }
    }

    // Convert lag to heart rate
    final heartRate = (60.0 * frameRate / bestLag).round();
    return heartRate.clamp(40, 200);
  }

  /// Calculate autocorrelation for frequency analysis
  static List<double> _calculateAutocorrelation(List<double> signal) {
    final n = signal.length;
    final autocorr = List<double>.filled(n ~/ 2, 0.0);

    for (int lag = 0; lag < autocorr.length; lag++) {
      double sum = 0.0;
      int count = 0;

      for (int i = 0; i < n - lag; i++) {
        sum += signal[i] * signal[i + lag];
        count++;
      }

      autocorr[lag] = count > 0 ? sum / count : 0.0;
    }

    return autocorr;
  }

  /// Enhanced signal quality calculation
  static double calculateEnhancedSignalQuality(List<double> signal) {
    if (signal.length < 50) return 0.0;

    // 1. Signal-to-noise ratio
    final snr = _calculateSNR(signal);

    // 2. Signal consistency (how periodic it is)
    final periodicity = _calculatePeriodicity(signal);

    // 3. Dynamic range (good PPG should have reasonable amplitude variation)
    final dynamicRange = _calculateDynamicRange(signal);

    // Combine all quality metrics
    final snrScore = (snr / 15.0).clamp(0.0, 1.0); // Normalize SNR
    final periodicityScore = periodicity;
    final dynamicScore = dynamicRange;

    return (snrScore * 0.4 + periodicityScore * 0.4 + dynamicScore * 0.2).clamp(
      0.0,
      1.0,
    );
  }

  /// Calculate signal-to-noise ratio
  static double _calculateSNR(List<double> signal) {
    final mean = signal.reduce((a, b) => a + b) / signal.length;
    final variance =
        signal.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        signal.length;
    final stdDev = sqrt(variance);

    return mean > 0 ? mean / stdDev : 0.0;
  }

  /// Calculate how periodic the signal is (good for heart rate)
  static double _calculatePeriodicity(List<double> signal) {
    if (signal.length < 100) return 0.0;

    final autocorr = _calculateAutocorrelation(
      signal.sublist(0, min(signal.length, 200)),
    );

    // Look for periodicity in heart rate range (1-3 second intervals at 25fps)
    final minLag = 25; // ~1 second
    final maxLag = min(75, autocorr.length - 1); // ~3 seconds

    double maxPeriodicity = 0.0;
    for (int lag = minLag; lag <= maxLag; lag++) {
      maxPeriodicity = max(maxPeriodicity, autocorr[lag]);
    }

    return (maxPeriodicity / autocorr[0]).clamp(0.0, 1.0);
  }

  /// Calculate dynamic range of signal
  static double _calculateDynamicRange(List<double> signal) {
    final minVal = signal.reduce((a, b) => a < b ? a : b);
    final maxVal = signal.reduce((a, b) => a > b ? a : b);
    final range = maxVal - minVal;

    // Normalize based on expected PPG range
    return (range / 50.0).clamp(0.0, 1.0); // Assuming typical PPG range
  }

  /// Enhanced peak detection with adaptive thresholding
  static List<int> detectPeaksAdvanced(List<double> signal) {
    final peaks = <int>[];
    if (signal.length < 25) return peaks;

    // Calculate adaptive threshold using sliding window
    const windowSize = 50;
    final smoothedSignal = _applyMovingAverageFilter(signal);

    for (int i = windowSize; i < smoothedSignal.length - windowSize; i++) {
      final window = smoothedSignal.sublist(
        i - windowSize ~/ 2,
        i + windowSize ~/ 2,
      );
      final localMean = window.reduce((a, b) => a + b) / window.length;
      final localStd = sqrt(
        window
                .map((x) => (x - localMean) * (x - localMean))
                .reduce((a, b) => a + b) /
            window.length,
      );
      final threshold = localMean + localStd * 0.6; // Adaptive threshold

      // Check for peak
      if (smoothedSignal[i] > smoothedSignal[i - 1] &&
          smoothedSignal[i] > smoothedSignal[i + 1] &&
          smoothedSignal[i] > threshold) {
        // Ensure minimum distance between peaks (avoid double detection)
        if (peaks.isEmpty || i - peaks.last > 15) {
          // ~0.6 seconds at 25fps
          peaks.add(i);
        }
      }
    }

    return peaks;
  }

  /// Static version of moving average filter
  static List<double> _applyMovingAverageFilter(List<double> values) {
    const windowSize = 5;
    final smoothed = <double>[];

    for (int i = 0; i < values.length; i++) {
      double sum = 0;
      int count = 0;

      for (
        int j = max(0, i - windowSize ~/ 2);
        j < min(values.length, i + windowSize ~/ 2 + 1);
        j++
      ) {
        sum += values[j];
        count++;
      }

      smoothed.add(sum / count);
    }

    return smoothed;
  }

  /// Perform advanced PPG signal analysis with enhanced validation
  static Map<String, dynamic>? performAdvancedAnalysis(
    List<double> signal, {
    int initialSampleCount = 900,
    double qualityThreshold = 0.7,
    double frameRate = defaultFrameRate,
  }) {
    if (signal.length < initialSampleCount) return null;

    try {
      // 1. Enhanced signal quality check
      final quality = calculateSignalQuality(signal);
      if (quality < qualityThreshold) return null;

      // 2. Signal variability check - prevent flat/fake signals
      final signalVariance = calculateVariance(signal);
      if (signalVariance < 5.0) return null; // Too flat, likely fake

      // 3. Peak detection with stricter requirements
      final peaks = detectPeaks(signal);
      if (peaks.length < 4) return null; // Increased from 3 to 4

      // 4. Calculate R-R intervals with stricter validation
      final rrIntervals = <double>[];
      for (int i = 1; i < peaks.length; i++) {
        final intervalSamples = peaks[i] - peaks[i - 1];
        final intervalMs = (intervalSamples / frameRate) * 1000;
        // Stricter heart rate range: 45-180 BPM
        if (intervalMs >= 333 && intervalMs <= 1333) {
          // 45-180 BPM range
          rrIntervals.add(intervalMs);
        }
      }

      if (rrIntervals.length < 3) return null; // Increased from 2 to 3

      // 5. R-R interval consistency check
      final rrVariance = calculateVariance(rrIntervals);
      final rrMean = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
      final rrCv = sqrt(rrVariance) / rrMean; // Coefficient of variation
      if (rrCv > 0.3) return null; // Too inconsistent, likely noise

      // 6. Calculate heart rate with validation
      final avgRR = rrMean;
      final heartRate = (60000 / avgRR).round();
      if (heartRate < 45 || heartRate > 180) return null; // Stricter range

      // 7. Calculate HRV metrics
      final hrv = calculateRMSSD(rrIntervals);
      final sdnn = calculateSDNN(rrIntervals);
      final lfHf = calculateLFHFRatio(rrIntervals);

      // 8. Final validation - HRV should be reasonable
      if (hrv < 5.0 || hrv > 200.0) return null; // Unrealistic HRV values

      return {
        'heartRate': heartRate,
        'hrv': hrv,
        'sdnn': sdnn,
        'lfHfRatio': lfHf,
        'quality': quality,
        'rrCount': rrIntervals.length,
        'signalVariance': signalVariance,
        'rrConsistency': 1.0 - rrCv, // Higher is better
      };
    } catch (e) {
      return null;
    }
  }

  /// Calculate variance of a signal
  static double calculateVariance(List<double> values) {
    if (values.length < 2) return 0.0;
    final mean = values.reduce((a, b) => a + b) / values.length;
    return values.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        values.length;
  }

  /// Calculate signal quality using SNR
  static double calculateSignalQuality(List<double> signal) {
    if (signal.length < 50) return 0.0;

    final mean = signal.reduce((a, b) => a + b) / signal.length;
    final variance =
        signal.map((x) => (x - mean) * (x - mean)).reduce((a, b) => a + b) /
        signal.length;
    final stdDev = sqrt(variance);
    final snr = mean > 0 ? mean / stdDev : 0.0;

    return (snr / 10).clamp(0.0, 1.0);
  }

  /// Detect peaks in PPG signal
  static List<int> detectPeaks(List<double> signal) {
    final peaks = <int>[];
    final threshold = _calculateAdaptiveThreshold(signal);

    for (int i = 1; i < signal.length - 1; i++) {
      if (signal[i] > signal[i - 1] &&
          signal[i] > signal[i + 1] &&
          signal[i] > threshold) {
        if (peaks.isEmpty || i - peaks.last > 15) {
          peaks.add(i);
        }
      }
    }
    return peaks;
  }

  /// Calculate adaptive threshold for peak detection
  static double _calculateAdaptiveThreshold(List<double> signal) {
    final sorted = List<double>.from(signal)..sort();
    final percentile75 = sorted[(sorted.length * 0.75).floor()];
    final percentile25 = sorted[(sorted.length * 0.25).floor()];
    return percentile25 + (percentile75 - percentile25) * 0.3;
  }

  /// Calculate RMSSD (Root Mean Square of Successive Differences)
  static double calculateRMSSD(List<double> rrIntervals) {
    if (rrIntervals.length < 2) return 0.0;

    double sumSquaredDiffs = 0.0;
    for (int i = 1; i < rrIntervals.length; i++) {
      final diff = rrIntervals[i] - rrIntervals[i - 1];
      sumSquaredDiffs += diff * diff;
    }
    return sqrt(sumSquaredDiffs / (rrIntervals.length - 1));
  }

  /// Calculate SDNN (Standard Deviation of NN intervals)
  static double calculateSDNN(List<double> rrIntervals) {
    final mean = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
    final sumSq = rrIntervals
        .map((x) => (x - mean) * (x - mean))
        .reduce((a, b) => a + b);
    return sqrt(sumSq / rrIntervals.length);
  }

  /// Calculate simplified LF/HF ratio
  static double calculateLFHFRatio(List<double> rrIntervals) {
    if (rrIntervals.length < 5) return 1.0;

    final mean = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
    final variance =
        rrIntervals
            .map((x) => (x - mean) * (x - mean))
            .reduce((a, b) => a + b) /
        rrIntervals.length;

    final lf = variance * 0.4;
    final hf = variance * 0.5;

    return hf > 0 ? lf / hf : 1.0;
  }

  /// Calculates heart rate from intensity values using peak detection (legacy method)
  int calculateHeartRate(List<double> values) {
    if (values.length < 60) return 0;

    // Apply smoothing filter
    final smoothedValues = _applySmoothingFilter(values);

    // Find peaks
    final peaks = _findPeaks(smoothedValues);

    if (peaks.length < 2) return 0;

    // Calculate average interval between peaks
    final intervals = <double>[];
    for (int i = 1; i < peaks.length; i++) {
      intervals.add((peaks[i] - peaks[i - 1]).toDouble());
    }

    if (intervals.isEmpty) return 0;

    // Calculate average interval
    final avgInterval = intervals.reduce((a, b) => a + b) / intervals.length;

    // Convert to BPM (assuming 30 FPS capture rate)
    final fps = 30.0;
    final bpm = (fps * 60) / avgInterval;

    // Clamp to reasonable range
    return bpm.round().clamp(40, 200);
  }

  /// Apply a simple moving average filter to smooth the signal
  List<double> _applySmoothingFilter(List<double> values) {
    const windowSize = 5;
    final smoothed = <double>[];

    for (int i = 0; i < values.length; i++) {
      double sum = 0;
      int count = 0;

      for (
        int j = max(0, i - windowSize ~/ 2);
        j < min(values.length, i + windowSize ~/ 2 + 1);
        j++
      ) {
        sum += values[j];
        count++;
      }

      smoothed.add(sum / count);
    }

    return smoothed;
  }

  /// Find peaks in the signal using a simple threshold method
  List<int> _findPeaks(List<double> values) {
    if (values.length < 3) return [];

    final peaks = <int>[];
    const minDistance =
        10; // Minimum distance between peaks (about 0.3 seconds at 30 FPS)

    // Calculate dynamic threshold
    final mean = values.reduce((a, b) => a + b) / values.length;
    final variance =
        values.map((v) => pow(v - mean, 2)).reduce((a, b) => a + b) /
        values.length;
    final stdDev = sqrt(variance);
    final threshold =
        mean + stdDev * 0.5; // Threshold is mean + 0.5 * standard deviation

    for (int i = 1; i < values.length - 1; i++) {
      // Check if current point is a local maximum above threshold
      if (values[i] > values[i - 1] &&
          values[i] > values[i + 1] &&
          values[i] > threshold) {
        // Check minimum distance from last peak
        if (peaks.isEmpty || i - peaks.last > minDistance) {
          peaks.add(i);
        }
      }
    }

    return peaks;
  }

  /// Calculate stress level based on heart rate variability
  int calculateStressLevel(List<double> heartRateValues) {
    if (heartRateValues.length < 10) return 3; // Default moderate

    // Calculate heart rate variability (HRV)
    final intervals = <double>[];
    for (int i = 1; i < heartRateValues.length; i++) {
      intervals.add((heartRateValues[i] - heartRateValues[i - 1]).abs());
    }

    if (intervals.isEmpty) return 3;

    final avgVariability = intervals.reduce((a, b) => a + b) / intervals.length;

    // Higher variability generally indicates lower stress
    if (avgVariability > 5.0) return 1; // Very low stress
    if (avgVariability > 3.0) return 2; // Low stress
    if (avgVariability > 1.5) return 3; // Moderate stress
    if (avgVariability > 0.5) return 4; // High stress
    return 5; // Very high stress
  }

  /// Calculate tension level based on heart rate stability
  int calculateTensionLevel(List<double> heartRateValues) {
    if (heartRateValues.length < 5) return 3;

    // Calculate standard deviation of recent values
    final recentValues = heartRateValues.take(30).toList();
    final mean = recentValues.reduce((a, b) => a + b) / recentValues.length;
    final variance =
        recentValues.map((v) => pow(v - mean, 2)).reduce((a, b) => a + b) /
        recentValues.length;
    final stdDev = sqrt(variance);

    // Higher standard deviation indicates more tension
    if (stdDev < 1.0) return 1; // Very relaxed
    if (stdDev < 2.0) return 2; // Relaxed
    if (stdDev < 4.0) return 3; // Moderate
    if (stdDev < 6.0) return 4; // Tense
    return 5; // Very tense
  }

  /// Calculate energy level based on heart rate pattern
  int calculateEnergyLevel(int heartRate, List<double> heartRateValues) {
    // Base energy on heart rate zones
    if (heartRate < 60) return 2; // Low energy (bradycardia or very relaxed)
    if (heartRate < 80) return 5; // High energy (optimal resting range)
    if (heartRate < 100) return 4; // Good energy
    if (heartRate < 120) return 3; // Moderate energy (slight elevation)
    return 2; // Lower energy (high stress or fatigue)
  }
}
