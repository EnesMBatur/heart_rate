// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/svg_general_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EmptyList extends StatelessWidget {
  const EmptyList({this.svgPath, super.key, this.text});

  final String? text;
  final String? svgPath;

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
          SvgPicture.asset(
            svgPath ?? SvgGeneralEnum.notFound.svgPath,
            height: Device.screenType == ScreenType.tablet ? 240 : 180,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: AppConst.kDefaultPadding),
          Text(
            text ?? LocaleKeys.empty_fav.tr(),
            style: textStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
