// ignore_for_file: cascade_invocations, lines_longer_than_80_chars

import 'package:blur/blur.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glycemic_index/core/config/router.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/enums/svg_general_enum.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/models/recipes.dart';
import 'package:glycemic_index/provider/recipe_provider.dart';
import 'package:glycemic_index/provider/revenuecat.dart';
import 'package:glycemic_index/screens/recipes/components/detail/ingredient/ingredient_list.dart';
import 'package:glycemic_index/utility/snackbar_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart' as provider;

class Ingredients extends ConsumerWidget with SnackBarManager {
  const Ingredients({
    required this.recipeData,
    super.key,
  });

  final Recipe recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
          fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
        );
    final entitlement = provider.Provider.of<RevenueCatProvider>(
      context,
    ).entitlement;
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
              provider.Consumer<RevenueCatProvider>(
                  builder: (context, revenueCatProvider, child) {
                return InkWell(
                  onTap: () async {
                    final entitlement = revenueCatProvider.entitlement;
                    if (entitlement == Entitlement.free) {
                      await context.push(AppRouter.paywall);
                    } else {
                      try {
                        final pieceRef = ref.read(recipeProvider);
                        pieceRef.shoppingListAddAll(
                          recipeData.ingredients,
                          recipeData,
                        );
                        showSuccessSnackBar(
                          context,
                          LocaleKeys.snackbar_ingredientssuccess.tr(),
                        );
                      } catch (e) {
                        showErrorSnackBar(
                          context,
                          LocaleKeys.snackbar_error.tr(),
                        );
                      }
                    }
                  },
                  child: FittedBox(
                    child: Text(
                      LocaleKeys.recipedetailitems_addallchart.tr(),
                      style: textStyle.copyWith(
                        color: AppConst.kPrimaryColor,
                        fontSize:
                            Device.screenType == ScreenType.tablet ? 30 : 18,
                      ),
                    ),
                  ),
                );
              }),
            ],
          ),
          const SizedBox(height: 10),
          if (entitlement == Entitlement.free)
            Blur(
              blur: 4,
              overlay: InkWell(
                onTap: () async {
                  await context.push(AppRouter.paywall);
                },
                child: SvgPicture.asset(
                  SvgGeneralEnum.lock.svgPath,
                  width: 60,
                ),
              ),
              child: IngredientList(recipeData: recipeData),
            )
          else
            IngredientList(recipeData: recipeData),
        ],
      ),
    );
  }
}
