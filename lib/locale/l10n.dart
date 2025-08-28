import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('tr'),
    const Locale('de'),
    const Locale('es'),
    const Locale('fr'),
    const Locale('it'),
    const Locale('pt'),
    const Locale('ru'),
    const Locale('nl'),
    const Locale('nb'),
    const Locale('fi'),
    const Locale('sv'),
    const Locale('da'),
    const Locale('pl'),
    const Locale('ar'),
    const Locale('iw'),
  ];

  static final flag = [
    '🇬🇧',
    '🇩🇪',
    '🇪🇸',
    '🇫🇷',
    '🇮🇹',
    '🇵🇹',
    '🇷🇺',
    '🇳🇱',
    '🇳🇴',
    '🇫🇮',
    '🇸🇪',
    '🇩🇰',
    '🇵🇱',
    '🇦🇪',
    '🇹🇷',
    '🇮🇱',
  ];

  static final name = [
    'English',
    'German',
    'Spanish',
    'French',
    'Italian',
    'Portuguese',
    'Russian',
    'Dutch',
    'Norwegian',
    'Finnish',
    'Swedish',
    'Danish',
    'Polish',
    'Arabic',
    'Turkish',
    'Hebrew',
  ];

  static const path = 'assets/translations';
}


//flutter pub run easy_localization:generate -O lib/locale/lang -f keys 
//-o locale_keys.g.dart --source-dir assets/translations
