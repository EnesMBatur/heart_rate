// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_positional_boolean_parameters, unawaited_futures, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLikeButton extends ConsumerWidget {
  const CustomLikeButton({required this.recipes, super.key});

  final Recipe recipes;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ValueListenableBuilder(
      valueListenable: Boxes.getFavRecipes().listenable(),
      builder: (context, Box<Recipe> box, _) {
        return Container(
          height: Device.screenType == ScreenType.tablet ? 72 : 40,
          width: Device.screenType == ScreenType.tablet ? 72 : 40,
          decoration: BoxDecoration(
            color: const Color(0XFFE6EBF2),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 3.5),
            child: LikeButton(
              isLiked: HiveTransactions.isFavRecipe(recipes.id),
              onTap: onLikeButtonTapped,
              likeBuilder: (bool isLiked) {
                return Icon(
                  isLiked ? LineIcons.heartAlt : LineIcons.heart,
                  color: isLiked
                      ? AppConst.kPrimaryColor
                      : AppConst.kCircleColor,
                  size: Device.screenType == ScreenType.tablet
                      ? 32
                      : AppConst.kIconSize,
                );
              },
            ),
          ),
        );
      },
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    !isLiked
        ? HiveTransactions.favRecipeAdd(recipes)
        : HiveTransactions.favRecipeDelete(recipes.id);
    return !isLiked;
  }
}
