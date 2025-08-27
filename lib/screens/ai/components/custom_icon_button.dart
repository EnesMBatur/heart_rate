import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    required this.onPressed,
    required this.iconData,
    super.key,
  });
  final VoidCallback onPressed;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      constraints: const BoxConstraints(),
      splashColor: Colors.transparent,
      iconSize: Device.screenType == ScreenType.tablet
          ? AppConst.kTabletIconSize
          : AppConst.kIconSize,
      icon: Icon(iconData, color: Colors.black),
    );
  }
}
