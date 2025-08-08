import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';

class QuickStartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const QuickStartButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: const Icon(Icons.monitor_heart),
        label: Text(LocaleKeys.start_heart_rate_measurement.tr()),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
      ),
    );
  }
}
