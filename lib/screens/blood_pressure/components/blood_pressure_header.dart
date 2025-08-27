import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      title: Text('Blood Pressure'),
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
