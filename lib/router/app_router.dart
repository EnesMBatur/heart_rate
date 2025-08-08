import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../screens/home_screen.dart';
import '../screens/heart_rate_screen.dart';
import '../screens/history_screen.dart';
import '../screens/tips_screen.dart';
import '../locale/lang/locale_keys.g.dart';

class AppRouter {
  static const String home = '/home';
  static const String measure = '/measure';
  static const String history = '/history';
  static const String tips = '/tips';

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
                NoTransitionPage(child: const HeartRateScreen()),
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
        GButton(icon: LineIcons.medicalClinic, text: LocaleKeys.home.tr()),
        GButton(icon: LineIcons.heartbeat, text: LocaleKeys.measure.tr()),
        GButton(icon: LineIcons.history, text: LocaleKeys.history.tr()),
        GButton(icon: LineIcons.lightbulb, text: LocaleKeys.tips.tr()),
      ],
      selectedIndex: _getCurrentIndex(context),
      onTabChange: (index) => _onItemTapped(context, index),
    );
  }
}
