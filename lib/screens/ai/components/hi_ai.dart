import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

class HiAi extends StatelessWidget {
  const HiAi({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Padding(
        //   padding: const EdgeInsets.only(left: 4, right: 8, top: 8),
        //   child: ClipOval(
        //     child: SvgPicture.asset(
        //       CoreEnum.genius.svgPath,
        //       height: 32,
        //     ),
        //   ),
        // ),
        Flexible(
          child: Container(
            margin: const EdgeInsets.only(top: 8, bottom: 8, right: 80),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: const BorderRadius.all(Radius.circular(14)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(LocaleKeys.aiChat_hi.tr(), style: textStyle),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
