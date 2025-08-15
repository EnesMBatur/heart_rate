import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rate_my_app/rate_my_app.dart';

class AppReviewService {
  static AppReviewService? _instance;
  static AppReviewService get instance => _instance ??= AppReviewService._();

  AppReviewService._();

  // Rate My App instance with configuration
  late RateMyApp _rateMyApp;
  bool _isInitialized = false;

  // Keys for SharedPreferences
  static const String _measurementCountKey = 'measurement_count';

  /// Initialize Rate My App
  Future<void> initialize() async {
    if (_isInitialized) return;

    _rateMyApp = RateMyApp(
      preferencesPrefix: 'heart_rate_app_',
      minDays: 0, // Don't wait for days, use measurement count instead
      minLaunches: 1, // Only need 1 launch
      remindDays: 1, // Remind after 1 day if dismissed
      remindLaunches: 2, // Remind after 2 launches if dismissed
      googlePlayIdentifier:
          'co.wiserapps.heartrate', // Replace with your package name
      appStoreIdentifier:
          '123456789', // Replace with your App Store ID when available
    );

    await _rateMyApp.init();
    _isInitialized = true;
  }

  /// Check if we should request a review
  Future<bool> shouldRequestReview() async {
    await initialize();

    // Get measurement count
    final prefs = await SharedPreferences.getInstance();
    final int measurementCount = prefs.getInt(_measurementCountKey) ?? 0;

    // Check Rate My App conditions and our measurement count
    // Only show if user hasn't rated yet AND has done at least 1 measurement
    return measurementCount >= 1 && _rateMyApp.shouldOpenDialog;
  }

  /// Increment measurement count
  Future<void> incrementMeasurementCount() async {
    final prefs = await SharedPreferences.getInstance();
    final int currentCount = prefs.getInt(_measurementCountKey) ?? 0;
    await prefs.setInt(_measurementCountKey, currentCount + 1);
  }

  /// Request app review
  Future<void> requestReview(BuildContext context) async {
    await initialize();

    try {
      // Show star rating dialog first
      if (context.mounted) {
        _showStarRatingDialog(context);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error requesting review: $e');
      }
      // Fallback to store listing
      await _rateMyApp.launchStore();
    }
  }

  /// Show custom star rating dialog
  void _showStarRatingDialog(BuildContext context) {
    double selectedRating = 5.0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              elevation: 8,
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.white, Colors.grey[50]!],
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Heart icon
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [Colors.red[400]!, Colors.red[600]!],
                        ),
                      ),
                      child: const Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Title
                    Text(
                      'Rate Your Experience',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),

                    // Subtitle
                    Text(
                      'How would you rate our heart rate monitoring app?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Star rating
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedRating = (index + 1).toDouble();
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              margin: const EdgeInsets.symmetric(horizontal: 6),
                              child: Icon(
                                Icons.star_rounded,
                                size: 40,
                                color: (index + 1) <= selectedRating
                                    ? Colors.amber[600]
                                    : Colors.grey[300],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Action buttons
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Maybe Later',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                              _handleRatingSubmission(context, selectedRating);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red[500],
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 2,
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  /// Handle rating submission based on score
  Future<void> _handleRatingSubmission(
    BuildContext context,
    double rating,
  ) async {
    if (rating >= 4.0) {
      // High rating: redirect to store
      await _rateMyApp.launchStore();
      // Mark as rated so it doesn't show again
      await _rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
    } else {
      // Low rating: show thank you message
      _showThankYouDialog(context);
      // Mark as rated so it doesn't show again
      await _rateMyApp.callEvent(RateMyAppEventType.rateButtonPressed);
    }
  }

  /// Show thank you dialog for low ratings
  void _showThankYouDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green[50]!, Colors.green[100]!],
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Thank you icon
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Colors.green[400]!, Colors.green[600]!],
                    ),
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                const SizedBox(height: 16),

                // Thank you title
                Text(
                  'Thank You!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),

                // Thank you message
                Text(
                  'We appreciate your feedback! Your input helps us improve our heart rate monitoring app.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.green[700],
                    height: 1.4,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24),

                // Close button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      elevation: 2,
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  /// Force request review (for testing)
  Future<void> forceRequestReview(BuildContext context) async {
    await initialize();

    try {
      if (context.mounted) {
        _showStarRatingDialog(context);
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error in force review request: $e');
      }
      await _rateMyApp.launchStore();
    }
  }

  /// Open app store listing directly
  Future<void> openStoreListing() async {
    await initialize();

    try {
      await _rateMyApp.launchStore();
    } catch (e) {
      if (kDebugMode) {
        print('Error opening store listing: $e');
      }
    }
  }

  /// Reset review status (for testing)
  Future<void> resetReviewStatus() async {
    await initialize();

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_measurementCountKey);

    // Reset Rate My App preferences
    await _rateMyApp.reset();
  }

  /// Get measurement count (for debugging)
  Future<int> getMeasurementCount() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_measurementCountKey) ?? 0;
  }

  /// Check if review was already given
  Future<bool> wasReviewGiven() async {
    await initialize();
    return !_rateMyApp.shouldOpenDialog;
  }

  /// Get Rate My App instance for advanced usage
  Future<RateMyApp> getRateMyAppInstance() async {
    await initialize();
    return _rateMyApp;
  }
}
