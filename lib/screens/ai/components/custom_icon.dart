// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, this.iconData, this.color});
  final IconData? iconData;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData ?? LineIcons.arrowLeft,
      color: color ?? Theme.of(context).primaryColor,
      size: Device.screenType == ScreenType.tablet ? 40 : 32,
    );
  }
}
