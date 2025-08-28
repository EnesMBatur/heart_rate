// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/constants.dart';

class ProfileMenuItem extends StatelessWidget {
  const ProfileMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.press,
  });

  final IconData icon;
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: AppConst.kDefaultPadding,
            vertical: AppConst.kDefaultPadding),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppConst.kCircleColor,
              size: Device.screenType == ScreenType.tablet ? 46 : 32,
            ),
            const SizedBox(width: AppConst.kDefaultPadding),
            Expanded(
              child: Text(text,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize:
                          Device.screenType == ScreenType.tablet ? 30 : 17)),
            ),
            Icon(LineIcons.angleRight,
                color: AppConst.kPrimaryColor,
                size: Device.screenType == ScreenType.tablet ? 46 : 32),
          ],
        ),
      ),
    );
  }
}
