import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/screens/ai/components/custom_icon.dart';
import 'package:line_icons/line_icons.dart';

class TimesIcon extends StatelessWidget {
  const TimesIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppConst.kDefaultEdgeInsets),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const CustomIcon(
              iconData: LineIcons.times,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}
