import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/core/services/app_initializer.dart';
import 'package:heart_rate/locale/l10n.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';
import 'locale/lang/locale_keys.g.dart';
import 'screens/blood_pressure/viewmodels/blood_pressure_view_model.dart';
import 'screens/blood_sugar/viewmodels/blood_sugar_view_model.dart';
import 'screens/blood_oxygen/viewmodels/blood_oxygen_view_model.dart';
import 'screens/home/viewmodels/home_view_model.dart';
import 'screens/bmi/viewmodels/bmi_view_model.dart';

void main() async {
  // Uygulama başlangıç süreçlerini çalıştır
  await AppInitializer.initialize();

  runApp(
    EasyLocalization(
      supportedLocales: L10n.all,
      path: L10n.path,
      fallbackLocale: L10n.all[0],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeViewModel()),
          ChangeNotifierProvider(create: (context) => BloodPressureViewModel()),
          ChangeNotifierProvider(create: (context) => BloodSugarViewModel()),
          ChangeNotifierProvider(create: (context) => BloodOxygenViewModel()),
          ChangeNotifierProvider(create: (context) => BMIViewModel()),
        ],
        child: const riverpod.ProviderScope(child: HeartRaterApp()),
      ),
    ),
  );
}

class HeartRaterApp extends StatelessWidget {
  const HeartRaterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp.router(
          title: LocaleKeys.general_app_title.tr(),
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
        );
      },
    );
  }
}
