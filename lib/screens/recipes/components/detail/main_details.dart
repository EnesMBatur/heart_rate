// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/enums/svg_general_enum.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/models/recipes.dart';
import 'package:glycemic_index/provider/recipe_provider.dart';
import 'package:glycemic_index/screens/recipes/components/detail/feature_list.dart';
import 'package:glycemic_index/utility/recipes_time_manager.dart';
import 'package:line_icons/line_icons.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class MainDetails extends ConsumerWidget with RecipeTimeManager {
  const MainDetails({
    required this.recipeData,
    super.key,
  });

  final Recipe recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cookingTime = timeToString(recipeData.cookingTime);
    final servingRef = ref.read(recipeProvider);
    final textStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontSize: Device.screenType == ScreenType.tablet ? 30 : 18);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FittedBox(
          child: Row(
            children: [
              SvgPicture.asset(
                SvgGeneralEnum.clock.svgPath,
                height: Device.screenType == ScreenType.tablet ? 36 : 22,
              ),
              SizedBox(
                width: Device.screenType == ScreenType.tablet ? 16 : 8,
              ),
              Text(
                cookingTime,
                style: textStyle,
              ),
              SizedBox(
                width: Device.screenType == ScreenType.tablet ? 6 : 3,
              ),
              const SizedBox(
                width: 20,
              ),
              Container(
                color: Theme.of(context).primaryColor,
                height: 30,
                width: 2,
              ),
              SizedBox(
                width: Device.screenType == ScreenType.tablet ? 20 : 10,
              ),
              IconButton(
                icon: const Icon(LineIcons.minusCircle),
                color: AppConst.kPrimaryColor,
                iconSize: 28,
                onPressed: servingRef.minusServing,
              ),
              Text(
                servingRef.serving.toString(),
                style: textStyle,
              ),
              IconButton(
                icon: const Icon(LineIcons.plusCircle),
                color: AppConst.kPrimaryColor,
                iconSize: 28,
                onPressed: servingRef.addServing,
              ),
              Text(
                LocaleKeys.others_servings.tr(),
                style: textStyle,
              ),
            ],
          ),
        ),
        SizedBox(
          height: Device.screenType == ScreenType.tablet ? 20 : 10,
        ),
        SizedBox(
          height: Device.screenType == ScreenType.tablet ? 46 : 30,
          child: FeatureList(recipeData: recipeData),
        ),
      ],
    );
  }
}
