// ignore_for_file: inference_failure_on_instance_creation, omit_local_variable_types, avoid_dynamic_calls, lines_longer_than_80_chars, cascade_invocations

import 'dart:async';

import 'package:animations/animations.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:heart_rate/core/enums/lottie_items_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/provider/recipe_provider.dart';
import 'package:heart_rate/screens/recipes/components/detail/recipe_detail.dart';
import 'package:heart_rate/screens/recipes/components/recipe_card.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const limit = 10;

class RecipesList extends ConsumerStatefulWidget {
  const RecipesList({super.key});

  @override
  RecipesListState createState() => RecipesListState();
}

class RecipesListState extends ConsumerState<RecipesList> {
  final controller = ScrollController(keepScrollOffset: false);
  List<Recipe> recipes = [];
  List<Map<String, String>> filtersRecipeList = [];
  bool hasMore = false;
  bool isLoading = false;
  int page = 1;
  String? _lastLocale;

  //int age = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _fetch();
      controller.addListener(() {
        if (controller.position.maxScrollExtent == controller.offset) {
          _fetch();
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void _scrollUp() {
    if (controller.hasClients) {
      controller.animateTo(
        controller.position.minScrollExtent,
        duration: DurationItems.durationNormal(),
        curve: Curves.fastOutSlowIn,
      );
    }
  }

  Future<void> _fetch() async {
    final recipeRef = ref.read(recipeProvider);
    if (isLoading) return;
    isLoading = true;
    hasMore = true;
    final newRecipes = recipeRef.getList(page, limit);
    setState(() {
      //age = ref.read(recipeProvider).trimester;
      page++;
      isLoading = false;
      if (newRecipes.length < limit) {
        hasMore = false;
      }
      recipes.addAll(newRecipes);
    });
  }

  Future<void> _refresh() async {
    setState(() {
      hasMore = true;
      isLoading = false;
      page = 1;
      recipes.clear();
    });

    await _fetch();
    await Future.delayed(DurationItems.durationNormal());
  }

  @override
  Widget build(BuildContext context) {
    final Function eq = const ListEquality().equals;
    final refFilters = ref.watch(recipeProvider).filters;
    final isEqual = eq(filtersRecipeList, refFilters) as bool;
    final currentLocale = context.locale.toString();

    if (isEqual == false || _lastLocale != currentLocale) {
      _lastLocale = currentLocale;
      filtersRecipeList.clear();
      filtersRecipeList.addAll(refFilters); //});
      _refresh();
      _scrollUp();
    }
    return Expanded(child: buildListView());
  }

  ListView buildListView() {
    return ListView.builder(
      key: PageStorageKey(ref.watch(recipeProvider).trimester),
      physics: const BouncingScrollPhysics(),
      cacheExtent: 99999,
      padding: const EdgeInsets.symmetric(horizontal: AppConst.kDefaultPadding),
      controller: controller,
      itemCount: recipes.length + 1,
      itemBuilder: (context, index) {
        if (index < recipes.length) {
          return OpenContainer(
            transitionDuration: DurationItems.durationLowPlus(),
            transitionType: ContainerTransitionType.fadeThrough,
            closedElevation: 0,
            closedColor:
                Theme.of(context).tabBarTheme.indicatorColor ??
                Theme.of(context).cardColor,
            closedBuilder: (context, action) {
              return RecipeCard(
                recipeData: recipes[index],
                isFav: false,
                action: action,
              );
            },
            openBuilder: (context, action) {
              return RecipeDetails(recipeData: recipes[index], isFav: false);
            },
          );
        } else {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Center(
              child: hasMore
                  ? Lottie.asset(
                      LottieItemsEnum.loading.lottiePath,
                      width: Device.screenType == ScreenType.tablet ? 120 : 80,
                      height: Device.screenType == ScreenType.tablet ? 120 : 80,
                      fit: BoxFit.fill,
                    )
                  : Text(
                      LocaleKeys.general_recipeload.tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
            ),
          );
        }
      },
    );
  }
}
