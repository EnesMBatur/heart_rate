import 'package:heart_rate/core/hive/boxes.dart';

class HiveTransactions {
  static bool onBoardingControl() {
    final onboardingBox = Boxes.getOnboarding();
    return onboardingBox.get('onboarding', defaultValue: false)!;
  }

  static void onBoardingAdd() {
    Boxes.getOnboarding().put('onboarding', true);
  }
}
