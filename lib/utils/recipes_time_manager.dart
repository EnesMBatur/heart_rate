// ignore_for_file: cascade_invocations, lines_longer_than_80_chars

import 'package:heart_rate/locale/lang/locale_keys.g.dart';

mixin RecipeTimeManager {
  String timeToString(int minute) {
    final minutes = minute;
    final duration = Duration(minutes: minutes);
    final zero = DateTime(2023);

    final dateTime = zero.add(duration);

    dateTime.hour;
    dateTime.minute;

    return dateTime.hour == 0
        ? '${dateTime.minute} ${LocaleKeys.others_min.tr()}'
        : dateTime.minute == 0
        ? '${dateTime.hour} ${LocaleKeys.others_hour.tr()}'
        : '${dateTime.hour} ${LocaleKeys.others_hour.tr()} ${dateTime.minute} ${LocaleKeys.others_min.tr()}';
  }
}
