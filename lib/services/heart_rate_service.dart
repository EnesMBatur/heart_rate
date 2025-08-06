import 'dart:math';

class HeartRateService {
  /// Calculates heart rate from intensity values using peak detection
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
