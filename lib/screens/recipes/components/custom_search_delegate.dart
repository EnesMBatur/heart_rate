// ignore_for_file: strict_raw_type

import 'package:animations/animations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/constants/duration_items.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/provider/recipe_provider.dart';
import 'package:glycemic_index/screens/recipes/components/custom_search.dart';
import 'package:glycemic_index/screens/recipes/components/detail/recipe_detail.dart';
import 'package:glycemic_index/screens/recipes/components/recipe_card.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomSearchDelegate extends SearchCustomDelegate {
  final limit = 25;

  @override
  TextStyle get searchFieldStyle => TextStyle(
        fontSize: Device.screenType == ScreenType.tablet ? 32 : 20,
        fontFamily: 'Montserrat',
      );

  @override
  Animation<double> get transitionAnimation => const AlwaysStoppedAnimation(0);

  @override
  void showResults(BuildContext context) {
    super.showResults(context);
    showSuggestions(context);
    FocusScope.of(context).unfocus();
  }

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          iconSize: Device.screenType == ScreenType.tablet
              ? AppConst.kTabletIconSize
              : AppConst.kIconSize,
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: Icon(
            LineIcons.times,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        onPressed: () => close(context, null),
        icon: Icon(
          size: Device.screenType == ScreenType.tablet
              ? AppConst.kTabletIconSize
              : AppConst.kIconSize,
          LineIcons.arrowLeft,
          color: Theme.of(context).primaryColor,
        ),
      );

  @override
  Widget buildResults(BuildContext context) => Container();

  @override
  Widget buildSuggestions(BuildContext context) {
    // final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
    //       fontSize: Device.screenType == ScreenType.tablet ? 36 : 22,
    //       fontWeight: FontWeight.w500,
    //       letterSpacing: 2,
    //     );

    final recipes = RecipeNotifier.getData()
        .where((searchResult) {
          final result = searchResult.title.toLowerCase();
          final input = query.toLowerCase();
          return result.contains(input);
        })
        .take(limit)
        .toList();
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          right: AppConst.kDefaultPadding,
          left: AppConst.kDefaultPadding,
          top: AppConst.kDefaultEdgeInsets,
          bottom: AppConst.kDefaultEdgeInsets,
        ),
        child: recipes.isEmpty
            ? SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          LocaleKeys.general_norecipe.tr(),
                          style: Theme.of(context).textTheme.titleMedium,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ListView.builder(
                      cacheExtent: 99999,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      itemCount: recipes.length,
                      itemBuilder: (context, index) => OpenContainer(
                        transitionDuration: DurationItems.durationLowPlus(),
                        transitionType: ContainerTransitionType.fadeThrough,
                        closedElevation: 0,
                        closedColor: AppConst.kBackgroundColor,
                        closedBuilder: (context, action) {
                          return RecipeCard(
                            recipeData: recipes[index],
                            isFav: false,
                            action: action,
                          );
                        },
                        openBuilder: (context, action) {
                          return RecipeDetails(
                            recipeData: recipes[index],
                            isFav: false,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (recipes.length >= limit)
                      Text(
                        LocaleKeys.general_entermoreterms.tr(),
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                  ],
                ),
              ),
      ),
    );
  }
}
