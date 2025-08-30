import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:heart_rate/screens/home/home_screen.dart';
import 'package:heart_rate/screens/measure/start_measure_screen.dart';
import 'package:heart_rate/screens/premium/paywall.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../locale/lang/locale_keys.g.dart';
import '../screens/measure/heart_rate_screen.dart';
import '../screens/heart_rate/heart_rate_screen.dart' as heart_rate_tracker;
import '../screens/settings/settings_screen.dart';
import '../screens/history_screen.dart';
import '../screens/settings/components/tips_screen.dart';
import '../screens/report/report_screen.dart';
import '../screens/report/components/metric_detail_screen.dart';
import '../screens/blood_pressure/blood_pressure_screen.dart';
import '../screens/blood_pressure/add_blood_pressure_screen.dart';
import '../screens/blood_pressure/blood_pressure_details_screen.dart';
import '../screens/blood_sugar/blood_sugar_screen.dart';
import '../screens/blood_sugar/blood_sugar_add_screen.dart';
import '../screens/bmi/bmi_screen.dart';
import '../screens/bmi/bmi_add_screen.dart';
import '../screens/blood_oxygen/blood_oxygen_screen.dart';
import '../screens/blood_oxygen/blood_oxygen_input_screen.dart';
import '../screens/recipes/recipes_screen.dart';
import '../screens/ai/ai_screen.dart';
import '../screens/disclaimer/disclaimer_screen.dart';
import '../models/blood_pressure_measurement.dart';
import '../models/blood_sugar_measurement.dart';
import '../models/bmi_record.dart';
import '../models/blood_oxygen_record.dart';

class AppRouter {
  static const String home = '/home';
  static const String measure = '/measure';
  static const String settings = '/settings';
  static const String heartRate = '/heart-rate';
  static const String heartRateTracker = '/heart-rate-tracker';
  static const String history = '/history';
  static const String tips = '/tips';
  static const String report = '/report';
  static const String metricDetail = '/metric-detail';
  static const String bloodPressure = '/blood-pressure';
  static const String bloodPressureAdd = '/blood-pressure/add';
  static const String bloodPressureDetails = '/blood-pressure/details';
  static const String bloodSugar = '/blood-sugar';
  static const String bloodSugarAdd = '/blood-sugar/add';
  static const String bmi = '/bmi';
  static const String bmiAdd = '/bmi/add';
  static const String bloodOxygen = '/blood-oxygen';
  static const String bloodOxygenInput = '/blood-oxygen/input';
  static const String recipes = '/recipes';
  static const String aiDoctor = '/ai-doctor';
  static const String disclaimer = '/disclaimer';
  static const String paywall = '/paywall';

  static final GoRouter router = GoRouter(
    initialLocation: home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => AppShell(child: child),
        routes: [
          GoRoute(
            path: home,
            name: 'home',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const HomeScreen()),
          ),
          GoRoute(
            path: measure,
            name: 'measure',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const StartMeasureScreen()),
          ),
          GoRoute(
            path: settings,
            name: 'settings',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const SettingsScreen()),
          ),
        ],
      ),
      // Full-screen route for paywall (outside shell to hide bottom nav)
      GoRoute(
        path: paywall,
        name: 'paywall',
        pageBuilder: (context, state) =>
            MaterialPage(fullscreenDialog: true, child: const PaywallScreen()),
      ),
      // Full-screen route for heart rate measurement
      GoRoute(
        path: heartRate,
        name: 'heartRate',
        pageBuilder: (context, state) =>
            MaterialPage(child: const HeartRateScreen()),
      ),
      // Full-screen route for heart rate tracker/history
      GoRoute(
        path: heartRateTracker,
        name: 'heartRateTracker',
        pageBuilder: (context, state) =>
            MaterialPage(child: const heart_rate_tracker.HeartRateScreen()),
      ),
      // Full-screen route for report
      GoRoute(
        path: report,
        name: 'report',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return MaterialPage(
            child: ReportScreen(
              heartRate: extra?['heartRate'] ?? 72,
              hrv: extra?['hrv'] ?? 30.0,
              signalQualityPercent: extra?['signalQualityPercent'] ?? 85,
              status: extra?['status'] ?? 'normal',
              mood: extra?['mood'] ?? 3,
              source: extra?['source'], // Add source parameter
            ),
          );
        },
      ),
      // Full-screen route for metric detail
      GoRoute(
        path: metricDetail,
        name: 'metricDetail',
        pageBuilder: (context, state) {
          final extra = state.extra as Map<String, dynamic>?;
          return MaterialPage(
            child: MetricDetailScreen(
              title: extra?['title'] ?? '',
              value: extra?['value'] ?? 0.0,
              unit: extra?['unit'] ?? '',
              status: extra?['status'] ?? '',
              statusColor: extra?['statusColor'] ?? Colors.grey,
              description: extra?['description'] ?? '',
              ranges: List<Map<String, dynamic>>.from(extra?['ranges'] ?? []),
              interpretation: extra?['interpretation'] ?? '',
              recommendations: List<String>.from(
                extra?['recommendations'] ?? [],
              ),
            ),
          );
        },
      ),
      // Full-screen route for blood pressure
      GoRoute(
        path: bloodPressure,
        name: 'bloodPressure',
        pageBuilder: (context, state) =>
            MaterialPage(child: const BloodPressureScreen()),
      ),
      // Full-screen route for adding blood pressure
      GoRoute(
        path: bloodPressureAdd,
        name: 'bloodPressureAdd',
        pageBuilder: (context, state) {
          final measurement = state.extra as BloodPressureMeasurement?;
          return MaterialPage(
            child: AddBloodPressureScreen(measurement: measurement),
          );
        },
      ),
      // Full-screen route for blood pressure details
      GoRoute(
        path: bloodPressureDetails,
        name: 'bloodPressureDetails',
        pageBuilder: (context, state) =>
            MaterialPage(child: const BloodPressureDetailsScreen()),
      ),
      // Full-screen route for blood sugar
      GoRoute(
        path: bloodSugar,
        name: 'bloodSugar',
        pageBuilder: (context, state) =>
            MaterialPage(child: const BloodSugarScreen()),
      ),
      // Full-screen route for adding blood sugar
      GoRoute(
        path: bloodSugarAdd,
        name: 'bloodSugarAdd',
        pageBuilder: (context, state) {
          final measurement = state.extra as BloodSugarMeasurement?;
          return MaterialPage(
            child: BloodSugarAddScreen(measurement: measurement),
          );
        },
      ),
      // Full-screen route for BMI
      GoRoute(
        path: bmi,
        name: 'bmi',
        pageBuilder: (context, state) => MaterialPage(child: const BMIScreen()),
      ),
      // Full-screen route for adding BMI
      GoRoute(
        path: bmiAdd,
        name: 'bmiAdd',
        pageBuilder: (context, state) {
          final record = state.extra as BMIRecord?;
          return MaterialPage(child: BMIAddScreen(record: record));
        },
      ),
      // Full-screen route for Blood Oxygen
      GoRoute(
        path: bloodOxygen,
        name: 'bloodOxygen',
        pageBuilder: (context, state) =>
            MaterialPage(child: const BloodOxygenScreen()),
      ),
      // Full-screen route for adding Blood Oxygen
      GoRoute(
        path: bloodOxygenInput,
        name: 'bloodOxygenInput',
        pageBuilder: (context, state) {
          final record = state.extra as BloodOxygenRecord?;
          return MaterialPage(child: BloodOxygenInputScreen(record: record));
        },
      ),
      // Full-screen route for Recipes
      GoRoute(
        path: recipes,
        name: 'recipes',
        pageBuilder: (context, state) =>
            MaterialPage(child: const RecipesScreen()),
      ),
      // Full-screen route for AI Doctor
      GoRoute(
        path: aiDoctor,
        name: 'aiDoctor',
        pageBuilder: (context, state) => MaterialPage(child: const AiScreen()),
      ),
      // Full-screen route for History
      GoRoute(
        path: history,
        name: 'history',
        pageBuilder: (context, state) =>
            MaterialPage(child: const HistoryScreen()),
      ),
      // Full-screen route for Tips
      GoRoute(
        path: tips,
        name: 'tips',
        pageBuilder: (context, state) =>
            MaterialPage(child: const TipsScreen()),
      ),
      // Full-screen route for Disclaimer
      GoRoute(
        path: disclaimer,
        name: 'disclaimer',
        pageBuilder: (context, state) =>
            MaterialPage(child: const DisclaimerScreen()),
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.navigation_error.tr())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('${LocaleKeys.navigation_page_not_found.tr()}: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: Text(LocaleKeys.navigation_go_home.tr()),
            ),
          ],
        ),
      ),
    ),
  );
}

class AppShell extends StatelessWidget {
  final Widget child;

  const AppShell({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRouter.measure),
        backgroundColor: const Color(0xFFFF6B6B),
        elevation: 8,
        shape: const CircleBorder(),
        child: Icon(
          LineIcons.heartbeat,
          color: Colors.white,
          size: Device.screenType == ScreenType.tablet ? 42 : 38,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: 2,
        tabBuilder: (int index, bool isActive) {
          final icons = [LineIcons.medicalBook, LineIcons.userCog];
          final labels = [
            LocaleKeys.navigation_dashboard.tr(),
            LocaleKeys.navigation_settings.tr(),
          ];

          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icons[index],
                size: Device.screenType == ScreenType.tablet ? 36 : 28,
                color: isActive ? const Color(0xFFFF6B6B) : Colors.grey,
              ),
              const SizedBox(height: 4),
              Text(
                labels[index],
                style: TextStyle(
                  fontSize: Device.screenType == ScreenType.tablet ? 18 : 12,
                  color: isActive ? const Color(0xFFFF6B6B) : Colors.grey,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                ),
              ),
            ],
          );
        },
        activeIndex: _getCurrentIndexForTwoItems(context),
        onTap: (index) => _onItemTappedTwoItems(context, index),
        backgroundColor: Colors.white,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 20,
        rightCornerRadius: 20,
        elevation: 8,
        notchMargin: 8,
        height: 75,
        splashColor: const Color(0xFFFF6B6B).withValues(alpha: 0.2),
      ),
    );
  }

  int _getCurrentIndexForTwoItems(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case AppRouter.home:
        return 0;
      case AppRouter.settings:
        return 1;
      default:
        return 0;
    }
  }

  void _onItemTappedTwoItems(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRouter.home);
        break;
      case 1:
        context.go(AppRouter.settings);
        break;
    }
  }
}
