import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onProButtonPressed;

  const HomeAppBar({super.key, this.onProButtonPressed});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: false,
      title: Text(LocaleKeys.navigation_dashboard.tr()),
      actions: [
        //TODO: Pro
        // PRO Button
        // Container(
        //   margin: const EdgeInsets.only(right: 16),
        //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        //   decoration: BoxDecoration(
        //     color: const Color(0xFFFF6B6B),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: GestureDetector(
        //     onTap: onProButtonPressed,
        //     child: Row(
        //       mainAxisSize: MainAxisSize.min,
        //       children: [
        //         const Icon(Icons.star, color: Colors.white, size: 16),
        //         const SizedBox(width: 4),
        //         Text(
        //           'PRO',
        //           style: TextStyle(
        //             color: Colors.white,
        //             fontSize: 12.sp,
        //             fontWeight: FontWeight.bold,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
