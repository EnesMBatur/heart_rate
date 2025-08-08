import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';
import '../../models/heart_rate_measurement.dart';

class LastMeasurementCard extends StatelessWidget {
  final HeartRateMeasurement measurement;

  const LastMeasurementCard({super.key, required this.measurement});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
                    _MeasurementItem(
                      label: LocaleKeys.heart_rate.tr(),
                      value: '${measurement.heartRate}',
                      unit: LocaleKeys.bpm.tr(),
                      icon: Icons.monitor_heart,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _MeasurementItem(
                      label: LocaleKeys.stress.tr(),
                      value: '${measurement.stress}',
                      unit: '/5',
                      icon: Icons.psychology,
                      color: Colors.orange,
                    ),
                    _MeasurementItem(
                      label: LocaleKeys.tension.tr(),
                      value: '${measurement.tension}',
                      unit: '/5',
                      icon: Icons.fitness_center,
                      color: Colors.red,
                    ),
                    _MeasurementItem(
                      label: LocaleKeys.energy.tr(),
                      value: '${measurement.energy}',
                      unit: '/5',
                      icon: Icons.battery_charging_full,
                      color: Colors.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _MeasurementItem extends StatelessWidget {
  final String label;
  final String value;
  final String unit;
  final IconData icon;
  final Color color;

  const _MeasurementItem({
    required this.label,
    required this.value,
    required this.unit,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
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
}
