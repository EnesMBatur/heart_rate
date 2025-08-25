import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:heart_rate/screens/recipes/components/glycemic_card.dart';
import 'package:heart_rate/screens/recipes/components/nutrition_facts.dart';
import 'package:heart_rate/screens/recipes/notes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailInfo extends StatelessWidget {
  const DetailInfo({required this.recipeData, super.key});

  final Recipe recipeData;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 24 : 16,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recipeData.info, style: textStyle),
          const SizedBox(height: AppConst.kDefaultPadding),

          // GI ve GL değerleri kartı
          GlycemicCard(
            name: recipeData.title,
            gi: recipeData.gi.toString(),
            gl: recipeData.gl.toString(),
            calories: recipeData.nutrition.calories.toString(),
            isRecipe: true,
          ),

          const SizedBox(height: AppConst.kDefaultPadding),

          // Nutrition Facts tablosu
          NutritionFacts(
            calories: recipeData.nutrition.calories.toString(),
            gi: recipeData.gi.toString(),
            gl: recipeData.gl.toString(),
            carbs: recipeData.nutrition.carbs.toString(),
            netCarbs: recipeData.nutrition.netCarbs.toString(),
            totalSugar: recipeData.nutrition.totalSugar.toString(),
            fiber: recipeData.nutrition.fiber.toString(),
            protein: recipeData.nutrition.protein.toString(),
            totalFat: recipeData.nutrition.totalFat.toString(),
            servingSize: recipeData.servings.toString(),
          ),

          const SizedBox(height: AppConst.kDefaultPadding),

          // Notlar kısmı
          Notes(),

          // Sayfa sonu için boşluk
          const SizedBox(height: AppConst.kDefaultPadding),
        ],
      ),
    );
  }
}
