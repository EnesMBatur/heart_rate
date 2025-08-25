import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/recipe_provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeDetailTabBar extends ConsumerWidget {
  const RecipeDetailTabBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedTabRef = ref.watch(recipeProvider);
    return SizedBox(
      height: Device.screenType == ScreenType.tablet ? 46 : 30,
      child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildContainer(
                selectedTabRef,
                0,
                context,
                LocaleKeys.recipedetailitems_info.tr(),
              ),
              buildContainer(
                selectedTabRef,
                1,
                context,
                LocaleKeys.recipedetailitems_ingredients.tr(),
              ),
              buildContainer(
                selectedTabRef,
                2,
                context,
                LocaleKeys.recipedetailitems_instructions.tr(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(
    RecipeNotifier selectedTabRef,
    int index,
    BuildContext context,
    String text,
  ) {
    return GestureDetector(
      onTap: () {
        selectedTabRef.setSelectedTab(index);
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: AppConst.kDefaultPadding,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: selectedTabRef.tab == index
              ? AppConst.kPrimaryColor
              : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: Device.screenType == ScreenType.tablet ? 24 : 16,
            color: selectedTabRef.tab == index
                ? Theme.of(context).primaryColorLight
                : AppConst.kCircleColor,
          ),
        ),
      ),
    );
  }
}

final items = [
  LocaleKeys.recipedetailitems_ingredients.tr(),
  LocaleKeys.recipedetailitems_instructions.tr(),
];
