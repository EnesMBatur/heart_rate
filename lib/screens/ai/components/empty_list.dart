// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 24 : 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 2,
    );
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            LineIcons.question,
            size: Device.screenType == ScreenType.tablet ? 100 : 60,
            color: Colors.grey,
          ),
          const SizedBox(height: AppConst.kDefaultPadding),
          Text(text, style: textStyle, textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
