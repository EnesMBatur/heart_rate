import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class AppConst {
  AppConst._();

  static const String appName = 'Heart Rater';

  static const Color kPrimaryColor = Color(0xFFFD4452);
  static const Color kSecondaryColor = Color(0xFFB13039);
  static const Color kCircleColor = Color(0xFF757575);
  static const Color kBackgroundColor = Color(0XFFF5F5F5);

  static const double kDefaultPadding = 16.0;
  static const double kDefaultEdgeInsets = 8.0;
  static const double kDefaultTextField = 14.0;
  static const double kBorderRadius = 16.0;
  static const double kIconSize = 28.0;
  static const double kTabletDefaultPadding = 40.0;
  static const double kTabletIconSize = 36.0;
  static const double kCategoryPadding = 12;

  static const int kTrialValue = 1;

  static const spinkit = SpinKitFadingCircle(color: kPrimaryColor, size: 60);
}
