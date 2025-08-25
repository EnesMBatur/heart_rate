// ignore_for_file: cascade_invocations, lines_longer_than_80_chars

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/screens/recipes/components/detail/ingredient/ingredient_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Ingredients extends ConsumerWidget {
  const Ingredients({required this.recipeData, super.key});

  final Recipe recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
    );
    // TODO: RevenueCat integration
    // final entitlement = provider.Provider.of<RevenueCatProvider>(
    //   context,
    // ).entitlement;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                '${recipeData.ingredients.length} ${LocaleKeys.recipedetailitems_item.tr()} ',
                style: textStyle.copyWith(
                  color: AppConst.kCircleColor,
                  fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
                ),
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(height: 10),
          // if (entitlement == Entitlement.free)
          //   Blur(
          //     blur: 4,
          //     overlay: InkWell(
          //       onTap: () async {
          //         await context.push(AppRouter.paywall);
          //       },
          //       child: SvgPicture.asset(SvgGeneralEnum.lock.svgPath, width: 60),
          //     ),
          //     child: IngredientList(recipeData: recipeData),
          //   )
          // else
          IngredientList(recipeData: recipeData),
        ],
      ),
    );
  }
}
