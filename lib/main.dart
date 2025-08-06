import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/locale/l10n.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';
import 'locale/lang/locale_keys.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // Set preferred orientations
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    EasyLocalization(
      supportedLocales: L10n.all,
      path: L10n.path,
      fallbackLocale: L10n.all[0],
      child: const HeartRaterApp(),
    ),
  );
}

class HeartRaterApp extends StatelessWidget {
  const HeartRaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: LocaleKeys.app_title.tr(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
    );
  }
}
