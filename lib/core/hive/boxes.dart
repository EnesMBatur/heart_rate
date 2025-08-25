import 'package:hive_ce/hive.dart';

class Boxes {
  static Box getThemeMode() => Hive.box('themeMode');
  static Box<bool> getOnboarding() => Hive.box('onboarding');
}
