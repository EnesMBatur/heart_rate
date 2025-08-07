import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:fftea/fftea.dart';

class AdvancedHeartRateService {
  static const double _sampleRate = 30.0; // FPS (samples per second)
  static const int _windowSize = 256; // FFT window size
  static const double _minHeartRate = 40.0; // Minimum BPM
  static const double _maxHeartRate = 200.0; // Maximum BPM
  static const int _movingAverageWindow = 8; // Smoothing window (increased)
  static const double _stabilityThreshold =
      15.0; // Max BPM change between readings

  final List<double> _recentHeartRates = [];

  /// Calculates heart rate using FFT-based frequency domain analysis
  int calculateHeartRateFFT(List<double> rawSignal) {
    if (rawSignal.length < _windowSize) {
      return 0;
    }

    try {
      // Step 1: Preprocess the signal
      final processedSignal = _preprocessSignal(rawSignal);

      // Step 2: Apply FFT
      final fftResult = _performFFT(processedSignal);

      // Step 3: Find dominant frequency
      final dominantFrequency = _findDominantFrequency(fftResult);

      // Step 4: Convert to BPM
      final bpm = _frequencyToBPM(dominantFrequency);

      // Step 5: Apply smoothing and validation
      final validatedBPM = _validateAndSmooth(bpm);

      return validatedBPM.round();
    } catch (e) {
      debugPrint('Error in FFT heart rate calculation: $e');
      return 0;
    }
  }

  /// Preprocesses the raw signal to improve FFT analysis
  List<double> _preprocessSignal(List<double> signal) {
    // Take the most recent window
    final windowData = signal.length > _windowSize
        ? signal.sublist(signal.length - _windowSize)
        : signal;

    // Step 1: Remove DC component (mean)
    final mean = windowData.reduce((a, b) => a + b) / windowData.length;
    final deMeaned = windowData.map((x) => x - mean).toList();

    // Step 2: Apply Hamming window to reduce spectral leakage
    final windowed = _applyHammingWindow(deMeaned);

    // Step 3: Normalize
    final maxVal = windowed.map((x) => x.abs()).reduce(max);
    if (maxVal > 0) {
      return windowed.map((x) => x / maxVal).toList();
    }

    return windowed;
  }

  /// Applies Hamming window function to reduce spectral leakage
  List<double> _applyHammingWindow(List<double> data) {
    final result = <double>[];
    final n = data.length;

    for (int i = 0; i < n; i++) {
      final window = 0.54 - 0.46 * cos(2 * pi * i / (n - 1));
      result.add(data[i] * window);
    }

    return result;
  }

  /// Performs FFT on the preprocessed signal using fftea package
  List<double> _performFFT(List<double> signal) {
    // Pad signal to window size if needed
    final paddedSignal = List<double>.from(signal);
    while (paddedSignal.length < _windowSize) {
      paddedSignal.add(0.0);
    }

    try {
      // Use fftea for FFT calculation
      final fft = FFT(paddedSignal.length);

      // Convert real signal to Float64x2List (complex format for fftea)
      final complexData = Float64x2List(paddedSignal.length);
      for (int i = 0; i < paddedSignal.length; i++) {
        complexData[i] = Float64x2(paddedSignal[i], 0.0); // real, imaginary
      }

      // Perform FFT
      fft.inPlaceFft(complexData);

      // Calculate magnitudes (only need first half due to symmetry)
      final magnitudes = <double>[];
      final halfSize = complexData.length ~/ 2;

      for (int i = 0; i < halfSize; i++) {
        final real = complexData[i].x;
        final imag = complexData[i].y;
        final magnitude = sqrt(real * real + imag * imag);
        magnitudes.add(magnitude);
      }

      return magnitudes;
    } catch (e) {
      debugPrint('FFT calculation error: $e');
      // Fallback to simple DFT if FFT fails
      return _performDFT(paddedSignal);
    }
  }

  /// Fallback DFT implementation in case FFT fails
  List<double> _performDFT(List<double> signal) {
    final magnitudes = <double>[];
    final n = signal.length;
    final halfSize = n ~/ 2;

    for (int k = 0; k < halfSize; k++) {
      double realSum = 0.0;
      double imagSum = 0.0;

      for (int i = 0; i < n; i++) {
        final angle = -2.0 * pi * k * i / n;
        realSum += signal[i] * cos(angle);
        imagSum += signal[i] * sin(angle);
      }

      final magnitude = sqrt(realSum * realSum + imagSum * imagSum);
      magnitudes.add(magnitude);
    }

    return magnitudes;
  }

  /// Finds the dominant frequency in the heart rate range
  double _findDominantFrequency(List<double> magnitudes) {
    final frequencyResolution = _sampleRate / _windowSize;

    // Convert BPM range to frequency range
    final minFreq = _minHeartRate / 60.0; // Hz
    final maxFreq = _maxHeartRate / 60.0; // Hz

    // Find frequency bins corresponding to heart rate range
    final minBin = (minFreq / frequencyResolution).round();
    final maxBin = (maxFreq / frequencyResolution).round().clamp(
      0,
      magnitudes.length - 1,
    );

    // Find peak in the heart rate frequency range
    double maxMagnitude = 0.0;
    int peakBin = minBin;

    for (int i = minBin; i <= maxBin; i++) {
      if (magnitudes[i] > maxMagnitude) {
        maxMagnitude = magnitudes[i];
        peakBin = i;
      }
    }

    // Refine peak using parabolic interpolation
    final refinedBin = _parabolicInterpolation(magnitudes, peakBin);

    return refinedBin * frequencyResolution;
  }

  /// Improves frequency resolution using parabolic interpolation
  double _parabolicInterpolation(List<double> magnitudes, int peakBin) {
    if (peakBin <= 0 || peakBin >= magnitudes.length - 1) {
      return peakBin.toDouble();
    }

    final y1 = magnitudes[peakBin - 1];
    final y2 = magnitudes[peakBin];
    final y3 = magnitudes[peakBin + 1];

    final a = (y1 - 2 * y2 + y3) / 2;
    final b = (y3 - y1) / 2;

    if (a == 0) return peakBin.toDouble();

    final peakOffset = -b / (2 * a);
    return peakBin + peakOffset;
  }

  /// Converts frequency to BPM
  double _frequencyToBPM(double frequency) {
    return frequency * 60.0;
  }

  /// Validates and smooths the heart rate measurement with outlier detection
  double _validateAndSmooth(double bpm) {
    // Clamp to valid range
    final clampedBPM = bpm.clamp(_minHeartRate, _maxHeartRate);

    // Outlier detection: reject readings that are too different from recent history
    if (_recentHeartRates.isNotEmpty) {
      final recentAvg =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      final difference = (clampedBPM - recentAvg).abs();

      // If the new reading is too different, use a weighted average instead
      if (difference > _stabilityThreshold && _recentHeartRates.length >= 3) {
        final weightedBPM = (recentAvg * 0.7) + (clampedBPM * 0.3);
        debugPrint(
          'Outlier detected: $clampedBPM, using weighted: $weightedBPM',
        );
        _recentHeartRates.add(weightedBPM);
      } else {
        _recentHeartRates.add(clampedBPM);
      }
    } else {
      _recentHeartRates.add(clampedBPM);
    }

    // Keep only recent measurements
    if (_recentHeartRates.length > _movingAverageWindow) {
      _recentHeartRates.removeAt(0);
    }

    // Use median instead of mean for better outlier resistance
    if (_recentHeartRates.length >= 5) {
      final sortedValues = List<double>.from(_recentHeartRates)..sort();
      final median = sortedValues[sortedValues.length ~/ 2];

      // Return weighted average of median and recent mean
      final mean =
          _recentHeartRates.reduce((a, b) => a + b) / _recentHeartRates.length;
      return (median * 0.6) + (mean * 0.4);
    } else if (_recentHeartRates.length >= 3) {
      return _recentHeartRates.reduce((a, b) => a + b) /
          _recentHeartRates.length;
    }

    return _recentHeartRates.last;
  }

  /// Calculates heart rate variability (HRV) - time between heartbeats
  double calculateHRV(List<double> heartRateValues) {
    if (heartRateValues.length < 10) return 0.0;

    // Convert BPM to RR intervals (time between beats in ms)
    final rrIntervals = heartRateValues.map((bpm) => 60000 / bpm).toList();

    // Calculate successive differences
    final differences = <double>[];
    for (int i = 1; i < rrIntervals.length; i++) {
      differences.add((rrIntervals[i] - rrIntervals[i - 1]).abs());
    }

    if (differences.isEmpty) return 0.0;

    // Calculate RMSSD (Root Mean Square of Successive Differences)
    final squaredDiffs = differences.map((d) => d * d).toList();
    final meanSquared =
        squaredDiffs.reduce((a, b) => a + b) / squaredDiffs.length;

    return sqrt(meanSquared);
  }

  /// Determines signal quality based on FFT analysis and signal stability
  double calculateSignalQuality(List<double> rawSignal) {
    if (rawSignal.length < 60) return 0.0;

    try {
      final processedSignal = _preprocessSignal(rawSignal);
      final fftResult = _performFFT(processedSignal);

      // Calculate signal-to-noise ratio
      final frequencyResolution = _sampleRate / _windowSize;
      final minBin = (_minHeartRate / 60.0 / frequencyResolution).round();
      final maxBin = (_maxHeartRate / 60.0 / frequencyResolution).round();

      // Signal power in heart rate range
      double signalPower = 0.0;
      double maxPeak = 0.0;
      for (int i = minBin; i <= maxBin && i < fftResult.length; i++) {
        signalPower += fftResult[i];
        if (fftResult[i] > maxPeak) maxPeak = fftResult[i];
      }

      // Noise power (everything outside heart rate range)
      double noisePower = 0.0;
      int noiseCount = 0;
      for (int i = 0; i < fftResult.length; i++) {
        if (i < minBin || i > maxBin) {
          noisePower += fftResult[i];
          noiseCount++;
        }
      }
      final avgNoise = noiseCount > 0 ? noisePower / noiseCount : 1.0;

      // Signal-to-noise ratio
      final snr = maxPeak / avgNoise;

      // Signal stability (low variance = high quality)
      final recentValues = rawSignal.length > 60
          ? rawSignal.sublist(rawSignal.length - 60)
          : rawSignal;
      final mean = recentValues.reduce((a, b) => a + b) / recentValues.length;
      final variance =
          recentValues
              .map((x) => (x - mean) * (x - mean))
              .reduce((a, b) => a + b) /
          recentValues.length;
      final stability = 1.0 / (1.0 + variance);

      // Combined quality score
      final snrScore = (snr / 10.0).clamp(0.0, 1.0); // Normalize SNR
      final stabilityScore = stability.clamp(0.0, 1.0);
      final signalStrength = (signalPower / fftResult.reduce((a, b) => a + b))
          .clamp(0.0, 1.0);

      // Weighted combination
      final quality =
          (snrScore * 0.4) + (stabilityScore * 0.4) + (signalStrength * 0.2);

      return quality.clamp(0.0, 1.0);
    } catch (e) {
      return 0.0;
    }
  }

  /// Resets the moving average buffer
  void reset() {
    _recentHeartRates.clear();
  }
}
