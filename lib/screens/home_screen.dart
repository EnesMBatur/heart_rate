import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodels/home_view_model.dart';
import '../router/app_router.dart';
import '../locale/lang/locale_keys.g.dart';
import '../models/heart_rate_measurement.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;
  HeartRateMeasurement? _lastMeasurement;

  @override
  void initState() {
    super.initState();
    _homeViewModel = HomeViewModel();
    _homeViewModel.loadLastMeasurement();
    _loadLastMeasurement();
  }

  @override
  void dispose() {
    _homeViewModel.dispose();
    super.dispose();
  }

  Future<void> _loadLastMeasurement() async {
    final prefs = await SharedPreferences.getInstance();
    final lastHeartRate = prefs.getInt('last_heart_rate');
    final lastTimestamp = prefs.getString('last_timestamp');

    if (lastHeartRate != null && lastTimestamp != null) {
      setState(() {
        _lastMeasurement = HeartRateMeasurement(
          heartRate: lastHeartRate,
          timestamp: DateTime.parse(lastTimestamp),
          stress: _getStressLevel(lastHeartRate),
          tension: _getTensionLevel(lastHeartRate),
          energy: _getEnergyLevel(lastHeartRate),
        );
      });
    }
  }

  int _getStressLevel(int heartRate) {
    if (heartRate < 60) return 1;
    if (heartRate < 80) return 2;
    if (heartRate < 100) return 3;
    if (heartRate < 120) return 4;
    return 5;
  }

  int _getTensionLevel(int heartRate) {
    if (heartRate < 70) return 1;
    if (heartRate < 90) return 2;
    if (heartRate < 110) return 3;
    if (heartRate < 130) return 4;
    return 5;
  }

  int _getEnergyLevel(int heartRate) {
    if (heartRate < 60) return 2;
    if (heartRate < 80) return 5;
    if (heartRate < 100) return 4;
    if (heartRate < 120) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _homeViewModel,
      child: Consumer<HomeViewModel>(
        builder: (context, homeViewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.heartRater.tr()),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Welcome Card
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Theme.of(context).primaryColor,
                                size: 32,
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Text(
                                  LocaleKeys.welcome_to_heartRater.tr(),
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            LocaleKeys.welcome_description.tr(),
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Last Measurement Card
                  if (_lastMeasurement != null) ...[
                    Text(
                      LocaleKeys.last_measurement.tr(),
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildMeasurementItem(
                                  LocaleKeys.heart_rate.tr(),
                                  '${_lastMeasurement!.heartRate}',
                                  LocaleKeys.bpm.tr(),
                                  Icons.monitor_heart,
                                  Theme.of(context).primaryColor,
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildMeasurementItem(
                                  LocaleKeys.stress.tr(),
                                  '${_lastMeasurement!.stress}',
                                  '/5',
                                  Icons.psychology,
                                  Colors.orange,
                                ),
                                _buildMeasurementItem(
                                  LocaleKeys.tension.tr(),
                                  '${_lastMeasurement!.tension}',
                                  '/5',
                                  Icons.fitness_center,
                                  Colors.red,
                                ),
                                _buildMeasurementItem(
                                  LocaleKeys.energy.tr(),
                                  '${_lastMeasurement!.energy}',
                                  '/5',
                                  Icons.battery_charging_full,
                                  Colors.green,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],

                  // Quick Start Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () => context.go(AppRouter.measure),
                      icon: const Icon(Icons.monitor_heart),
                      label: Text(LocaleKeys.start_heart_rate_measurement.tr()),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Tips Preview
                  Text(
                    LocaleKeys.quick_tips.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTipItem(LocaleKeys.tip_hold_steady.tr()),
                          _buildTipItem(LocaleKeys.tip_breathe_calm.tr()),
                          _buildTipItem(LocaleKeys.tip_cover_camera.tr()),
                          _buildTipItem(LocaleKeys.tip_light_touch.tr()),
                          const SizedBox(height: 12),
                          TextButton(
                            onPressed: () => context.go(AppRouter.tips),
                            child: Text(LocaleKeys.view_all_tips.tr()),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildMeasurementItem(
    String label,
    String value,
    String unit,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Icon(icon, color: color, size: 32),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(unit, style: TextStyle(fontSize: 12, color: color)),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildTipItem(String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
