// ignore_for_file: public_member_api_docs, sort_constructors_first, use_if_null_to_convert_nulls_to_bools, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/screens/recipes/components/custom_cached_network_image.dart';
import 'package:heart_rate/screens/recipes/components/recipe_card_info.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({
    required this.recipeData,
    required this.isFav,
    required this.action,
    super.key,
    this.isChanged,
    this.moment,
  });

  final Recipe recipeData;
  final bool isFav;
  final bool? isChanged;
  final int? moment;
  final VoidCallback action;

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool saved = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Device.screenType == ScreenType.tablet
          ? const EdgeInsets.only(top: AppConst.kDefaultEdgeInsets)
          : const EdgeInsets.only(bottom: AppConst.kDefaultEdgeInsets),
      child: GestureDetector(
        onTap: widget.action,
        child: Card(
          margin: EdgeInsets.only(
            top: 0,
            bottom: AppConst.kDefaultEdgeInsets,
            left: 4,
            right: 4,
          ),
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              buildStack(),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  right: AppConst.kDefaultPadding,
                  bottom: 10,
                  left: AppConst.kDefaultPadding,
                ),
                child: RecipeCardInfo(recipeData: widget.recipeData),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack buildStack() {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: CustomCachedNetworkImage(
              boxFit: BoxFit.cover,
              imageUrl: widget.recipeData.imgUrl,
              height: Device.screenType == ScreenType.tablet ? 33.0.h : 26.0.h,
              width: double.infinity,
            ),
          ),
        ),
        // Positioned(
        //   top: 20,
        //   right: 20,
        //   child: InkWell(
        //     onTap: () {
        //       setState(() {
        //         saved = !saved;
        //       });
        //     },
        //     child: CustomLikeButton(recipes: widget.recipeData),
        //   ),
        // ),
        // if (widget.isChanged == true)
        //   Positioned(
        //     top: 20,
        //     left: 20,
        //     child: InkWell(
        //       onTap: () {
        //         if (widget.moment != null) {
        //           HapticFeedback.vibrate();
        //           MealofDayController.changeMenuItem(widget.moment!);
        //         }
        //       },
        //       child: Container(
        //         height: Device.screenType == ScreenType.tablet ? 72 : 40,
        //         width: Device.screenType == ScreenType.tablet ? 72 : 40,
        //         decoration: BoxDecoration(
        //           color: const Color(0XFFE6EBF2),
        //           borderRadius: BorderRadius.circular(12),
        //         ),
        //         child: Icon(
        //           LineIcons.alternateSync,
        //           color: AppConst.kCircleColor,
        //           size: Device.screenType == ScreenType.tablet
        //               ? AppConst.kTabletIconSize
        //               : AppConst.kIconSize,
        //         ),
        //       ),
        //     ),
        //   ),
      ],
    );
  }
}
