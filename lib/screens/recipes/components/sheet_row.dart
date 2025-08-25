// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SheetRow extends StatelessWidget {
  const SheetRow({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(
            context,
          ).appBarTheme.titleTextStyle!.copyWith(fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ),
        IconButton(
          iconSize: Device.screenType == ScreenType.tablet
              ? AppConst.kTabletIconSize
              : AppConst.kIconSize,
          icon: const Icon(LineIcons.times),
          onPressed: () => Navigator.pop(context),
        ),
      ],
    );
  }
}
