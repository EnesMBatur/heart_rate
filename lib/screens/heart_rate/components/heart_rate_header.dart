import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HeartRateHeader extends StatelessWidget implements PreferredSizeWidget {
  const HeartRateHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.black),
        onPressed: () => context.pop(),
      ),
      title: Text('Heart Rate Tracker'),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
