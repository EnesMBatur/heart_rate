import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:heart_rate/screens/home/home_screen.dart';
import 'package:heart_rate/screens/measure/start_measure_screen.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../screens/measure/heart_rate_screen.dart';
import '../screens/heart_rate/heart_rate_screen.dart' as heart_rate_tracker;
import '../screens/history_screen.dart';
import '../screens/tips_screen.dart';
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
import '../models/blood_pressure_measurement.dart';
import '../models/blood_sugar_measurement.dart';
import '../models/bmi_record.dart';
import '../models/blood_oxygen_record.dart';
import '../locale/lang/locale_keys.g.dart';

class AppRouter {
  static const String home = '/home';
  static const String measure = '/measure';
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
            path: history,
            name: 'history',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const HistoryScreen()),
          ),
          GoRoute(
            path: tips,
            name: 'tips',
            pageBuilder: (context, state) =>
                NoTransitionPage(child: const TipsScreen()),
          ),
        ],
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
    ],
    errorBuilder: (context, state) => Scaffold(
      appBar: AppBar(title: const Text('Error')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.uri}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go(home),
              child: const Text('Go Home'),
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
    return Scaffold(body: child, bottomNavigationBar: buildContainer(context));
  }

  int _getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case AppRouter.home:
        return 0;
      case AppRouter.measure:
        return 1;
      case AppRouter.history:
        return 2;
      case AppRouter.tips:
        return 3;
      default:
        return 0;
    }
  }

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.go(AppRouter.home);
        break;
      case 1:
        context.go(AppRouter.measure);
        break;
      case 2:
        context.go(AppRouter.history);
        break;
      case 3:
        context.go(AppRouter.tips);
        break;
    }
  }

  Container buildContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppConst.kDefaultEdgeInsets),
          topRight: Radius.circular(AppConst.kDefaultEdgeInsets),
        ),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withValues(alpha: 0.1)),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
          child: buildGNav(context),
        ),
      ),
    );
  }

  Widget buildGNav(BuildContext context) {
    return GNav(
      rippleColor: Colors.grey[300]!,
      hoverColor: Colors.grey[100]!,
      gap: 6,
      activeColor: Theme.of(context).cardColor,
      iconSize: Device.screenType == ScreenType.tablet ? 36 : 26,
      padding: const EdgeInsets.symmetric(
        horizontal: AppConst.kDefaultEdgeInsets,
        vertical: 6,
      ),
      duration: DurationItems.durationLow(),
      tabBackgroundColor: AppConst.kPrimaryColor,
      color: AppConst.kCircleColor,
      textStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
        fontSize: Device.screenType == ScreenType.tablet ? 18 : 14,
        color: Theme.of(context).cardColor,
      ),
      tabs: [
        GButton(
          icon: LineIcons.medicalClinic,
          text: LocaleKeys.general_home.tr(),
        ),
        GButton(
          icon: LineIcons.heartbeat,
          text: LocaleKeys.general_measure.tr(),
        ),
        GButton(icon: LineIcons.history, text: LocaleKeys.general_history.tr()),
        GButton(icon: LineIcons.lightbulb, text: LocaleKeys.general_tips.tr()),
      ],
      selectedIndex: _getCurrentIndex(context),
      onTabChange: (index) => _onItemTapped(context, index),
    );
  }
}
