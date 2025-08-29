import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

class BloodPressureHeader extends StatelessWidget
    implements PreferredSizeWidget {
  const BloodPressureHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => context.pop(),
      ),
      title: Text(LocaleKeys.health_blood_pressure.tr()),
      // actions: [
      //   IconButton(
      //     icon: const Icon(Icons.more_vert, color: Colors.black),
      //     onPressed: () {
      //       // Show menu options
      //     },
      //   ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
