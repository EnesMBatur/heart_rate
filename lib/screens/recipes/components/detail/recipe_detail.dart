// ignore_for_file: public_member_api_docs, sort_constructors_first, cascade_invocations, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/recipe_tab_bar_enum.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/provider/recipe_provider.dart';
import 'package:heart_rate/screens/recipes/components/custom_cached_network_image.dart';
import 'package:heart_rate/screens/recipes/components/detail/info/info.dart';
import 'package:heart_rate/screens/recipes/components/detail/ingredient/ingredients.dart';
import 'package:heart_rate/screens/recipes/components/detail/instruction/instructions.dart';
import 'package:heart_rate/screens/recipes/components/detail/main_details.dart';
import 'package:heart_rate/screens/recipes/components/detail/recipe_detail_tab_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RecipeDetails extends ConsumerStatefulWidget {
  final Recipe recipeData;
  final bool isFav;

  const RecipeDetails({
    required this.recipeData,
    required this.isFav,
    super.key,
  });

  @override
  RecipeDetailsState createState() => RecipeDetailsState();
}

class RecipeDetailsState extends ConsumerState<RecipeDetails> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final serving = ref.read(recipeProvider);
      serving.setServing(widget.recipeData.servings);
    });
  }

  @override
  Widget build(BuildContext context) {
    final selectedTabRef = ref.watch(recipeProvider);
    final size = MediaQuery.of(context).size;
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
    );
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: Device.screenType == ScreenType.tablet
            ? (size.height / 1.9)
            : (size.height / 1.7),
        maxHeight: Device.screenType == ScreenType.tablet
            ? (size.height / 1.4)
            : (size.height / 1.2),
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
        parallaxEnabled: true,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: CustomCachedNetworkImage(
                  boxFit: BoxFit.cover,
                  imageUrl: widget.recipeData.imgUrl,
                  height: Device.screenType == ScreenType.tablet
                      ? (size.height / 2) + 20
                      : (size.height / 2.3) + 20,
                  width: double.infinity,
                ),
                //)
              ),
              Positioned(
                top: 50,
                left: 20,
                child: InkWell(
                  child: buildBackButton(context),
                  onTap: () => Navigator.pop(context),
                ),
              ),
              // Positioned(
              //   top: 50,
              //   right: 20,
              //   child: CustomLikeButton(recipes: widget.recipeData),
              // ),
            ],
          ),
        ),
        panel: Padding(
          padding: const EdgeInsets.all(AppConst.kDefaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: buildDecorationSizedBox(context)),
              const SizedBox(height: 20),
              Text(widget.recipeData.title, style: textStyle),
              SizedBox(
                height: Device.screenType == ScreenType.tablet ? 20 : 10,
              ),
              MainDetails(recipeData: widget.recipeData),
              SizedBox(
                height: Device.screenType == ScreenType.tablet ? 20 : 10,
              ),
              Divider(color: Theme.of(context).dividerColor),
              SizedBox(height: Device.screenType == ScreenType.tablet ? 10 : 5),
              const RecipeDetailTabBar(),
              SizedBox(height: Device.screenType == ScreenType.tablet ? 10 : 5),
              Divider(color: Theme.of(context).dividerColor),
              SizedBox(
                height: Device.screenType == ScreenType.tablet ? 20 : 10,
              ),
              if (selectedTabRef.tab == RecipeTabBarEnum.ingredients.value)
                Expanded(child: Ingredients(recipeData: widget.recipeData)),
              if (selectedTabRef.tab == RecipeTabBarEnum.instructions.value)
                Expanded(child: Instructions(recipeData: widget.recipeData)),
              if (selectedTabRef.tab == RecipeTabBarEnum.info.value)
                Expanded(child: DetailInfo(recipeData: widget.recipeData)),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox buildDecorationSizedBox(BuildContext context) {
    return SizedBox(
      height: 5,
      width: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget buildBackButton(BuildContext context) {
    return Container(
      height: Device.screenType == ScreenType.tablet ? 72 : 40,
      width: Device.screenType == ScreenType.tablet ? 72 : 40,
      decoration: BoxDecoration(
        color: const Color(0XFFE6EBF2),
        //Colors.white24,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Icon(
        LineIcons.arrowLeft,
        size: Device.screenType == ScreenType.tablet
            ? AppConst.kTabletIconSize
            : 30,
        color: AppConst.kCircleColor,
      ),
    );
  }
}
