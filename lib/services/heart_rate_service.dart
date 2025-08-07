import 'dart:math';
import 'package:camera/camera.dart';

class HeartRateService {
  // Constants
  static const double fingerThreshold = 80.0;
  static const double defaultFrameRate = 25.0;

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

  /// Check if finger is present on camera lens
  static bool isFingerPresent(double intensity) {
    return intensity < fingerThreshold;
  }

  /// Perform advanced PPG signal analysis
  static Map<String, dynamic>? performAdvancedAnalysis(
    List<double> signal, {
    int initialSampleCount = 900,
    double qualityThreshold = 0.7,
    double frameRate = defaultFrameRate,
  }) {
    if (signal.length < initialSampleCount) return null;

    try {
      // 1. Signal quality check
      final quality = calculateSignalQuality(signal);
      if (quality < qualityThreshold) return null;

      // 2. Peak detection - reduced minimum peaks requirement
      final peaks = detectPeaks(signal);
      if (peaks.length < 3) return null; // Reduced from 5 to 3

      // 3. Calculate R-R intervals
      final rrIntervals = <double>[];
      for (int i = 1; i < peaks.length; i++) {
        final intervalSamples = peaks[i] - peaks[i - 1];
        final intervalMs = (intervalSamples / frameRate) * 1000;
        if (intervalMs >= 300 && intervalMs <= 2000) {
          rrIntervals.add(intervalMs);
        }
      }

      if (rrIntervals.length < 2) return null; // Reduced from 3 to 2

      // 4. Calculate heart rate
      final avgRR = rrIntervals.reduce((a, b) => a + b) / rrIntervals.length;
      final heartRate = (60000 / avgRR).round();
      if (heartRate < 40 || heartRate > 200) return null;

      // 5. Calculate HRV metrics
      final hrv = calculateRMSSD(rrIntervals);
      final sdnn = calculateSDNN(rrIntervals);
      final lfHf = calculateLFHFRatio(rrIntervals);

      return {
        'heartRate': heartRate,
        'hrv': hrv,
        'sdnn': sdnn,
        'lfHfRatio': lfHf,
        'quality': quality,
        'rrCount': rrIntervals.length,
      };
    } catch (e) {
      return null;
    }
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
