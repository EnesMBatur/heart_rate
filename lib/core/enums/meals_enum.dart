// ignore: constant_identifier_names
import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

enum MealsEnum { breakfast, lunch, dinner, snack }

extension MealsEnumExtension on MealsEnum {
  int get value {
    switch (this) {
      case MealsEnum.breakfast:
        return 0;
      case MealsEnum.lunch:
        return 1;
      case MealsEnum.dinner:
        return 2;
      case MealsEnum.snack:
        return 3;
    }
  }

  String get name {
    switch (this) {
      case MealsEnum.breakfast:
        return LocaleKeys.meal_type_breakfast.tr();
      case MealsEnum.lunch:
        return LocaleKeys.meal_type_lunch.tr();
      case MealsEnum.dinner:
        return LocaleKeys.meal_type_dinner.tr();
      case MealsEnum.snack:
        return LocaleKeys.meal_type_snack.tr();
    }
  }
}
