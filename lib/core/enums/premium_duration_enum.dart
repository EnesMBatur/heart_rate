import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

enum PremiumDurationEnum { weekly, lifetime }

extension PremiumDurationEnumExtension on PremiumDurationEnum {
  int get value {
    switch (this) {
      case PremiumDurationEnum.weekly:
        return 1;
      case PremiumDurationEnum.lifetime:
        return 0;
    }
  }

  String get name {
    switch (this) {
      case PremiumDurationEnum.weekly:
        return LocaleKeys.premium_weekly.tr();
      case PremiumDurationEnum.lifetime:
        return LocaleKeys.premium_lifetime.tr();
    }
  }
}
