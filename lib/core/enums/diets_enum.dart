import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

enum DietsEnum {
  glutenFree,
  eggFree,
  dairyFree,
  nutFree,
  vegan,
  vegantarian,
  withFish,
  withMeat,
  express,
  freezer,
  lowFat,
  lowSugar,
}

extension DietsEnumExtension on DietsEnum {
  int get value {
    switch (this) {
      case DietsEnum.glutenFree:
        return 0;
      case DietsEnum.eggFree:
        return 1;
      case DietsEnum.dairyFree:
        return 2;
      case DietsEnum.nutFree:
        return 3;
      case DietsEnum.vegan:
        return 4;
      case DietsEnum.vegantarian:
        return 5;
      case DietsEnum.withFish:
        return 6;
      case DietsEnum.withMeat:
        return 7;
      case DietsEnum.express:
        return 8;
      case DietsEnum.freezer:
        return 9;
      case DietsEnum.lowFat:
        return 10;
      case DietsEnum.lowSugar:
        return 11;
    }
  }

  String get name {
    switch (this) {
      case DietsEnum.glutenFree:
        return LocaleKeys.filters_glutenfree.tr();
      case DietsEnum.eggFree:
        return LocaleKeys.filters_eggfree.tr();
      case DietsEnum.dairyFree:
        return LocaleKeys.filters_dairyfree.tr();
      case DietsEnum.nutFree:
        return LocaleKeys.filters_nutfree.tr();
      case DietsEnum.vegan:
        return LocaleKeys.filters_vegan.tr();
      case DietsEnum.vegantarian:
        return LocaleKeys.filters_vegatarian.tr();
      case DietsEnum.withFish:
        return LocaleKeys.filters_withfish.tr();
      case DietsEnum.withMeat:
        return LocaleKeys.filters_withmeat.tr();
      case DietsEnum.express:
        return LocaleKeys.filters_express.tr();
      case DietsEnum.freezer:
        return LocaleKeys.filters_freezable.tr();
      case DietsEnum.lowFat:
        return LocaleKeys.filters_lowFat.tr();
      case DietsEnum.lowSugar:
        return LocaleKeys.filters_lowSugar.tr();
    }
  }
}
