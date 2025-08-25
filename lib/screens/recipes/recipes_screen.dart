import 'package:badges/badges.dart' as badges;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/constants/duration_items.dart';
import 'package:glycemic_index/core/enums/svg_general_enum.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/provider/recipe_provider.dart';
import 'package:glycemic_index/screens/recipes/components/body.dart';
import 'package:glycemic_index/screens/recipes/components/custom_bottom_sheet.dart';
import 'package:glycemic_index/screens/recipes/components/custom_search.dart';
import 'package:glycemic_index/screens/recipes/components/custom_search_delegate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipesScreen extends ConsumerStatefulWidget {
  const RecipesScreen({super.key});

  @override
  RecipesScreenState createState() => RecipesScreenState();
}

class RecipesScreenState extends ConsumerState<RecipesScreen> {
  @override
  Widget build(BuildContext context) {
    final filtersCount = ref.watch(recipeProvider).filters.length;
    return Scaffold(
      appBar: buildAppBar(context, filtersCount),
      body: const Body(),
    );
  }

  AppBar buildAppBar(BuildContext context, int filtersCount) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      leading: buildBadge(filtersCount, context),
      title: Text(LocaleKeys.navbar_recipes.tr()),
      actions: [
        buildSearchButton(context),
        SizedBox(
          width: Device.screenType == ScreenType.tablet ? 8 : 4,
        ),
      ],
    );
  }

  Widget buildBadge(int filtersCount, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: badges.Badge(
        showBadge: filtersCount == 0 ? false : true,
        position: badges.BadgePosition.topEnd(top: 2, end: 10),
        badgeAnimation: badges.BadgeAnimation.slide(
          animationDuration: DurationItems.durationNormal(),
          colorChangeAnimationDuration: DurationItems.durationNormal(),
          curve: Curves.fastOutSlowIn,
          colorChangeAnimationCurve: Curves.easeInCubic,
        ),
        badgeContent: Text(
          filtersCount.toString(),
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColorLight,
                fontSize: Device.screenType == ScreenType.tablet ? 20 : 12,
              ),
        ),
        child: buildIconButton(context),
      ),
    );
  }

  IconButton buildIconButton(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        SvgGeneralEnum.menu.svgPath,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
        height: Device.screenType == ScreenType.tablet
            ? AppConst.kTabletIconSize
            : AppConst.kIconSize,
      ),
      onPressed: () {
        buildShowModalBottomSheet(context);
      },
    );
  }

  Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return CustomBottomSheet(
          onClickedConfirm: () {
            Navigator.pop(context);
            setState(() {});
            ref.read(recipeProvider).filterDivision();
          },
          onClickedClose: () => Navigator.pop(context),
          onClickedClearFilters: () {
            ref.read(recipeProvider).clearFilter();
            Navigator.pop(context);
          },
        );
      },
    );
  }

  IconButton buildSearchButton(BuildContext context) {
    return IconButton(
      icon: SvgPicture.asset(
        SvgGeneralEnum.search.svgPath,
        colorFilter: ColorFilter.mode(
          Theme.of(context).primaryColor,
          BlendMode.srcIn,
        ),
        height: Device.screenType == ScreenType.tablet
            ? AppConst.kTabletIconSize
            : AppConst.kIconSize,
      ),
      onPressed: () {
        showCustomSearch(context: context, delegate: CustomSearchDelegate());
      },
    );
  }
}
