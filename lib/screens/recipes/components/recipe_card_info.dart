import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/utils/glycemic_index_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeCardInfo extends StatelessWidget
    with RecipeTimeManager, GlycemicIndexColor {
  const RecipeCardInfo({required this.recipeData, super.key});

  final Recipe recipeData;

  @override
  Widget build(BuildContext context) {
    final cookingTime = timeToString(recipeData.cookingTime);
    final textStyle = Theme.of(context).textTheme.titleMedium!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Left side: Title and cooking time in a column
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                recipeData.title,
                style: textStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppConst.kDefaultEdgeInsets),

              // Cooking time with clock icon
              Row(
                children: [
                  SvgPicture.asset(
                    SvgGeneralEnum.clock.svgPath,
                    height: Device.screenType == ScreenType.tablet ? 32 : 18,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    cookingTime,
                    style: textStyle.copyWith(
                      color: AppConst.kCircleColor,
                      fontSize: Device.screenType == ScreenType.tablet
                          ? 26
                          : 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        // Right side: GI and GL indicators in a row
        Expanded(
          flex: 2,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // GI Indicator
              GlycemicIndicator(
                context: context,
                value: recipeData.gi.toString(),
                label: LocaleKeys.calendar_GI.tr(),
                color: getGIColor(recipeData.gi.toString()),
                size: Device.screenType == ScreenType.tablet ? 60 : 48,
              ),

              const SizedBox(width: 8),

              // GL Indicator
              GlycemicIndicator(
                context: context,
                value: recipeData.gl.toString(),
                label: LocaleKeys.calendar_GL.tr(),
                color: getGLColor(recipeData.gl.toString()),
                size: Device.screenType == ScreenType.tablet ? 60 : 48,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
