// ignore_for_file: public_member_api_docs, sort_constructors_first, lines_longer_than_80_chars
import 'package:blur/blur.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glycemic_index/core/config/router.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/enums/svg_general_enum.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/models/recipes.dart';
import 'package:glycemic_index/provider/revenuecat.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Instructions extends StatelessWidget {
  const Instructions({
    required this.recipeData,
    super.key,
  });

  final Recipe recipeData;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontSize: Device.screenType == ScreenType.tablet ? 24 : 16);
    final entitlement = Provider.of<RevenueCatProvider>(
      context,
    ).entitlement;
    return entitlement == Entitlement.free
        ? Blur(
            blur: 4,
            overlay: InkWell(
              onTap: () async => await context.push(AppRouter.paywall),
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 2 * AppConst.kDefaultPadding),
                child: SvgPicture.asset(
                  SvgGeneralEnum.lock.svgPath,
                  width: 60,
                ),
              ),
            ),
            child: buildScrollView(textStyle, context),
          )
        : buildScrollView(textStyle, context);
  }

  Widget buildScrollView(TextStyle textStyle, BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${recipeData.instructions.length} ${LocaleKeys.recipedetailitems_instruction.tr()}',
            style: textStyle.copyWith(
              color: AppConst.kCircleColor,
              fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
            ),
          ),
          SizedBox(height: Device.screenType == ScreenType.tablet ? 20 : 10),
          ListView.separated(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: recipeData.instructions.length,
            separatorBuilder: (context, index) => Divider(
              color: Theme.of(context).dividerColor,
            ),
            itemBuilder: (context, index) {
              return ListTile(
                minLeadingWidth: 16,
                contentPadding: const EdgeInsets.only(bottom: 10),
                leading: Text(
                  '${index + 1}.',
                  style: textStyle.copyWith(color: AppConst.kPrimaryColor),
                ),
                title: Text(
                  recipeData.instructions[index],
                  style: textStyle,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
