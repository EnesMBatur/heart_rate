import 'package:easy_localization/easy_localization.dart';
import 'package:heart_rate/core/enums/diets_enum.dart';
import 'package:heart_rate/core/enums/meals_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/models/recipe/ingredient.dart';
import 'package:heart_rate/models/recipe/nutrition.dart';
import 'package:heart_rate/models/recipe/recipes.dart';

class RecipeData {
  final values = [
    Recipe(
      id: 1,
      title: LocaleKeys.recipes_oatmeal_berries_title.tr(),
      imgUrl: 'https://i.imgur.com/1VVvW75.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_oatmeal_berries_info.tr(),
      gi: 55,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_oatmeal_berries_ingredients_1_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_oatmeal_berries_ingredients_1_unit.tr(),
          icon: 'assets/svg/oatmeal.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_oatmeal_berries_ingredients_2_name.tr(),
          amount: 200,
          unit: LocaleKeys.recipes_oatmeal_berries_ingredients_2_unit.tr(),
          icon: 'assets/svg/water.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_oatmeal_berries_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_oatmeal_berries_ingredients_3_unit.tr(),
          icon: 'assets/svg/strawberry.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_oatmeal_berries_ingredients_4_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_oatmeal_berries_ingredients_4_unit.tr(),
          icon: 'assets/svg/raspberry.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_oatmeal_berries_instructions_1.tr(),
        LocaleKeys.recipes_oatmeal_berries_instructions_2.tr(),
        LocaleKeys.recipes_oatmeal_berries_instructions_3.tr(),
        LocaleKeys.recipes_oatmeal_berries_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 27,
        netCarbs: 23,
        calories: 150,
        protein: 5,
        fiber: 4,
        totalFat: 3,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 2,
      title: LocaleKeys.recipes_vegetable_omelette_title.tr(),
      imgUrl: 'https://i.imgur.com/jR9LHun.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegetable_omelette_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegetable_omelette_ingredients_1_name.tr(),
          amount: 2,
          icon: 'assets/svg/egg.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegetable_omelette_ingredients_2_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_vegetable_omelette_ingredients_2_unit.tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegetable_omelette_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegetable_omelette_ingredients_3_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegetable_omelette_ingredients_4_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_vegetable_omelette_ingredients_4_unit.tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegetable_omelette_instructions_1.tr(),
        LocaleKeys.recipes_vegetable_omelette_instructions_2.tr(),
        LocaleKeys.recipes_vegetable_omelette_instructions_3.tr(),
        LocaleKeys.recipes_vegetable_omelette_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 7,
        calories: 180,
        protein: 12,
        fiber: 3,
        totalFat: 10,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegantarian.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 3,
      title: LocaleKeys.recipes_chocolate_avocado_mousse_title.tr(),
      imgUrl: 'https://i.imgur.com/amE7TQW.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chocolate_avocado_mousse_info.tr(),
      gi: 40,
      gl: 6.1,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_2_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cocoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/honey.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_chocolate_avocado_mousse_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chocolate_avocado_mousse_instructions_1.tr(),
        LocaleKeys.recipes_chocolate_avocado_mousse_instructions_2.tr(),
        LocaleKeys.recipes_chocolate_avocado_mousse_instructions_3.tr(),
        LocaleKeys.recipes_chocolate_avocado_mousse_instructions_4.tr(),
        LocaleKeys.recipes_chocolate_avocado_mousse_instructions_5.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 22,
        netCarbs: 15,
        calories: 230,
        protein: 3,
        fiber: 7,
        totalFat: 17,
        totalSugar: 123,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 4,
      title: LocaleKeys.recipes_quinoa_chickpea_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/QT0Ez44.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_quinoa_chickpea_salad_info.tr(),
      gi: 40,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_1_name
              .tr(),
          amount: 70,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_quinoa_chickpea_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_quinoa_chickpea_salad_instructions_1.tr(),
        LocaleKeys.recipes_quinoa_chickpea_salad_instructions_2.tr(),
        LocaleKeys.recipes_quinoa_chickpea_salad_instructions_3.tr(),
        LocaleKeys.recipes_quinoa_chickpea_salad_instructions_4.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 25,
        calories: 320,
        protein: 12,
        fiber: 10,
        totalFat: 14,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
      ],
    ),
    Recipe(
      id: 5,
      title: LocaleKeys.recipes_grilled_salmon_veggies_title.tr(),
      imgUrl: 'https://i.imgur.com/YxFbtib.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_salmon_veggies_info.tr(),
      gi: 15,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_grilled_salmon_veggies_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_salmon_veggies_instructions_1.tr(),
        LocaleKeys.recipes_grilled_salmon_veggies_instructions_2.tr(),
        LocaleKeys.recipes_grilled_salmon_veggies_instructions_3.tr(),
        LocaleKeys.recipes_grilled_salmon_veggies_instructions_4.tr(),
        LocaleKeys.recipes_grilled_salmon_veggies_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 12,
        netCarbs: 8,
        calories: 300,
        protein: 30,
        fiber: 4,
        totalFat: 15,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowSugar.value,
      ],
    ),
    Recipe(
      id: 6,
      title: LocaleKeys.recipes_berry_smoothie_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/VOIYETJ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_berry_smoothie_bowl_info.tr(),
      gi: 30,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_1_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_1_unit.tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_2_name.tr(),
          amount: 0.5,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_3_name.tr(),
          amount: 200,
          unit: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_3_unit.tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_4_name.tr(),
          amount: 1,
          icon: 'assets/svg/kiwi.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_5_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_berry_smoothie_bowl_ingredients_5_unit.tr(),
          icon: 'assets/svg/chia.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_berry_smoothie_bowl_instructions_1.tr(),
        LocaleKeys.recipes_berry_smoothie_bowl_instructions_2.tr(),
        LocaleKeys.recipes_berry_smoothie_bowl_instructions_3.tr(),
        LocaleKeys.recipes_berry_smoothie_bowl_instructions_4.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 28,
        netCarbs: 22,
        calories: 210,
        protein: 5,
        fiber: 6,
        totalFat: 4,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 7,
      title: LocaleKeys.recipes_avocado_tofu_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/aMmEtaz.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_avocado_tofu_salad_info.tr(),
      gi: 25,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_1_unit.tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_2_name.tr(),
          amount: 1,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_3_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_3_unit.tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_4_unit.tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_5_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_5_unit.tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_6_name.tr(),
          amount: 20,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_6_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_7_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_7_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_avocado_tofu_salad_ingredients_8_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_tofu_salad_ingredients_9_name.tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_avocado_tofu_salad_instructions_1.tr(),
        LocaleKeys.recipes_avocado_tofu_salad_instructions_2.tr(),
        LocaleKeys.recipes_avocado_tofu_salad_instructions_3.tr(),
        LocaleKeys.recipes_avocado_tofu_salad_instructions_4.tr(),
        LocaleKeys.recipes_avocado_tofu_salad_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 18,
        netCarbs: 13,
        calories: 220,
        protein: 10,
        fiber: 5,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 8,
      title: LocaleKeys.recipes_chicken_veggie_stir_fry_title.tr(),
      imgUrl: 'https://i.imgur.com/IFD494X.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chicken_veggie_stir_fry_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/peas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chicken_veggie_stir_fry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_1.tr(),
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_2.tr(),
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_3.tr(),
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_4.tr(),
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_5.tr(),
        LocaleKeys.recipes_chicken_veggie_stir_fry_instructions_6.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 12,
        calories: 250,
        protein: 28,
        fiber: 3,
        totalFat: 9,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 9,
      title: LocaleKeys.recipes_shrimp_zoodles_title.tr(),
      imgUrl: 'https://i.imgur.com/1wbButN.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_shrimp_zoodles_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_1_unit.tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_2_unit.tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_3_name.tr(),
          amount: 20,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_3_unit.tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_4_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_4_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_5_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_5_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_shrimp_zoodles_ingredients_6_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_shrimp_zoodles_ingredients_7_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_shrimp_zoodles_instructions_1.tr(),
        LocaleKeys.recipes_shrimp_zoodles_instructions_2.tr(),
        LocaleKeys.recipes_shrimp_zoodles_instructions_3.tr(),
        LocaleKeys.recipes_shrimp_zoodles_instructions_4.tr(),
        LocaleKeys.recipes_shrimp_zoodles_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 7,
        calories: 220,
        protein: 25,
        fiber: 3,
        totalFat: 8,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 10,
      title: LocaleKeys.recipes_fruit_yogurt_parfait_title.tr(),
      imgUrl: 'https://i.imgur.com/elAMOtC.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_fruit_yogurt_parfait_info.tr(),
      gi: 35,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_1_unit.tr(),
          icon: 'assets/svg/yogurt.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_2_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_2_unit.tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_3_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_3_unit.tr(),
          icon: 'assets/svg/granola.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_4_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_fruit_yogurt_parfait_ingredients_4_unit.tr(),
          icon: 'assets/svg/honey.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_fruit_yogurt_parfait_instructions_1.tr(),
        LocaleKeys.recipes_fruit_yogurt_parfait_instructions_2.tr(),
        LocaleKeys.recipes_fruit_yogurt_parfait_instructions_3.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 21,
        calories: 180,
        protein: 10,
        fiber: 4,
        totalFat: 3,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 11,
      title: LocaleKeys.recipes_beef_stir_fry_broccoli_title.tr(),
      imgUrl: 'https://i.imgur.com/VSZUCPr.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_beef_stir_fry_broccoli_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/beef.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_7_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_beef_stir_fry_broccoli_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/spring-onion.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_1.tr(),
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_2.tr(),
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_3.tr(),
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_4.tr(),
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_5.tr(),
        LocaleKeys.recipes_beef_stir_fry_broccoli_instructions_6.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 7,
        calories: 280,
        protein: 30,
        fiber: 3,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 12,
      title: LocaleKeys.recipes_gluten_free_pasta_pesto_title.tr(),
      imgUrl: 'https://i.imgur.com/8qR1IBg.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_gluten_free_pasta_pesto_info.tr(),
      gi: 45,
      gl: 12,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_1_name
              .tr(),
          amount: 75,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/pasta.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_2_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_4_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_5_name
              .tr(),
          amount: 15,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/nuts.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/yeast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_8_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_gluten_free_pasta_pesto_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_gluten_free_pasta_pesto_instructions_1.tr(),
        LocaleKeys.recipes_gluten_free_pasta_pesto_instructions_2.tr(),
        LocaleKeys.recipes_gluten_free_pasta_pesto_instructions_3.tr(),
        LocaleKeys.recipes_gluten_free_pasta_pesto_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 44,
        calories: 350,
        protein: 12,
        fiber: 6,
        totalFat: 14,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 13,
      title: LocaleKeys.recipes_lentil_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/9KJ3st3.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_lentil_soup_info.tr(),
      gi: 30,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_1_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_1_unit.tr(),
          icon: 'assets/svg/green-lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_2_name.tr(),
          amount: 1,
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_3_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_3_unit.tr(),
          icon: 'assets/svg/celery.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_4_name.tr(),
          amount: 1,
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_5_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_5_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_6_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_6_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_7_name.tr(),
          amount: 500,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_7_unit.tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_lentil_soup_ingredients_8_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_9_name.tr(),
          amount: 1,
          icon: 'assets/svg/bay.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_soup_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_lentil_soup_instructions_1.tr(),
        LocaleKeys.recipes_lentil_soup_instructions_2.tr(),
        LocaleKeys.recipes_lentil_soup_instructions_3.tr(),
        LocaleKeys.recipes_lentil_soup_instructions_4.tr(),
        LocaleKeys.recipes_lentil_soup_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 28,
        calories: 300,
        protein: 15,
        fiber: 12,
        totalFat: 7,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 14,
      title: LocaleKeys.recipes_chicken_wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/pzgRd42.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chicken_wrap_info.tr(),
      gi: 35,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_1_name.tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_2_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_chicken_wrap_ingredients_2_unit.tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_3_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_chicken_wrap_ingredients_3_unit.tr(),
          icon: 'assets/svg/lettuce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_chicken_wrap_ingredients_4_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_5_name.tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chicken_wrap_ingredients_6_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chicken_wrap_ingredients_7_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chicken_wrap_instructions_1.tr(),
        LocaleKeys.recipes_chicken_wrap_instructions_2.tr(),
        LocaleKeys.recipes_chicken_wrap_instructions_3.tr(),
        LocaleKeys.recipes_chicken_wrap_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 280,
        protein: 25,
        fiber: 5,
        totalFat: 10,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 15,
      title: LocaleKeys.recipes_stuffed_bell_peppers_title.tr(),
      imgUrl: 'https://i.imgur.com/FsFWQkb.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_stuffed_bell_peppers_info.tr(),
      gi: 35,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_1_name.tr(),
          amount: 2,
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_2_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_2_unit.tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_3_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_3_unit.tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_4_unit.tr(),
          icon: 'assets/svg/corn.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_5_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_5_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_6_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_6_unit.tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_7_name.tr(),
          amount: 5,
          unit: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_7_unit.tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_stuffed_bell_peppers_ingredients_8_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_1.tr(),
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_2.tr(),
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_3.tr(),
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_4.tr(),
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_5.tr(),
        LocaleKeys.recipes_stuffed_bell_peppers_instructions_6.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 37,
        calories: 300,
        protein: 10,
        fiber: 8,
        totalFat: 5,
        totalSugar: 7,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 16,
      title: LocaleKeys.recipes_spaghetti_squash_marinara_title.tr(),
      imgUrl: 'https://i.imgur.com/L0ByR5k.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spaghetti_squash_marinara_info.tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/squash.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_3_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_4_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_9_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_spaghetti_squash_marinara_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/pepper.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_1.tr(),
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_2.tr(),
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_3.tr(),
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_4.tr(),
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_5.tr(),
        LocaleKeys.recipes_spaghetti_squash_marinara_instructions_6.tr(),
      ],
      cookingTime: 45,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 220,
        protein: 5,
        fiber: 8,
        totalFat: 7,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 17,
      title: LocaleKeys.recipes_overnight_chia_pudding_title.tr(),
      imgUrl: 'https://i.imgur.com/zMw6Upd.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_overnight_chia_pudding_info.tr(),
      gi: 25,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_overnight_chia_pudding_ingredients_1_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_overnight_chia_pudding_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_overnight_chia_pudding_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_overnight_chia_pudding_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_overnight_chia_pudding_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_overnight_chia_pudding_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/mango.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_overnight_chia_pudding_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_overnight_chia_pudding_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_overnight_chia_pudding_instructions_1.tr(),
        LocaleKeys.recipes_overnight_chia_pudding_instructions_2.tr(),
        LocaleKeys.recipes_overnight_chia_pudding_instructions_3.tr(),
        LocaleKeys.recipes_overnight_chia_pudding_instructions_4.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 18,
        calories: 180,
        protein: 6,
        fiber: 7,
        totalFat: 5,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 18,
      title: LocaleKeys.recipes_chickpea_spinach_curry_title.tr(),
      imgUrl: 'https://i.imgur.com/PYk2A3D.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chickpea_spinach_curry_info.tr(),
      gi: 35,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_4_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/curry.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_spinach_curry_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chickpea_spinach_curry_instructions_1.tr(),
        LocaleKeys.recipes_chickpea_spinach_curry_instructions_2.tr(),
        LocaleKeys.recipes_chickpea_spinach_curry_instructions_3.tr(),
        LocaleKeys.recipes_chickpea_spinach_curry_instructions_4.tr(),
        LocaleKeys.recipes_chickpea_spinach_curry_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 30,
        calories: 280,
        protein: 12,
        fiber: 10,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 19,
      title: LocaleKeys.recipes_zucchini_noodle_bolognese_title.tr(),
      imgUrl: 'https://i.imgur.com/8qrAu46.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_zucchini_noodle_bolognese_info.tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_4_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/thyme.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zucchini_noodle_bolognese_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_1.tr(),
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_2.tr(),
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_3.tr(),
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_4.tr(),
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_5.tr(),
        LocaleKeys.recipes_zucchini_noodle_bolognese_instructions_6.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 240,
        protein: 10,
        fiber: 8,
        totalFat: 6,
        totalSugar: 7,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 20,
      title: LocaleKeys.recipes_turkey_sweet_potato_hash_title.tr(),
      imgUrl: 'https://i.imgur.com/IJ2tmPu.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turkey_sweet_potato_hash_info.tr(),
      gi: 40,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/minced-meat.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/red-chili-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_sweet_potato_hash_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turkey_sweet_potato_hash_instructions_1.tr(),
        LocaleKeys.recipes_turkey_sweet_potato_hash_instructions_2.tr(),
        LocaleKeys.recipes_turkey_sweet_potato_hash_instructions_3.tr(),
        LocaleKeys.recipes_turkey_sweet_potato_hash_instructions_4.tr(),
        LocaleKeys.recipes_turkey_sweet_potato_hash_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 28,
        calories: 300,
        protein: 25,
        fiber: 7,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.lunch.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 21,
      title: LocaleKeys.recipes_quinoa_stuffed_eggplant_title.tr(),
      imgUrl: 'https://i.imgur.com/2rYgLxT.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_quinoa_stuffed_eggplant_info.tr(),
      gi: 40,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_stuffed_eggplant_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_quinoa_stuffed_eggplant_instructions_1.tr(),
        LocaleKeys.recipes_quinoa_stuffed_eggplant_instructions_2.tr(),
        LocaleKeys.recipes_quinoa_stuffed_eggplant_instructions_3.tr(),
        LocaleKeys.recipes_quinoa_stuffed_eggplant_instructions_4.tr(),
        LocaleKeys.recipes_quinoa_stuffed_eggplant_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 35,
        calories: 320,
        protein: 10,
        fiber: 10,
        totalFat: 7,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 22,
      title: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_title.tr(),
      imgUrl: 'https://i.imgur.com/WCPI4AE.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/peas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_veg_stir_fry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_1.tr(),
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_2.tr(),
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_3.tr(),
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_4.tr(),
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_5.tr(),
        LocaleKeys.recipes_spicy_tofu_veg_stir_fry_instructions_6.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 220,
        protein: 16,
        fiber: 5,
        totalFat: 7,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 23,
      title: LocaleKeys.recipes_grilled_mackerel_citrus_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/2kuDW2o.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_mackerel_citrus_salad_info.tr(),
      gi: 10,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_3_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/orange.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_mackerel_citrus_salad_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_mackerel_citrus_salad_instructions_1.tr(),
        LocaleKeys.recipes_grilled_mackerel_citrus_salad_instructions_2.tr(),
        LocaleKeys.recipes_grilled_mackerel_citrus_salad_instructions_3.tr(),
        LocaleKeys.recipes_grilled_mackerel_citrus_salad_instructions_4.tr(),
        LocaleKeys.recipes_grilled_mackerel_citrus_salad_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 8,
        calories: 280,
        protein: 30,
        fiber: 2,
        totalFat: 14,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 24,
      title: LocaleKeys.recipes_mediterranean_chickpea_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/IvJWFMA.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_chickpea_salad_info.tr(),
      gi: 35,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olives.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_salad_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_chickpea_salad_instructions_1.tr(),
        LocaleKeys.recipes_mediterranean_chickpea_salad_instructions_2.tr(),
        LocaleKeys.recipes_mediterranean_chickpea_salad_instructions_3.tr(),
        LocaleKeys.recipes_mediterranean_chickpea_salad_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 280,
        protein: 10,
        fiber: 8,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 25,
      title: LocaleKeys.recipes_roasted_cauliflower_steaks_title.tr(),
      imgUrl: 'https://i.imgur.com/wG5HbzS.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_cauliflower_steaks_info.tr(),
      gi: 25,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_cauliflower_steaks_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_cauliflower_steaks_instructions_1.tr(),
        LocaleKeys.recipes_roasted_cauliflower_steaks_instructions_2.tr(),
        LocaleKeys.recipes_roasted_cauliflower_steaks_instructions_3.tr(),
        LocaleKeys.recipes_roasted_cauliflower_steaks_instructions_4.tr(),
        LocaleKeys.recipes_roasted_cauliflower_steaks_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 12,
        calories: 150,
        protein: 5,
        fiber: 8,
        totalFat: 7,
        totalSugar: 4,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 26,
      title: LocaleKeys.recipes_lentil_bolognese_title.tr(),
      imgUrl: 'https://i.imgur.com/FrevMvN.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_lentil_bolognese_info.tr(),
      gi: 35,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_1_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_1_unit.tr(),
          icon: 'assets/svg/green-lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_2_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_3_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_4_unit.tr(),
          icon: 'assets/svg/celery.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_5_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_5_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_6_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_6_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_7_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_7_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_8_name.tr(),
          amount: 75,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_8_unit.tr(),
          icon: 'assets/svg/pasta.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_9_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_lentil_bolognese_ingredients_9_unit.tr(),
          icon: 'assets/svg/bay.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_lentil_bolognese_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_lentil_bolognese_instructions_1.tr(),
        LocaleKeys.recipes_lentil_bolognese_instructions_2.tr(),
        LocaleKeys.recipes_lentil_bolognese_instructions_3.tr(),
        LocaleKeys.recipes_lentil_bolognese_instructions_4.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 38,
        calories: 350,
        protein: 18,
        fiber: 12,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 27,
      title: LocaleKeys.recipes_herbed_chicken_veg_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/eoNxj6m.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herbed_chicken_veg_soup_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/celery.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_6_name
              .tr(),
          amount: 400,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/thyme.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_chicken_veg_soup_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_1.tr(),
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_2.tr(),
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_3.tr(),
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_4.tr(),
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_5.tr(),
        LocaleKeys.recipes_herbed_chicken_veg_soup_instructions_6.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 8,
        calories: 200,
        protein: 25,
        fiber: 2,
        totalFat: 5,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 28,
      title: LocaleKeys.recipes_avocado_tomato_gluten_toast_title.tr(),
      imgUrl: 'https://i.imgur.com/Zc2zF2J.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_avocado_tomato_gluten_toast_info.tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_1_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_tomato_gluten_toast_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_avocado_tomato_gluten_toast_instructions_1.tr(),
        LocaleKeys.recipes_avocado_tomato_gluten_toast_instructions_2.tr(),
        LocaleKeys.recipes_avocado_tomato_gluten_toast_instructions_3.tr(),
        LocaleKeys.recipes_avocado_tomato_gluten_toast_instructions_4.tr(),
      ],
      cookingTime: 8,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 250,
        protein: 6,
        fiber: 5,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 29,
      title: LocaleKeys.recipes_turkey_chili_title.tr(),
      imgUrl: 'https://i.imgur.com/B6WDW52.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turkey_chili_info.tr(),
      gi: 30,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_1_unit.tr(),
          icon: 'assets/svg/minced-meat.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_2_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_2_unit.tr(),
          icon: 'assets/svg/beans.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_3_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_3_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_4_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_5_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_5_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_6_unit.tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_7_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_7_unit.tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_8_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_9_name.tr(),
          amount: 200,
          unit: LocaleKeys.recipes_turkey_chili_ingredients_9_unit.tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_chili_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turkey_chili_instructions_1.tr(),
        LocaleKeys.recipes_turkey_chili_instructions_2.tr(),
        LocaleKeys.recipes_turkey_chili_instructions_3.tr(),
        LocaleKeys.recipes_turkey_chili_instructions_4.tr(),
        LocaleKeys.recipes_turkey_chili_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 350,
        protein: 28,
        fiber: 8,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 30,
      title: LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_title.tr(),
      imgUrl: 'https://i.imgur.com/eq9Sggb.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_info.tr(),
      gi: 35,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_1_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_7_name
              .tr(),
          amount: 250,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mixed_vegetable_quinoa_pilaf_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_instructions_1.tr(),
        LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_instructions_2.tr(),
        LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_instructions_3.tr(),
        LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_instructions_4.tr(),
        LocaleKeys.recipes_mixed_vegetable_quinoa_pilaf_instructions_5.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 320,
        protein: 10,
        fiber: 8,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 31,
      title: LocaleKeys.recipes_spinach_feta_stuffed_chicken_title.tr(),
      imgUrl: 'https://i.imgur.com/gO2iLhZ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spinach_feta_stuffed_chicken_info.tr(),
      gi: 25,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/feta.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spinach_feta_stuffed_chicken_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_1.tr(),
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_2.tr(),
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_3.tr(),
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_4.tr(),
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_5.tr(),
        LocaleKeys.recipes_spinach_feta_stuffed_chicken_instructions_6.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 350,
        protein: 35,
        fiber: 1,
        totalFat: 15,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowSugar.value,
      ],
    ),
    Recipe(
      id: 32,
      title: LocaleKeys.recipes_eggplant_chickpea_stew_title.tr(),
      imgUrl: 'https://i.imgur.com/cZaG2Fd.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_eggplant_chickpea_stew_info.tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/paprika.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_10_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_eggplant_chickpea_stew_ingredients_10_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_eggplant_chickpea_stew_instructions_1.tr(),
        LocaleKeys.recipes_eggplant_chickpea_stew_instructions_2.tr(),
        LocaleKeys.recipes_eggplant_chickpea_stew_instructions_3.tr(),
        LocaleKeys.recipes_eggplant_chickpea_stew_instructions_4.tr(),
        LocaleKeys.recipes_eggplant_chickpea_stew_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 26,
        calories: 280,
        protein: 8,
        fiber: 9,
        totalFat: 10,
        totalSugar: 7,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 33,
      title: LocaleKeys.recipes_greek_chicken_souvlaki_title.tr(),
      imgUrl: 'https://i.imgur.com/XLyMBOD.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_greek_chicken_souvlaki_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_greek_chicken_souvlaki_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_greek_chicken_souvlaki_instructions_1.tr(),
        LocaleKeys.recipes_greek_chicken_souvlaki_instructions_2.tr(),
        LocaleKeys.recipes_greek_chicken_souvlaki_instructions_3.tr(),
        LocaleKeys.recipes_greek_chicken_souvlaki_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 300,
        protein: 35,
        fiber: 1,
        totalFat: 10,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 34,
      title: LocaleKeys.recipes_vegan_lentil_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/cWleAlV.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_lentil_salad_info.tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_1_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_1_unit.tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_2_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_2_unit.tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_3_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_4_name.tr(),
          amount: 20,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_4_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_5_name.tr(),
          amount: 5,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_5_unit.tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_6_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_7_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_7_unit.tr(),
          icon: 'assets/svg/mustard.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_salad_ingredients_8_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_salad_ingredients_9_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_lentil_salad_instructions_1.tr(),
        LocaleKeys.recipes_vegan_lentil_salad_instructions_2.tr(),
        LocaleKeys.recipes_vegan_lentil_salad_instructions_3.tr(),
        LocaleKeys.recipes_vegan_lentil_salad_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 20,
        calories: 250,
        protein: 12,
        fiber: 10,
        totalFat: 10,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 35,
      title: LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_title.tr(),
      imgUrl: 'https://i.imgur.com/xfK5UuH.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_info.tr(),
      gi: 40,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_6_name
              .tr(),
          amount: 15,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/nuts.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_cinnamon_apple_baked_oatmeal_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_instructions_1.tr(),
        LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_instructions_2.tr(),
        LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_instructions_3.tr(),
        LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_instructions_4.tr(),
        LocaleKeys.recipes_cinnamon_apple_baked_oatmeal_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 33,
        calories: 300,
        protein: 8,
        fiber: 7,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 36,
      title: LocaleKeys.recipes_roasted_vegetable_lasagna_title.tr(),
      imgUrl: 'https://i.imgur.com/W7t6VPo.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_vegetable_lasagna_info.tr(),
      gi: 35,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_1_name
              .tr(),
          amount: 3,
          icon: 'assets/svg/lasagna.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_6_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_9_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_vegetable_lasagna_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_1.tr(),
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_2.tr(),
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_3.tr(),
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_4.tr(),
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_5.tr(),
        LocaleKeys.recipes_roasted_vegetable_lasagna_instructions_6.tr(),
      ],
      cookingTime: 50,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 48,
        calories: 400,
        protein: 10,
        fiber: 12,
        totalFat: 15,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 37,
      title: LocaleKeys.recipes_zesty_lemon_shrimp_title.tr(),
      imgUrl: 'https://i.imgur.com/YdKt0zu.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_zesty_lemon_shrimp_info.tr(),
      gi: 15,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_1_unit.tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_2_unit.tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_3_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_3_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_4_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_4_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_5_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_5_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_6_name.tr(),
          amount: 5,
          unit: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_6_unit.tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_zesty_lemon_shrimp_ingredients_7_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_1.tr(),
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_2.tr(),
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_3.tr(),
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_4.tr(),
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_5.tr(),
        LocaleKeys.recipes_zesty_lemon_shrimp_instructions_6.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 12,
        netCarbs: 8,
        calories: 250,
        protein: 28,
        fiber: 4,
        totalFat: 8,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 38,
      title: LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_title.tr(),
      imgUrl: 'https://i.imgur.com/mbebwcP.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_info.tr(),
      gi: 35,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_3_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/tortillas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_4_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/red-cabbage.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_tacos_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_tacos_instructions_5
            .tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 35,
        calories: 350,
        protein: 12,
        fiber: 10,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 39,
      title: LocaleKeys.recipes_grilled_turkey_lettuce_wraps_title.tr(),
      imgUrl: 'https://i.imgur.com/xEZFJBh.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_turkey_lettuce_wraps_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_2_name
              .tr(),
          amount: 4,
          icon: 'assets/svg/lettuce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_5_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/mustard.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_turkey_lettuce_wraps_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_turkey_lettuce_wraps_instructions_1.tr(),
        LocaleKeys.recipes_grilled_turkey_lettuce_wraps_instructions_2.tr(),
        LocaleKeys.recipes_grilled_turkey_lettuce_wraps_instructions_3.tr(),
        LocaleKeys.recipes_grilled_turkey_lettuce_wraps_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 11,
        calories: 250,
        protein: 30,
        fiber: 4,
        totalFat: 10,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 40,
      title: LocaleKeys.recipes_vegan_quinoa_black_bean_stuffed_peppers_title
          .tr(),
      imgUrl: 'https://i.imgur.com/mRqWM3B.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_quinoa_black_bean_stuffed_peppers_info
          .tr(),
      gi: 35,
      gl: 11,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/corn.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_5_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_quinoa_black_bean_stuffed_peppers_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_1
            .tr(),
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_2
            .tr(),
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_3
            .tr(),
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_4
            .tr(),
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_5
            .tr(),
        LocaleKeys
            .recipes_vegan_quinoa_black_bean_stuffed_peppers_instructions_6
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 30,
        calories: 300,
        protein: 12,
        fiber: 10,
        totalFat: 6,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 41,
      title: LocaleKeys.recipes_baked_salmon_dill_lemon_title.tr(),
      imgUrl: 'https://i.imgur.com/tsvDL7W.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_baked_salmon_dill_lemon_info.tr(),
      gi: 5,
      gl: 0,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_2_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_3_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_baked_salmon_dill_lemon_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/capers.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_1.tr(),
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_2.tr(),
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_3.tr(),
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_4.tr(),
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_5.tr(),
        LocaleKeys.recipes_baked_salmon_dill_lemon_instructions_6.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 2,
        netCarbs: 2,
        calories: 350,
        protein: 30,
        fiber: 0,
        totalFat: 20,
        totalSugar: 1,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 42,
      title: LocaleKeys.recipes_spicy_lentil_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/XP3acUJ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_lentil_soup_info.tr(),
      gi: 30,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_1_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_1_unit.tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_2_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_3_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_4_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_4_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_5_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_5_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_6_name.tr(),
          amount: 400,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_6_unit.tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_7_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_7_unit.tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_8_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_8_unit.tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_9_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_lentil_soup_ingredients_9_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_lentil_soup_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_lentil_soup_instructions_1.tr(),
        LocaleKeys.recipes_spicy_lentil_soup_instructions_2.tr(),
        LocaleKeys.recipes_spicy_lentil_soup_instructions_3.tr(),
        LocaleKeys.recipes_spicy_lentil_soup_instructions_4.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 17,
        calories: 220,
        protein: 12,
        fiber: 8,
        totalFat: 5,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 43,
      title: LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_title.tr(),
      imgUrl: 'https://i.imgur.com/YuP5r0U.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_info.tr(),
      gi: 40,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_2_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_4_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_cod_lemon_herb_quinoa_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_instructions_1.tr(),
        LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_instructions_2.tr(),
        LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_instructions_3.tr(),
        LocaleKeys.recipes_grilled_cod_lemon_herb_quinoa_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 35,
        calories: 320,
        protein: 30,
        fiber: 5,
        totalFat: 12,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 44,
      title: LocaleKeys.recipes_roasted_veggie_buddha_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/VrOMwqH.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_veggie_buddha_bowl_info.tr(),
      gi: 50,
      gl: 25,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_4_name
              .tr(),
          amount: 70,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/tahini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_veggie_buddha_bowl_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_veggie_buddha_bowl_instructions_1.tr(),
        LocaleKeys.recipes_roasted_veggie_buddha_bowl_instructions_2.tr(),
        LocaleKeys.recipes_roasted_veggie_buddha_bowl_instructions_3.tr(),
        LocaleKeys.recipes_roasted_veggie_buddha_bowl_instructions_4.tr(),
        LocaleKeys.recipes_roasted_veggie_buddha_bowl_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 50,
        calories: 320,
        protein: 12,
        fiber: 10,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 45,
      title: LocaleKeys.recipes_crispy_baked_zucchini_fries_title.tr(),
      imgUrl: 'https://i.imgur.com/THSstRn.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_crispy_baked_zucchini_fries_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_2_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cornmeal.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_4_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_baked_zucchini_fries_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_crispy_baked_zucchini_fries_instructions_1.tr(),
        LocaleKeys.recipes_crispy_baked_zucchini_fries_instructions_2.tr(),
        LocaleKeys.recipes_crispy_baked_zucchini_fries_instructions_3.tr(),
        LocaleKeys.recipes_crispy_baked_zucchini_fries_instructions_4.tr(),
        LocaleKeys.recipes_crispy_baked_zucchini_fries_instructions_5.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 16,
        calories: 150,
        protein: 3,
        fiber: 4,
        totalFat: 4,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 46,
      title: LocaleKeys.recipes_thai_basil_chicken_title.tr(),
      imgUrl: 'https://i.imgur.com/3ywDedO.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_thai_basil_chicken_info.tr(),
      gi: 60,
      gl: 20,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_1_unit.tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_2_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_2_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_3_name.tr(),
          amount: 1,
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_4_name.tr(),
          amount: 10,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_4_unit.tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_5_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_5_unit.tr(),
          icon: 'assets/svg/sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_6_unit.tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_7_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_7_unit.tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_8_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_9_name.tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_thai_basil_chicken_ingredients_9_unit.tr(),
          icon: 'assets/svg/sugar.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_thai_basil_chicken_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_thai_basil_chicken_instructions_1.tr(),
        LocaleKeys.recipes_thai_basil_chicken_instructions_2.tr(),
        LocaleKeys.recipes_thai_basil_chicken_instructions_3.tr(),
        LocaleKeys.recipes_thai_basil_chicken_instructions_4.tr(),
        LocaleKeys.recipes_thai_basil_chicken_instructions_5.tr(),
        LocaleKeys.recipes_thai_basil_chicken_instructions_6.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 33,
        calories: 320,
        protein: 32,
        fiber: 2,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 47,
      title: LocaleKeys.recipes_vegan_sweet_potato_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/7ctWRCc.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_sweet_potato_soup_info.tr(),
      gi: 50,
      gl: 21,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_6_name
              .tr(),
          amount: 300,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/curry.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_sweet_potato_soup_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_sweet_potato_soup_instructions_1.tr(),
        LocaleKeys.recipes_vegan_sweet_potato_soup_instructions_2.tr(),
        LocaleKeys.recipes_vegan_sweet_potato_soup_instructions_3.tr(),
        LocaleKeys.recipes_vegan_sweet_potato_soup_instructions_4.tr(),
        LocaleKeys.recipes_vegan_sweet_potato_soup_instructions_5.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 42,
        calories: 350,
        protein: 6,
        fiber: 8,
        totalFat: 12,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 48,
      title: LocaleKeys.recipes_green_detox_smoothie_title.tr(),
      imgUrl: 'https://i.imgur.com/YVCsasd.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_green_detox_smoothie_info.tr(),
      gi: 25,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_1_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_1_unit.tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_2_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_2_unit.tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_3_unit.tr(),
          icon: 'assets/svg/green-apple.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_4_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_4_unit.tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_5_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_5_unit.tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_green_detox_smoothie_ingredients_6_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_green_detox_smoothie_ingredients_6_unit.tr(),
          icon: 'assets/svg/water.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_green_detox_smoothie_instructions_1.tr(),
        LocaleKeys.recipes_green_detox_smoothie_instructions_2.tr(),
        LocaleKeys.recipes_green_detox_smoothie_instructions_3.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 16,
        calories: 120,
        protein: 2,
        fiber: 4,
        totalFat: 0.5,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 49,
      title: LocaleKeys.recipes_baked_cauliflower_chickpea_curry_title.tr(),
      imgUrl: 'https://i.imgur.com/JYrwCyA.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_baked_cauliflower_chickpea_curry_info.tr(),
      gi: 35,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_7_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/curry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_baked_cauliflower_chickpea_curry_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_baked_cauliflower_chickpea_curry_instructions_1.tr(),
        LocaleKeys.recipes_baked_cauliflower_chickpea_curry_instructions_2.tr(),
        LocaleKeys.recipes_baked_cauliflower_chickpea_curry_instructions_3.tr(),
        LocaleKeys.recipes_baked_cauliflower_chickpea_curry_instructions_4.tr(),
        LocaleKeys.recipes_baked_cauliflower_chickpea_curry_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 320,
        protein: 10,
        fiber: 8,
        totalFat: 15,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 50,
      title: LocaleKeys.recipes_turkey_zucchini_skewers_title.tr(),
      imgUrl: 'https://i.imgur.com/4Z5LMjF.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turkey_zucchini_skewers_info.tr(),
      gi: 15,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turkey_zucchini_skewers_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turkey_zucchini_skewers_instructions_1.tr(),
        LocaleKeys.recipes_turkey_zucchini_skewers_instructions_2.tr(),
        LocaleKeys.recipes_turkey_zucchini_skewers_instructions_3.tr(),
        LocaleKeys.recipes_turkey_zucchini_skewers_instructions_4.tr(),
        LocaleKeys.recipes_turkey_zucchini_skewers_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 8,
        calories: 280,
        protein: 35,
        fiber: 2,
        totalFat: 9,
        totalSugar: 4,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 51,
      title: LocaleKeys.recipes_spicy_chickpea_stew_title.tr(),
      imgUrl: 'https://i.imgur.com/v7wt8SM.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_chickpea_stew_info.tr(),
      gi: 30,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_1_unit.tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_2_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_3_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_4_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_4_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_5_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_5_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_6_name.tr(),
          amount: 300,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_6_unit.tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_7_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_7_unit.tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_8_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_8_unit.tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_9_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_9_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_chickpea_stew_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_chickpea_stew_instructions_1.tr(),
        LocaleKeys.recipes_spicy_chickpea_stew_instructions_2.tr(),
        LocaleKeys.recipes_spicy_chickpea_stew_instructions_3.tr(),
        LocaleKeys.recipes_spicy_chickpea_stew_instructions_4.tr(),
        LocaleKeys.recipes_spicy_chickpea_stew_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 26,
        calories: 300,
        protein: 12,
        fiber: 9,
        totalFat: 8,
        totalSugar: 7,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 52,
      title: LocaleKeys.recipes_herbed_baked_cod_with_roasted_asparagus_title
          .tr(),
      imgUrl: 'https://i.imgur.com/K1L3qwi.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herbed_baked_cod_with_roasted_asparagus_info
          .tr(),
      gi: 10,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/asparagus.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_baked_cod_with_roasted_asparagus_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_1
            .tr(),
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_2
            .tr(),
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_3
            .tr(),
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_4
            .tr(),
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_5
            .tr(),
        LocaleKeys
            .recipes_herbed_baked_cod_with_roasted_asparagus_instructions_6
            .tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 320,
        protein: 30,
        fiber: 1,
        totalFat: 15,
        totalSugar: 1,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 53,
      title: LocaleKeys.recipes_vegan_berry_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/fQ890pF.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_berry_overnight_oats_info.tr(),
      gi: 45,
      gl: 15,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_berry_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_berry_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_vegan_berry_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_vegan_berry_overnight_oats_instructions_3.tr(),
        LocaleKeys.recipes_vegan_berry_overnight_oats_instructions_4.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 33,
        calories: 280,
        protein: 8,
        fiber: 7,
        totalFat: 6,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 54,
      title: LocaleKeys.recipes_mediterranean_stuffed_zucchini_title.tr(),
      imgUrl: 'https://i.imgur.com/iEAKZXJ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_stuffed_zucchini_info.tr(),
      gi: 30,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olives.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_stuffed_zucchini_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_1.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_2.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_3.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_4.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_5.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_6.tr(),
        LocaleKeys.recipes_mediterranean_stuffed_zucchini_instructions_7.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 280,
        protein: 8,
        fiber: 8,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 55,
      title: LocaleKeys.recipes_vegan_roasted_red_pepper_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/1I1egEe.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_roasted_red_pepper_soup_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_4_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_5_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_red_pepper_soup_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_1.tr(),
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_2.tr(),
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_3.tr(),
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_4.tr(),
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_5.tr(),
        LocaleKeys.recipes_vegan_roasted_red_pepper_soup_instructions_6.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 18,
        calories: 150,
        protein: 3,
        fiber: 7,
        totalFat: 5,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 56,
      title: LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_title.tr(),
      imgUrl: 'https://i.imgur.com/S2VZKjV.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_info.tr(),
      gi: 40,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_quinoa_salad_with_avocado_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_instructions_1
            .tr(),
        LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_instructions_2
            .tr(),
        LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_instructions_3
            .tr(),
        LocaleKeys.recipes_chicken_quinoa_salad_with_avocado_instructions_4
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 350,
        protein: 30,
        fiber: 5,
        totalFat: 14,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 57,
      title: LocaleKeys.recipes_moroccan_chickpea_tagine_title.tr(),
      imgUrl: 'https://i.imgur.com/YhoX4Ng.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_moroccan_chickpea_tagine_info.tr(),
      gi: 35,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/apricot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/coriander.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_chickpea_tagine_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_moroccan_chickpea_tagine_instructions_1.tr(),
        LocaleKeys.recipes_moroccan_chickpea_tagine_instructions_2.tr(),
        LocaleKeys.recipes_moroccan_chickpea_tagine_instructions_3.tr(),
        LocaleKeys.recipes_moroccan_chickpea_tagine_instructions_4.tr(),
        LocaleKeys.recipes_moroccan_chickpea_tagine_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 40,
        calories: 350,
        protein: 12,
        fiber: 10,
        totalFat: 10,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 58,
      title: LocaleKeys.recipes_spaghetti_squash_primavera_title.tr(),
      imgUrl: 'https://i.imgur.com/pEt67JX.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spaghetti_squash_primavera_info.tr(),
      gi: 40,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/squash.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spaghetti_squash_primavera_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spaghetti_squash_primavera_instructions_1.tr(),
        LocaleKeys.recipes_spaghetti_squash_primavera_instructions_2.tr(),
        LocaleKeys.recipes_spaghetti_squash_primavera_instructions_3.tr(),
        LocaleKeys.recipes_spaghetti_squash_primavera_instructions_4.tr(),
        LocaleKeys.recipes_spaghetti_squash_primavera_instructions_5.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 35,
        calories: 300,
        protein: 8,
        fiber: 10,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 59,
      title: LocaleKeys.recipes_avocado_berry_smoothie_title.tr(),
      imgUrl: 'https://i.imgur.com/VXm5BY2.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_avocado_berry_smoothie_info.tr(),
      gi: 30,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_1_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_3_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_avocado_berry_smoothie_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_avocado_berry_smoothie_instructions_1.tr(),
        LocaleKeys.recipes_avocado_berry_smoothie_instructions_2.tr(),
        LocaleKeys.recipes_avocado_berry_smoothie_instructions_3.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 250,
        protein: 6,
        fiber: 8,
        totalFat: 12,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 60,
      title: LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_title.tr(),
      imgUrl: 'https://i.imgur.com/vm4JqT1.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_veggie_skewers_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_instructions_1
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_instructions_2
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_instructions_3
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_instructions_4
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_veggie_skewers_instructions_5
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 150,
        protein: 3,
        fiber: 5,
        totalFat: 7,
        totalSugar: 4,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 61,
      title: LocaleKeys.recipes_beef_green_bean_stir_fry_title.tr(),
      imgUrl: 'https://i.imgur.com/rRsMNXS.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_beef_green_bean_stir_fry_info.tr(),
      gi: 30,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/beef.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/green-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_4_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_beef_green_bean_stir_fry_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_1.tr(),
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_2.tr(),
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_3.tr(),
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_4.tr(),
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_5.tr(),
        LocaleKeys.recipes_beef_green_bean_stir_fry_instructions_6.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 12,
        calories: 350,
        protein: 32,
        fiber: 3,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 62,
      title: LocaleKeys.recipes_vegan_avocado_lime_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/9DB3CWl.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_avocado_lime_salad_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_1_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_avocado_lime_salad_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_avocado_lime_salad_instructions_1.tr(),
        LocaleKeys.recipes_vegan_avocado_lime_salad_instructions_2.tr(),
        LocaleKeys.recipes_vegan_avocado_lime_salad_instructions_3.tr(),
        LocaleKeys.recipes_vegan_avocado_lime_salad_instructions_4.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 14,
        calories: 200,
        protein: 4,
        fiber: 6,
        totalFat: 10,
        totalSugar: 5,
      ),
      mealTypes: [
        MealsEnum.breakfast.value,
        MealsEnum.lunch.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 63,
      title: LocaleKeys.recipes_roasted_beet_citrus_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/by80g5O.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_beet_citrus_salad_info.tr(),
      gi: 35,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/beetroot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/orange.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_citrus_salad_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_beet_citrus_salad_instructions_1.tr(),
        LocaleKeys.recipes_roasted_beet_citrus_salad_instructions_2.tr(),
        LocaleKeys.recipes_roasted_beet_citrus_salad_instructions_3.tr(),
        LocaleKeys.recipes_roasted_beet_citrus_salad_instructions_4.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 18,
        calories: 220,
        protein: 4,
        fiber: 7,
        totalFat: 10,
        totalSugar: 12,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 64,
      title: LocaleKeys.recipes_turmeric_ginger_chicken_title.tr(),
      imgUrl: 'https://i.imgur.com/E25NLP4.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turmeric_ginger_chicken_info.tr(),
      gi: 10,
      gl: 0,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_2_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/turmeric.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_ginger_chicken_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turmeric_ginger_chicken_instructions_1.tr(),
        LocaleKeys.recipes_turmeric_ginger_chicken_instructions_2.tr(),
        LocaleKeys.recipes_turmeric_ginger_chicken_instructions_3.tr(),
        LocaleKeys.recipes_turmeric_ginger_chicken_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 300,
        protein: 35,
        fiber: 1,
        totalFat: 12,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 65,
      title: LocaleKeys.recipes_vegan_coconut_rice_pudding_title.tr(),
      imgUrl: 'https://i.imgur.com/Q9K1aMC.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_coconut_rice_pudding_info.tr(),
      gi: 50,
      gl: 25,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_1_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_coconut_rice_pudding_ingredients_6_name
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_coconut_rice_pudding_instructions_1.tr(),
        LocaleKeys.recipes_vegan_coconut_rice_pudding_instructions_2.tr(),
        LocaleKeys.recipes_vegan_coconut_rice_pudding_instructions_3.tr(),
        LocaleKeys.recipes_vegan_coconut_rice_pudding_instructions_4.tr(),
        LocaleKeys.recipes_vegan_coconut_rice_pudding_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 50,
        calories: 350,
        protein: 6,
        fiber: 5,
        totalFat: 10,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 66,
      title: LocaleKeys.recipes_vegan_grilled_portobello_burger_title.tr(),
      imgUrl: 'https://i.imgur.com/y94XGNa.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_grilled_portobello_burger_info.tr(),
      gi: 45,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/mushroom.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_2_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/bun.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lettuce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/balsamic-vinegar.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_grilled_portobello_burger_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_grilled_portobello_burger_instructions_1.tr(),
        LocaleKeys.recipes_vegan_grilled_portobello_burger_instructions_2.tr(),
        LocaleKeys.recipes_vegan_grilled_portobello_burger_instructions_3.tr(),
        LocaleKeys.recipes_vegan_grilled_portobello_burger_instructions_4.tr(),
        LocaleKeys.recipes_vegan_grilled_portobello_burger_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 29,
        calories: 350,
        protein: 8,
        fiber: 6,
        totalFat: 15,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 67,
      title: LocaleKeys.recipes_turmeric_cauliflower_curry_title.tr(),
      imgUrl: 'https://i.imgur.com/e8h1g6T.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turmeric_cauliflower_curry_info.tr(),
      gi: 45,
      gl: 21,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/turmeric.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_9_name
              .tr(),
          amount: 70,
          unit: LocaleKeys.recipes_turmeric_cauliflower_curry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_cauliflower_curry_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turmeric_cauliflower_curry_instructions_1.tr(),
        LocaleKeys.recipes_turmeric_cauliflower_curry_instructions_2.tr(),
        LocaleKeys.recipes_turmeric_cauliflower_curry_instructions_3.tr(),
        LocaleKeys.recipes_turmeric_cauliflower_curry_instructions_4.tr(),
        LocaleKeys.recipes_turmeric_cauliflower_curry_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 46,
        calories: 400,
        protein: 10,
        fiber: 9,
        totalFat: 12,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 68,
      title: LocaleKeys.recipes_chickpea_avocado_wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/MHO63lX.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chickpea_avocado_wrap_info.tr(),
      gi: 40,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_chickpea_avocado_wrap_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chickpea_avocado_wrap_instructions_1.tr(),
        LocaleKeys.recipes_chickpea_avocado_wrap_instructions_2.tr(),
        LocaleKeys.recipes_chickpea_avocado_wrap_instructions_3.tr(),
        LocaleKeys.recipes_chickpea_avocado_wrap_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 23,
        calories: 320,
        protein: 10,
        fiber: 7,
        totalFat: 14,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 69,
      title: LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/FZyNFr7.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_info.tr(),
      gi: 40,
      gl: 12,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_broccoli_sweet_potato_salad_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_instructions_1
            .tr(),
        LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_instructions_2
            .tr(),
        LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_instructions_3
            .tr(),
        LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_instructions_4
            .tr(),
        LocaleKeys.recipes_roasted_broccoli_sweet_potato_salad_instructions_5
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 30,
        calories: 300,
        protein: 7,
        fiber: 10,
        totalFat: 10,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 70,
      title: LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/0cJXlwL.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_info.tr(),
      gi: 15,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_shrimp_cauliflower_rice_bowl_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_instructions_1
            .tr(),
        LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_instructions_2
            .tr(),
        LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_instructions_3
            .tr(),
        LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_instructions_4
            .tr(),
        LocaleKeys.recipes_spicy_shrimp_cauliflower_rice_bowl_instructions_5
            .tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 10,
        netCarbs: 6,
        calories: 250,
        protein: 28,
        fiber: 4,
        totalFat: 8,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 71,
      title: LocaleKeys.recipes_spinach_chickpea_pasta_title.tr(),
      imgUrl: 'https://i.imgur.com/9B5Yvdb.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spinach_chickpea_pasta_info.tr(),
      gi: 45,
      gl: 23,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_1_name
              .tr(),
          amount: 75,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/pasta.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_4_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spinach_chickpea_pasta_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spinach_chickpea_pasta_instructions_1.tr(),
        LocaleKeys.recipes_spinach_chickpea_pasta_instructions_2.tr(),
        LocaleKeys.recipes_spinach_chickpea_pasta_instructions_3.tr(),
        LocaleKeys.recipes_spinach_chickpea_pasta_instructions_4.tr(),
        LocaleKeys.recipes_spinach_chickpea_pasta_instructions_5.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 50,
        calories: 400,
        protein: 15,
        fiber: 10,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 72,
      title: LocaleKeys.recipes_roasted_eggplant_tomato_stew_title.tr(),
      imgUrl: 'https://i.imgur.com/UXe0qvb.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_eggplant_tomato_stew_info.tr(),
      gi: 25,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_1_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_4_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_eggplant_tomato_stew_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_eggplant_tomato_stew_instructions_1.tr(),
        LocaleKeys.recipes_roasted_eggplant_tomato_stew_instructions_2.tr(),
        LocaleKeys.recipes_roasted_eggplant_tomato_stew_instructions_3.tr(),
        LocaleKeys.recipes_roasted_eggplant_tomato_stew_instructions_4.tr(),
        LocaleKeys.recipes_roasted_eggplant_tomato_stew_instructions_5.tr(),
      ],
      cookingTime: 45,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 320,
        protein: 6,
        fiber: 8,
        totalFat: 12,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 73,
      title: LocaleKeys.recipes_baked_tilapia_lemon_herbs_title.tr(),
      imgUrl: 'https://i.imgur.com/fytwNZx.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_baked_tilapia_lemon_herbs_info.tr(),
      gi: 5,
      gl: 0,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_3_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_4_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_7_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_baked_tilapia_lemon_herbs_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_baked_tilapia_lemon_herbs_instructions_1.tr(),
        LocaleKeys.recipes_baked_tilapia_lemon_herbs_instructions_2.tr(),
        LocaleKeys.recipes_baked_tilapia_lemon_herbs_instructions_3.tr(),
        LocaleKeys.recipes_baked_tilapia_lemon_herbs_instructions_4.tr(),
        LocaleKeys.recipes_baked_tilapia_lemon_herbs_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 340,
        protein: 32,
        fiber: 1,
        totalFat: 14,
        totalSugar: 1,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 74,
      title: LocaleKeys.recipes_vegan_chickpea_spinach_curry_title.tr(),
      imgUrl: 'https://i.imgur.com/q1z6oD7.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_chickpea_spinach_curry_info.tr(),
      gi: 35,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/curry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_9_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chickpea_spinach_curry_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_chickpea_spinach_curry_instructions_1.tr(),
        LocaleKeys.recipes_vegan_chickpea_spinach_curry_instructions_2.tr(),
        LocaleKeys.recipes_vegan_chickpea_spinach_curry_instructions_3.tr(),
        LocaleKeys.recipes_vegan_chickpea_spinach_curry_instructions_4.tr(),
        LocaleKeys.recipes_vegan_chickpea_spinach_curry_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 40,
        calories: 380,
        protein: 14,
        fiber: 10,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 75,
      title: LocaleKeys.recipes_spicy_tofu_wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/NUs8kSi.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_tofu_wrap_info.tr(),
      gi: 25,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_1_unit.tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_2_name.tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_3_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_3_unit.tr(),
          icon: 'assets/svg/red-cabbage.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_4_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_4_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_5_name.tr(),
          amount: 30,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_5_unit.tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_6_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_6_unit.tr(),
          icon: 'assets/svg/sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_7_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_7_unit.tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_tofu_wrap_ingredients_8_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_tofu_wrap_instructions_1.tr(),
        LocaleKeys.recipes_spicy_tofu_wrap_instructions_2.tr(),
        LocaleKeys.recipes_spicy_tofu_wrap_instructions_3.tr(),
        LocaleKeys.recipes_spicy_tofu_wrap_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 20,
        calories: 280,
        protein: 14,
        fiber: 5,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 76,
      title: LocaleKeys.recipes_low_carb_zucchini_lasagna_title.tr(),
      imgUrl: 'https://i.imgur.com/X3LuKHT.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_low_carb_zucchini_lasagna_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/yeast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_low_carb_zucchini_lasagna_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_1.tr(),
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_2.tr(),
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_3.tr(),
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_4.tr(),
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_5.tr(),
        LocaleKeys.recipes_low_carb_zucchini_lasagna_instructions_6.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 320,
        protein: 14,
        fiber: 8,
        totalFat: 10,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 77,
      title: LocaleKeys.recipes_roasted_beet_quinoa_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/kI9u7bc.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_beet_quinoa_salad_info.tr(),
      gi: 40,
      gl: 11,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/beetroot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/arugula.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/balsamic-vinegar.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_beet_quinoa_salad_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_beet_quinoa_salad_instructions_1.tr(),
        LocaleKeys.recipes_roasted_beet_quinoa_salad_instructions_2.tr(),
        LocaleKeys.recipes_roasted_beet_quinoa_salad_instructions_3.tr(),
        LocaleKeys.recipes_roasted_beet_quinoa_salad_instructions_4.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 300,
        protein: 8,
        fiber: 8,
        totalFat: 8,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 78,
      title: LocaleKeys.recipes_herbed_lentil_spinach_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/FSFh4a7.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herbed_lentil_spinach_soup_info.tr(),
      gi: 30,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_4_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_6_name
              .tr(),
          amount: 400,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/thyme.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_lentil_spinach_soup_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herbed_lentil_spinach_soup_instructions_1.tr(),
        LocaleKeys.recipes_herbed_lentil_spinach_soup_instructions_2.tr(),
        LocaleKeys.recipes_herbed_lentil_spinach_soup_instructions_3.tr(),
        LocaleKeys.recipes_herbed_lentil_spinach_soup_instructions_4.tr(),
        LocaleKeys.recipes_herbed_lentil_spinach_soup_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 28,
        calories: 350,
        protein: 15,
        fiber: 12,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 79,
      title: LocaleKeys.recipes_grilled_salmon_mango_salsa_title.tr(),
      imgUrl: 'https://i.imgur.com/Yxxumhf.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_salmon_mango_salsa_info.tr(),
      gi: 30,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/mango.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_3_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_4_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_6_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_salmon_mango_salsa_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_salmon_mango_salsa_instructions_1.tr(),
        LocaleKeys.recipes_grilled_salmon_mango_salsa_instructions_2.tr(),
        LocaleKeys.recipes_grilled_salmon_mango_salsa_instructions_3.tr(),
        LocaleKeys.recipes_grilled_salmon_mango_salsa_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 12,
        calories: 400,
        protein: 32,
        fiber: 3,
        totalFat: 20,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 80,
      title: LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_title
          .tr(),
      imgUrl: 'https://i.imgur.com/xDmZMGK.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_info.tr(),
      gi: 30,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chicken_broccoli_cauliflower_stir_fry_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_instructions_1
            .tr(),
        LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_instructions_2
            .tr(),
        LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_instructions_3
            .tr(),
        LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_instructions_4
            .tr(),
        LocaleKeys.recipes_chicken_broccoli_cauliflower_stir_fry_instructions_5
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 350,
        protein: 32,
        fiber: 5,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 81,
      title: LocaleKeys.recipes_kale_white_bean_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/05hgbL7.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_kale_white_bean_salad_info.tr(),
      gi: 30,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/kale.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/beans.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/tahini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_kale_white_bean_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_kale_white_bean_salad_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_kale_white_bean_salad_instructions_1.tr(),
        LocaleKeys.recipes_kale_white_bean_salad_instructions_2.tr(),
        LocaleKeys.recipes_kale_white_bean_salad_instructions_3.tr(),
        LocaleKeys.recipes_kale_white_bean_salad_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 250,
        protein: 10,
        fiber: 8,
        totalFat: 8,
        totalSugar: 4,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 82,
      title: LocaleKeys.recipes_grilled_veg_hummus_pita_title.tr(),
      imgUrl: 'https://i.imgur.com/37pYIqD.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_veg_hummus_pita_info.tr(),
      gi: 45,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/hummus.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_grilled_veg_hummus_pita_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_veg_hummus_pita_instructions_1.tr(),
        LocaleKeys.recipes_grilled_veg_hummus_pita_instructions_2.tr(),
        LocaleKeys.recipes_grilled_veg_hummus_pita_instructions_3.tr(),
        LocaleKeys.recipes_grilled_veg_hummus_pita_instructions_4.tr(),
        LocaleKeys.recipes_grilled_veg_hummus_pita_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 350,
        protein: 12,
        fiber: 8,
        totalFat: 10,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 83,
      title: LocaleKeys.recipes_spiced_lentil_carrot_stew_title.tr(),
      imgUrl: 'https://i.imgur.com/M2ITwsL.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spiced_lentil_carrot_stew_info.tr(),
      gi: 30,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_6_name
              .tr(),
          amount: 400,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/coriander.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_lentil_carrot_stew_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spiced_lentil_carrot_stew_instructions_1.tr(),
        LocaleKeys.recipes_spiced_lentil_carrot_stew_instructions_2.tr(),
        LocaleKeys.recipes_spiced_lentil_carrot_stew_instructions_3.tr(),
        LocaleKeys.recipes_spiced_lentil_carrot_stew_instructions_4.tr(),
        LocaleKeys.recipes_spiced_lentil_carrot_stew_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 33,
        calories: 350,
        protein: 15,
        fiber: 12,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 84,
      title: LocaleKeys.recipes_quinoa_stuffed_bell_peppers_with_spinach_title
          .tr(),
      imgUrl: 'https://i.imgur.com/bK07qVK.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_quinoa_stuffed_bell_peppers_with_spinach_info
          .tr(),
      gi: 35,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_4_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_quinoa_stuffed_bell_peppers_with_spinach_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_1
            .tr(),
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_2
            .tr(),
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_3
            .tr(),
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_4
            .tr(),
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_5
            .tr(),
        LocaleKeys
            .recipes_quinoa_stuffed_bell_peppers_with_spinach_instructions_6
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 36,
        calories: 320,
        protein: 10,
        fiber: 9,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 85,
      title: LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/Gy4P7dP.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_herb_grilled_shrimp_salad_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_1.tr(),
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_2.tr(),
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_3.tr(),
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_4.tr(),
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_5.tr(),
        LocaleKeys.recipes_lemon_herb_grilled_shrimp_salad_instructions_6.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 18,
        netCarbs: 14,
        calories: 320,
        protein: 28,
        fiber: 4,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 86,
      title: LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/sDYn6GS.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_info.tr(),
      gi: 50,
      gl: 24,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/squash.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_5_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/nutmeg.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_7_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_roasted_butternut_squash_soup_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_roasted_butternut_squash_soup_instructions_5
            .tr(),
      ],
      cookingTime: 50,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 47,
        calories: 400,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 87,
      title: LocaleKeys.recipes_quinoa_avocado_power_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/YVG4yvO.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_quinoa_avocado_power_bowl_info.tr(),
      gi: 35,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_1_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/corn.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_6_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_quinoa_avocado_power_bowl_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_quinoa_avocado_power_bowl_instructions_1.tr(),
        LocaleKeys.recipes_quinoa_avocado_power_bowl_instructions_2.tr(),
        LocaleKeys.recipes_quinoa_avocado_power_bowl_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 38,
        calories: 350,
        protein: 12,
        fiber: 12,
        totalFat: 12,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 88,
      title: LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_title.tr(),
      imgUrl: 'https://i.imgur.com/9EmvRTX.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_info.tr(),
      gi: 40,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/tortillas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cabbage.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cilantro_lime_grilled_chicken_tacos_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_instructions_1
            .tr(),
        LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_instructions_2
            .tr(),
        LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_instructions_3
            .tr(),
        LocaleKeys.recipes_cilantro_lime_grilled_chicken_tacos_instructions_4
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 24,
        calories: 300,
        protein: 28,
        fiber: 6,
        totalFat: 10,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 89,
      title: LocaleKeys.recipes_vegan_creamy_cashew_pasta_title.tr(),
      imgUrl: 'https://i.imgur.com/Lza9Y1W.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_creamy_cashew_pasta_info.tr(),
      gi: 50,
      gl: 24,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_1_name
              .tr(),
          amount: 75,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/pasta.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_2_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cashew.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/yeast.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_creamy_cashew_pasta_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_creamy_cashew_pasta_instructions_1.tr(),
        LocaleKeys.recipes_vegan_creamy_cashew_pasta_instructions_2.tr(),
        LocaleKeys.recipes_vegan_creamy_cashew_pasta_instructions_3.tr(),
        LocaleKeys.recipes_vegan_creamy_cashew_pasta_instructions_4.tr(),
        LocaleKeys.recipes_vegan_creamy_cashew_pasta_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 48,
        calories: 400,
        protein: 14,
        fiber: 7,
        totalFat: 15,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 90,
      title: LocaleKeys.recipes_herbed_turkey_meatloaf_title.tr(),
      imgUrl: 'https://i.imgur.com/hxZUBjY.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herbed_turkey_meatloaf_info.tr(),
      gi: 50,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/minced-meat.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_3_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/egg.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_7_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_herbed_turkey_meatloaf_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_1.tr(),
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_2.tr(),
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_3.tr(),
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_4.tr(),
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_5.tr(),
        LocaleKeys.recipes_herbed_turkey_meatloaf_instructions_6.tr(),
      ],
      cookingTime: 45,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 17,
        calories: 350,
        protein: 30,
        fiber: 3,
        totalFat: 12,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 91,
      title: LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_title.tr(),
      imgUrl: 'https://i.imgur.com/6OdA9Vw.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_info.tr(),
      gi: 45,
      gl: 17,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_4_unit
              .tr(),
          icon: 'assets/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_8_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_sweet_potato_black_bean_chili_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_sweet_potato_black_bean_chili_instructions_5
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 38,
        calories: 350,
        protein: 12,
        fiber: 12,
        totalFat: 10,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 92,
      title: LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_title.tr(),
      imgUrl: 'https://i.imgur.com/PVjWYZV.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_1_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_3_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_4_name
              .tr(),
          amount: 10,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/wine.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_9_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cauliflower_steak_chimichurri_ingredients_10_name
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_cauliflower_steak_chimichurri_instructions_4
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 12,
        calories: 300,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 93,
      title: LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_title.tr(),
      imgUrl: 'https://i.imgur.com/atDdTU0.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_info.tr(),
      gi: 35,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_quinoa_stuffed_eggplant_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_instructions_1.tr(),
        LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_instructions_2.tr(),
        LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_instructions_3.tr(),
        LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_instructions_4.tr(),
        LocaleKeys.recipes_spicy_quinoa_stuffed_eggplant_instructions_5.tr(),
      ],
      cookingTime: 40,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 36,
        calories: 320,
        protein: 10,
        fiber: 9,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 94,
      title: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_title.tr(),
      imgUrl: 'https://i.imgur.com/0WmcOFc.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_info.tr(),
      gi: 5,
      gl: 0,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_cajun_shrimp_skewers_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_cajun_shrimp_skewers_instructions_1.tr(),
        LocaleKeys.recipes_spicy_cajun_shrimp_skewers_instructions_2.tr(),
        LocaleKeys.recipes_spicy_cajun_shrimp_skewers_instructions_3.tr(),
        LocaleKeys.recipes_spicy_cajun_shrimp_skewers_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 300,
        protein: 32,
        fiber: 1,
        totalFat: 12,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 95,
      title: LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/wtG2pTr.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_4_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_zucchini_noodle_pasta_salad_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_zucchini_noodle_pasta_salad_instructions_4
            .tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 220,
        protein: 4,
        fiber: 5,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 96,
      title: LocaleKeys.recipes_roasted_pumpkin_soup_title.tr(),
      imgUrl: 'https://i.imgur.com/ooZFtgT.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_pumpkin_soup_info.tr(),
      gi: 40,
      gl: 17,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_1_name.tr(),
          amount: 300,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_1_unit.tr(),
          icon: 'assets/svg/pumpkin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_2_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_2_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_3_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_3_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_4_name.tr(),
          amount: 400,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_4_unit.tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_5_name.tr(),
          amount: 100,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_5_unit.tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_6_name.tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_6_unit.tr(),
          icon: 'assets/svg/nutmeg.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_7_name.tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_7_unit.tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_8_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_roasted_pumpkin_soup_ingredients_9_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_roasted_pumpkin_soup_instructions_1.tr(),
        LocaleKeys.recipes_roasted_pumpkin_soup_instructions_2.tr(),
        LocaleKeys.recipes_roasted_pumpkin_soup_instructions_3.tr(),
        LocaleKeys.recipes_roasted_pumpkin_soup_instructions_4.tr(),
      ],
      cookingTime: 45,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 42,
        calories: 350,
        protein: 6,
        fiber: 8,
        totalFat: 12,
        totalSugar: 14,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 97,
      title: LocaleKeys.recipes_grilled_lemon_basil_chicken_title.tr(),
      imgUrl: 'https://i.imgur.com/ib8UmFr.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_lemon_basil_chicken_info.tr(),
      gi: 15,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_3_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_6_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_grilled_lemon_basil_chicken_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/green-beans.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_lemon_basil_chicken_instructions_1.tr(),
        LocaleKeys.recipes_grilled_lemon_basil_chicken_instructions_2.tr(),
        LocaleKeys.recipes_grilled_lemon_basil_chicken_instructions_3.tr(),
        LocaleKeys.recipes_grilled_lemon_basil_chicken_instructions_4.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 5,
        netCarbs: 4,
        calories: 320,
        protein: 35,
        fiber: 1,
        totalFat: 14,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 98,
      title: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_title.tr(),
      imgUrl: 'https://i.imgur.com/9Ic1WcL.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_info.tr(),
      gi: 30,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/green-lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_9_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_lentil_veg_stir_fry_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_lentil_veg_stir_fry_instructions_1.tr(),
        LocaleKeys.recipes_vegan_lentil_veg_stir_fry_instructions_2.tr(),
        LocaleKeys.recipes_vegan_lentil_veg_stir_fry_instructions_3.tr(),
        LocaleKeys.recipes_vegan_lentil_veg_stir_fry_instructions_4.tr(),
        LocaleKeys.recipes_vegan_lentil_veg_stir_fry_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 30,
        calories: 350,
        protein: 15,
        fiber: 10,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 99,
      title: LocaleKeys.recipes_thai_basil_tofu_rice_noodles_title.tr(),
      imgUrl: 'https://i.imgur.com/9v1fm86.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_thai_basil_tofu_rice_noodles_info.tr(),
      gi: 40,
      gl: 15,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/noodle.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_10_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_10_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_thai_basil_tofu_rice_noodles_ingredients_11_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_thai_basil_tofu_rice_noodles_instructions_1.tr(),
        LocaleKeys.recipes_thai_basil_tofu_rice_noodles_instructions_2.tr(),
        LocaleKeys.recipes_thai_basil_tofu_rice_noodles_instructions_3.tr(),
        LocaleKeys.recipes_thai_basil_tofu_rice_noodles_instructions_4.tr(),
        LocaleKeys.recipes_thai_basil_tofu_rice_noodles_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 37,
        calories: 350,
        protein: 14,
        fiber: 8,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 100,
      title: LocaleKeys.recipes_pumpkin_black_bean_enchiladas_title.tr(),
      imgUrl: 'https://i.imgur.com/hXnbowZ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_pumpkin_black_bean_enchiladas_info.tr(),
      gi: 50,
      gl: 23,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/pumpkin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_3_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/tortillas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_4_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_9_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_black_bean_enchiladas_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_1.tr(),
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_2.tr(),
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_3.tr(),
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_4.tr(),
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_5.tr(),
        LocaleKeys.recipes_pumpkin_black_bean_enchiladas_instructions_6.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 45,
        calories: 400,
        protein: 12,
        fiber: 10,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 101,
      title: LocaleKeys.recipes_cucumber_avocado_gazpacho_title.tr(),
      imgUrl: 'https://i.imgur.com/IsZPBe4.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_cucumber_avocado_gazpacho_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_9_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/water.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_cucumber_avocado_gazpacho_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_cucumber_avocado_gazpacho_instructions_1.tr(),
        LocaleKeys.recipes_cucumber_avocado_gazpacho_instructions_2.tr(),
        LocaleKeys.recipes_cucumber_avocado_gazpacho_instructions_3.tr(),
        LocaleKeys.recipes_cucumber_avocado_gazpacho_instructions_4.tr(),
        LocaleKeys.recipes_cucumber_avocado_gazpacho_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 18,
        calories: 200,
        protein: 4,
        fiber: 7,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [
        MealsEnum.breakfast.value,
        MealsEnum.lunch.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 102,
      title: LocaleKeys.recipes_mediterranean_lentil_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/FwoMu7i.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_lentil_salad_info.tr(),
      gi: 25,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/black-olives.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_8_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mediterranean_lentil_salad_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_lentil_salad_instructions_1.tr(),
        LocaleKeys.recipes_mediterranean_lentil_salad_instructions_2.tr(),
        LocaleKeys.recipes_mediterranean_lentil_salad_instructions_3.tr(),
        LocaleKeys.recipes_mediterranean_lentil_salad_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 250,
        protein: 10,
        fiber: 8,
        totalFat: 8,
        totalSugar: 6,
      ),
      mealTypes: [
        MealsEnum.lunch.value,
        MealsEnum.dinner.value,
        MealsEnum.snack.value,
      ],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 103,
      title: LocaleKeys.recipes_vegan_baked_eggplant_parmesan_title.tr(),
      imgUrl: 'https://i.imgur.com/z6Q9sc4.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_baked_eggplant_parmesan_info.tr(),
      gi: 20,
      gl: 4,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_1_name
              .tr(),
          amount: 250,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_3_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/yeast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_baked_eggplant_parmesan_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_baked_eggplant_parmesan_instructions_1.tr(),
        LocaleKeys.recipes_vegan_baked_eggplant_parmesan_instructions_2.tr(),
        LocaleKeys.recipes_vegan_baked_eggplant_parmesan_instructions_3.tr(),
        LocaleKeys.recipes_vegan_baked_eggplant_parmesan_instructions_4.tr(),
        LocaleKeys.recipes_vegan_baked_eggplant_parmesan_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 22,
        calories: 300,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 104,
      title: LocaleKeys.recipes_grilled_shrimp_quinoa_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/TXgzZP9.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_shrimp_quinoa_salad_info.tr(),
      gi: 40,
      gl: 11,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_3_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/arugula.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_shrimp_quinoa_salad_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_grilled_shrimp_quinoa_salad_instructions_1.tr(),
        LocaleKeys.recipes_grilled_shrimp_quinoa_salad_instructions_2.tr(),
        LocaleKeys.recipes_grilled_shrimp_quinoa_salad_instructions_3.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 28,
        calories: 350,
        protein: 30,
        fiber: 7,
        totalFat: 12,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 105,
      title: LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_title.tr(),
      imgUrl: 'https://i.imgur.com/agnhDiZ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_info.tr(),
      gi: 55,
      gl: 29,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_2_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/baking-soda.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_banana_oat_pancakes_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_cinnamon_banana_oat_pancakes_instructions_5
            .tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 300,
        protein: 8,
        fiber: 8,
        totalFat: 8,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 106,
      title: LocaleKeys.recipes_mixed_berry_chia_jam_toast_title.tr(),
      imgUrl: 'https://i.imgur.com/5ypEVtu.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mixed_berry_chia_jam_toast_info.tr(),
      gi: 45,
      gl: 15,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_1_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_6_name
              .tr(),
          unit: LocaleKeys.recipes_mixed_berry_chia_jam_toast_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mixed_berry_chia_jam_toast_instructions_1.tr(),
        LocaleKeys.recipes_mixed_berry_chia_jam_toast_instructions_2.tr(),
        LocaleKeys.recipes_mixed_berry_chia_jam_toast_instructions_3.tr(),
        LocaleKeys.recipes_mixed_berry_chia_jam_toast_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 33,
        calories: 250,
        protein: 5,
        fiber: 7,
        totalFat: 4,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 107,
      title: LocaleKeys.recipes_vegan_date_oat_energy_balls_title.tr(),
      imgUrl: 'https://i.imgur.com/qq1dsYm.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_date_oat_energy_balls_info.tr(),
      gi: 50,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/dates.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_6_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_date_oat_energy_balls_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_date_oat_energy_balls_instructions_1.tr(),
        LocaleKeys.recipes_vegan_date_oat_energy_balls_instructions_2.tr(),
        LocaleKeys.recipes_vegan_date_oat_energy_balls_instructions_3.tr(),
        LocaleKeys.recipes_vegan_date_oat_energy_balls_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 300,
        protein: 6,
        fiber: 8,
        totalFat: 10,
        totalSugar: 40,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 108,
      title: LocaleKeys.recipes_blueberry_coconut_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/r99Idik.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_blueberry_coconut_overnight_oats_info.tr(),
      gi: 50,
      gl: 24,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/blueberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_4_name
              .tr(),
          amount: 10,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/coconut.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_8_name
              .tr(),
          unit: LocaleKeys
              .recipes_blueberry_coconut_overnight_oats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_blueberry_coconut_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_blueberry_coconut_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_blueberry_coconut_overnight_oats_instructions_3.tr(),
        LocaleKeys.recipes_blueberry_coconut_overnight_oats_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 47,
        calories: 300,
        protein: 7,
        fiber: 8,
        totalFat: 10,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 109,
      title: LocaleKeys.recipes_strawberry_banana_smoothie_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/w0cL0kd.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_strawberry_banana_smoothie_bowl_info.tr(),
      gi: 45,
      gl: 23,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/strawberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_2_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_4_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/kiwi.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/granola.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_strawberry_banana_smoothie_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_strawberry_banana_smoothie_bowl_instructions_1.tr(),
        LocaleKeys.recipes_strawberry_banana_smoothie_bowl_instructions_2.tr(),
        LocaleKeys.recipes_strawberry_banana_smoothie_bowl_instructions_3.tr(),
        LocaleKeys.recipes_strawberry_banana_smoothie_bowl_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 320,
        protein: 7,
        fiber: 8,
        totalFat: 8,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 110,
      title: LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_title.tr(),
      imgUrl: 'https://i.imgur.com/1kQFvGG.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_info.tr(),
      gi: 50,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_8_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_apple_cinnamon_granola_bars_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_5
            .tr(),
        LocaleKeys.recipes_vegan_apple_cinnamon_granola_bars_instructions_6
            .tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 300,
        protein: 7,
        fiber: 8,
        totalFat: 10,
        totalSugar: 25,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 111,
      title: LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_title.tr(),
      imgUrl: 'https://i.imgur.com/Cr2hDAH.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_info.tr(),
      gi: 55,
      gl: 28,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_2_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/flour.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_4_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_6_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/blueberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/baking-soda.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_8_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_9_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_maple_blueberry_oat_muffins_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_1
            .tr(),
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_2
            .tr(),
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_3
            .tr(),
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_4
            .tr(),
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_5
            .tr(),
        LocaleKeys.recipes_vegan_maple_blueberry_oat_muffins_instructions_6
            .tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 50,
        calories: 350,
        protein: 8,
        fiber: 10,
        totalFat: 10,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 112,
      title: LocaleKeys
          .recipes_vegan_chocolate_chia_pudding_with_raspberries_title
          .tr(),
      imgUrl: 'https://i.imgur.com/OD44SYC.jpeg',
      servings: 1,
      info: LocaleKeys
          .recipes_vegan_chocolate_chia_pudding_with_raspberries_info
          .tr(),
      gi: 40,
      gl: 11,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_1_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cocoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/raspberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_chocolate_chia_pudding_with_raspberries_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_vegan_chocolate_chia_pudding_with_raspberries_instructions_1
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_chia_pudding_with_raspberries_instructions_2
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_chia_pudding_with_raspberries_instructions_3
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_chia_pudding_with_raspberries_instructions_4
            .tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 27,
        calories: 250,
        protein: 7,
        fiber: 8,
        totalFat: 8,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 113,
      title: LocaleKeys.recipes_vegan_chocolate_peanut_butter_energy_balls_title
          .tr(),
      imgUrl: 'https://i.imgur.com/qct2CVY.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_chocolate_peanut_butter_energy_balls_info
          .tr(),
      gi: 50,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_1_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/dates.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_2_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cocoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_6_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_chocolate_peanut_butter_energy_balls_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_vegan_chocolate_peanut_butter_energy_balls_instructions_1
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_peanut_butter_energy_balls_instructions_2
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_peanut_butter_energy_balls_instructions_3
            .tr(),
        LocaleKeys
            .recipes_vegan_chocolate_peanut_butter_energy_balls_instructions_4
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 300,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 35,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 114,
      title: LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_title.tr(),
      imgUrl: 'https://i.imgur.com/dWWrczl.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_info.tr(),
      gi: 55,
      gl: 30,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_1_name
              .tr(),
          amount: 60,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_2_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/baking-powder.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_cinnamon_apple_oat_bars_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_instructions_1.tr(),
        LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_instructions_2.tr(),
        LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_instructions_3.tr(),
        LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_instructions_4.tr(),
        LocaleKeys.recipes_vegan_cinnamon_apple_oat_bars_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 65,
        netCarbs: 55,
        calories: 350,
        protein: 8,
        fiber: 10,
        totalFat: 6,
        totalSugar: 22,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 115,
      title: LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_title
          .tr(),
      imgUrl: 'https://i.imgur.com/CyMhJhd.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_info.tr(),
      gi: 50,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cocoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_chocolate_almond_butter_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_instructions_1
            .tr(),
        LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_instructions_2
            .tr(),
        LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_instructions_3
            .tr(),
        LocaleKeys.recipes_chocolate_almond_butter_overnight_oats_instructions_4
            .tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 320,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 116,
      title: LocaleKeys.recipes_strawberry_kiwi_chia_pudding_title.tr(),
      imgUrl: 'https://i.imgur.com/Y9BGHg3.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_strawberry_kiwi_chia_pudding_info.tr(),
      gi: 35,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_1_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/strawberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/kiwi.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_strawberry_kiwi_chia_pudding_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_strawberry_kiwi_chia_pudding_instructions_1.tr(),
        LocaleKeys.recipes_strawberry_kiwi_chia_pudding_instructions_2.tr(),
        LocaleKeys.recipes_strawberry_kiwi_chia_pudding_instructions_3.tr(),
        LocaleKeys.recipes_strawberry_kiwi_chia_pudding_instructions_4.tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 23,
        calories: 220,
        protein: 5,
        fiber: 7,
        totalFat: 8,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 118,
      title: LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_title.tr(),
      imgUrl: 'https://i.imgur.com/ZPe0T5z.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_info.tr(),
      gi: 55,
      gl: 18,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_3_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/mushroom.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_oatmeal_spinach_mushrooms_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_instructions_1.tr(),
        LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_instructions_2.tr(),
        LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_instructions_3.tr(),
        LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_instructions_4.tr(),
        LocaleKeys.recipes_savory_oatmeal_spinach_mushrooms_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 350,
        protein: 10,
        fiber: 8,
        totalFat: 8,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 119,
      title: LocaleKeys.recipes_pumpkin_spice_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/S6urqF0.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_pumpkin_spice_overnight_oats_info.tr(),
      gi: 55,
      gl: 28,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/pumpkin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/nutmeg.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_8_name
              .tr(),
          unit: LocaleKeys
              .recipes_pumpkin_spice_overnight_oats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_pumpkin_spice_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_pumpkin_spice_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_pumpkin_spice_overnight_oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 50,
        calories: 350,
        protein: 8,
        fiber: 10,
        totalFat: 10,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 120,
      title: LocaleKeys.recipes_vegan_avocado_toast_microgreens_title.tr(),
      imgUrl: 'https://i.imgur.com/gXAdMvk.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_avocado_toast_microgreens_info.tr(),
      gi: 50,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_1_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_avocado_toast_microgreens_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_avocado_toast_microgreens_instructions_1.tr(),
        LocaleKeys.recipes_vegan_avocado_toast_microgreens_instructions_2.tr(),
        LocaleKeys.recipes_vegan_avocado_toast_microgreens_instructions_3.tr(),
        LocaleKeys.recipes_vegan_avocado_toast_microgreens_instructions_4.tr(),
        LocaleKeys.recipes_vegan_avocado_toast_microgreens_instructions_5.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 300,
        protein: 6,
        fiber: 5,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 121,
      title: LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/lmMjJUc.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_info.tr(),
      gi: 50,
      gl: 25,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_2_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/raisins.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_7_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/nutmeg.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_8_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_10_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_carrot_cake_overnight_oats_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_instructions_3.tr(),
        LocaleKeys.recipes_vegan_carrot_cake_overnight_oats_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 50,
        calories: 350,
        protein: 8,
        fiber: 10,
        totalFat: 10,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 122,
      title: LocaleKeys.recipes_blueberry_banana_protein_smoothie_title.tr(),
      imgUrl: 'https://i.imgur.com/cTshQpD.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_blueberry_banana_protein_smoothie_info.tr(),
      gi: 45,
      gl: 15,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/blueberry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_3_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/protein-powder.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_4_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_blueberry_banana_protein_smoothie_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_blueberry_banana_protein_smoothie_instructions_1
            .tr(),
        LocaleKeys.recipes_blueberry_banana_protein_smoothie_instructions_2
            .tr(),
        LocaleKeys.recipes_blueberry_banana_protein_smoothie_instructions_3
            .tr(),
      ],
      cookingTime: 5,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 34,
        calories: 320,
        protein: 20,
        fiber: 6,
        totalFat: 8,
        totalSugar: 15,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 123,
      title: LocaleKeys.recipes_cinnamon_pear_granola_parfait_title.tr(),
      imgUrl: 'https://i.imgur.com/MR06zeV.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_cinnamon_pear_granola_parfait_info.tr(),
      gi: 40,
      gl: 17,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_1_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/granola.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_2_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/pear.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/yogurt.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_cinnamon_pear_granola_parfait_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_cinnamon_pear_granola_parfait_instructions_1.tr(),
        LocaleKeys.recipes_cinnamon_pear_granola_parfait_instructions_2.tr(),
        LocaleKeys.recipes_cinnamon_pear_granola_parfait_instructions_3.tr(),
        LocaleKeys.recipes_cinnamon_pear_granola_parfait_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 42,
        calories: 350,
        protein: 8,
        fiber: 8,
        totalFat: 10,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 124,
      title: LocaleKeys.recipes_vegan_berry_almond_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/Z9MEV76.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_berry_almond_oats_info.tr(),
      gi: 55,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/berries.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_8_name
              .tr(),
          unit: LocaleKeys.recipes_vegan_berry_almond_oats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_berry_almond_oats_instructions_1.tr(),
        LocaleKeys.recipes_vegan_berry_almond_oats_instructions_2.tr(),
        LocaleKeys.recipes_vegan_berry_almond_oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 47,
        calories: 350,
        protein: 10,
        fiber: 8,
        totalFat: 12,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 125,
      title: LocaleKeys.recipes_mediterranean_chickpea_wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/v0B8463.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_chickpea_wrap_info.tr(),
      gi: 30,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_chickpea_wrap_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_chickpea_wrap_instructions_1.tr(),
        LocaleKeys.recipes_mediterranean_chickpea_wrap_instructions_2.tr(),
        LocaleKeys.recipes_mediterranean_chickpea_wrap_instructions_3.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 300,
        protein: 12,
        fiber: 8,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 126,
      title: LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_title.tr(),
      imgUrl: 'https://i.imgur.com/9BcTOUQ.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_info.tr(),
      gi: 40,
      gl: 7,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herbed_lemon_garlic_salmon_quinoa_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_instructions_1
            .tr(),
        LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_instructions_2
            .tr(),
        LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_instructions_3
            .tr(),
        LocaleKeys.recipes_herbed_lemon_garlic_salmon_quinoa_instructions_4
            .tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 17,
        calories: 400,
        protein: 35,
        fiber: 3,
        totalFat: 15,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 127,
      title: LocaleKeys.recipes_spicy_roasted_chickpeas_title.tr(),
      imgUrl: 'https://i.imgur.com/jKjoiqF.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_roasted_chickpeas_info.tr(),
      gi: 30,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/paprika.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spicy_roasted_chickpeas_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_roasted_chickpeas_instructions_1.tr(),
        LocaleKeys.recipes_spicy_roasted_chickpeas_instructions_2.tr(),
        LocaleKeys.recipes_spicy_roasted_chickpeas_instructions_3.tr(),
        LocaleKeys.recipes_spicy_roasted_chickpeas_instructions_4.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 180,
        protein: 8,
        fiber: 5,
        totalFat: 5,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 128,
      title: LocaleKeys.recipes_egg_white_spinach_avocado_toast_title.tr(),
      imgUrl: 'https://i.imgur.com/25IHSxw.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_egg_white_spinach_avocado_toast_info.tr(),
      gi: 40,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_1_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_2_name
              .tr(),
          amount: 3,
          icon: 'assets/svg/egg.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_3_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_egg_white_spinach_avocado_toast_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_egg_white_spinach_avocado_toast_instructions_1.tr(),
        LocaleKeys.recipes_egg_white_spinach_avocado_toast_instructions_2.tr(),
        LocaleKeys.recipes_egg_white_spinach_avocado_toast_instructions_3.tr(),
        LocaleKeys.recipes_egg_white_spinach_avocado_toast_instructions_4.tr(),
        LocaleKeys.recipes_egg_white_spinach_avocado_toast_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 300,
        protein: 20,
        fiber: 5,
        totalFat: 10,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 129,
      title: LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_title.tr(),
      imgUrl: 'https://i.imgur.com/bVzt4Jw.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_info.tr(),
      gi: 45,
      gl: 9,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_1_name
              .tr(),
          amount: 2,
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/minced-meat.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_4_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turkey_quinoa_stuffed_zucchini_boats_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_1
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_2
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_3
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_4
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_5
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_6
            .tr(),
        LocaleKeys.recipes_turkey_quinoa_stuffed_zucchini_boats_instructions_7
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 19,
        calories: 350,
        protein: 30,
        fiber: 6,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 130,
      title: LocaleKeys.recipes_vegan_coconut_mango_smoothie_title.tr(),
      imgUrl: 'https://i.imgur.com/pUX2Eay.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_coconut_mango_smoothie_info.tr(),
      gi: 50,
      gl: 18,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/mango.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_2_name
              .tr(),
          amount: 200,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lime-juice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_4_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/ice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_vegan_coconut_mango_smoothie_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/mint.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_coconut_mango_smoothie_instructions_1.tr(),
        LocaleKeys.recipes_vegan_coconut_mango_smoothie_instructions_2.tr(),
        LocaleKeys.recipes_vegan_coconut_mango_smoothie_instructions_3.tr(),
        LocaleKeys.recipes_vegan_coconut_mango_smoothie_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 35,
        calories: 300,
        protein: 4,
        fiber: 5,
        totalFat: 10,
        totalSugar: 30,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 131,
      title: LocaleKeys.recipes_vegan_chia_apple_porridge_title.tr(),
      imgUrl: 'https://i.imgur.com/oOvYlfy.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_chia_apple_porridge_info.tr(),
      gi: 50,
      gl: 23,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_2_name
              .tr(),
          amount: 15,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_3_name
              .tr(),
          amount: 70,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_4_name
              .tr(),
          amount: 200,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_5_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_7_name
              .tr(),
          unit: LocaleKeys.recipes_vegan_chia_apple_porridge_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_chia_apple_porridge_instructions_1.tr(),
        LocaleKeys.recipes_vegan_chia_apple_porridge_instructions_2.tr(),
        LocaleKeys.recipes_vegan_chia_apple_porridge_instructions_3.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 46,
        calories: 330,
        protein: 8,
        fiber: 9,
        totalFat: 9,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 132,
      title: LocaleKeys.recipes_mediterranean_grilled_chicken_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/1T5v4BA.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_grilled_chicken_salad_info.tr(),
      gi: 20,
      gl: 3,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olives.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_6_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_9_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_grilled_chicken_salad_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_mediterranean_grilled_chicken_salad_instructions_1
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_chicken_salad_instructions_2
            .tr(),
        LocaleKeys.recipes_mediterranean_grilled_chicken_salad_instructions_3
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 15,
        calories: 320,
        protein: 30,
        fiber: 5,
        totalFat: 10,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 133,
      title: LocaleKeys.recipes_vegan_matcha_pancakes_title.tr(),
      imgUrl: 'https://i.imgur.com/nxXyMy4.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_matcha_pancakes_info.tr(),
      gi: 55,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/flour.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_2_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/matcha.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/baking-soda.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_5_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_7_name
              .tr(),
          unit: LocaleKeys.recipes_vegan_matcha_pancakes_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_matcha_pancakes_instructions_1.tr(),
        LocaleKeys.recipes_vegan_matcha_pancakes_instructions_2.tr(),
        LocaleKeys.recipes_vegan_matcha_pancakes_instructions_3.tr(),
        LocaleKeys.recipes_vegan_matcha_pancakes_instructions_4.tr(),
        LocaleKeys.recipes_vegan_matcha_pancakes_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 48,
        calories: 320,
        protein: 8,
        fiber: 7,
        totalFat: 8,
        totalSugar: 10,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 134,
      title: LocaleKeys.recipes_avocado_chickpea_salad_sandwich_title.tr(),
      imgUrl: 'https://i.imgur.com/EXkkCer.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_avocado_chickpea_salad_sandwich_info.tr(),
      gi: 30,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_1_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bread.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_3_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/celery.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_5_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_chickpea_salad_sandwich_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_avocado_chickpea_salad_sandwich_instructions_1.tr(),
        LocaleKeys.recipes_avocado_chickpea_salad_sandwich_instructions_2.tr(),
        LocaleKeys.recipes_avocado_chickpea_salad_sandwich_instructions_3.tr(),
        LocaleKeys.recipes_avocado_chickpea_salad_sandwich_instructions_4.tr(),
        LocaleKeys.recipes_avocado_chickpea_salad_sandwich_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 350,
        protein: 12,
        fiber: 8,
        totalFat: 14,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.lunch.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 135,
      title: LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_title.tr(),
      imgUrl: 'https://i.imgur.com/yEulJBc.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_2_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_3_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_6_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_7_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_8_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_crusted_salmon_roasted_veggies_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_1
            .tr(),
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_2
            .tr(),
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_3
            .tr(),
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_4
            .tr(),
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_5
            .tr(),
        LocaleKeys.recipes_herb_crusted_salmon_roasted_veggies_instructions_6
            .tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 12,
        calories: 400,
        protein: 35,
        fiber: 3,
        totalFat: 15,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 136,
      title: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_title.tr(),
      imgUrl: 'https://i.imgur.com/c3LKchW.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_info.tr(),
      gi: 55,
      gl: 30,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_1_name
              .tr(),
          amount: 60,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/pumpkin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_3_name
              .tr(),
          amount: 15,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_4_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/baking-soda.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_8_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/nutmeg.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_9_name
              .tr(),
          unit: LocaleKeys.recipes_vegan_chia_pumpkin_muffins_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_1.tr(),
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_2.tr(),
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_3.tr(),
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_4.tr(),
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_5.tr(),
        LocaleKeys.recipes_vegan_chia_pumpkin_muffins_instructions_6.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 65,
        netCarbs: 55,
        calories: 350,
        protein: 8,
        fiber: 10,
        totalFat: 10,
        totalSugar: 22,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 137,
      title: LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/AvK5UBk.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_info.tr(),
      gi: 60,
      gl: 23,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_6_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/chili-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_9_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_thai_chicken_rice_bowl_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_instructions_1.tr(),
        LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_instructions_2.tr(),
        LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_instructions_3.tr(),
        LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_instructions_4.tr(),
        LocaleKeys.recipes_spicy_thai_chicken_rice_bowl_instructions_5.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 39,
        calories: 400,
        protein: 30,
        fiber: 6,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 138,
      title: LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_title.tr(),
      imgUrl: 'https://i.imgur.com/gGO0s2v.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_info.tr(),
      gi: 45,
      gl: 14,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/green-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_4_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/rosemary.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/thyme.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_herb_roasted_cod_sweet_potato_mash_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_instructions_1
            .tr(),
        LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_instructions_2
            .tr(),
        LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_instructions_3
            .tr(),
        LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_instructions_4
            .tr(),
        LocaleKeys.recipes_herb_roasted_cod_sweet_potato_mash_instructions_5
            .tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 32,
        calories: 380,
        protein: 32,
        fiber: 8,
        totalFat: 12,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 139,
      title: LocaleKeys.recipes_matcha_coconut_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/dpDUqU6.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_matcha_coconut_overnight_oats_info.tr(),
      gi: 50,
      gl: 24,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/matcha.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_matcha_coconut_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_matcha_coconut_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_matcha_coconut_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_matcha_coconut_overnight_oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 47,
        calories: 340,
        protein: 8,
        fiber: 8,
        totalFat: 10,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 140,
      title: LocaleKeys.recipes_roasted_red_pepper_chickpea_buddha_bowl_title
          .tr(),
      imgUrl: 'https://i.imgur.com/62tO457.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_roasted_red_pepper_chickpea_buddha_bowl_info
          .tr(),
      gi: 40,
      gl: 16,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/arugula.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/tahini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_roasted_red_pepper_chickpea_buddha_bowl_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_roasted_red_pepper_chickpea_buddha_bowl_instructions_1
            .tr(),
        LocaleKeys
            .recipes_roasted_red_pepper_chickpea_buddha_bowl_instructions_2
            .tr(),
        LocaleKeys
            .recipes_roasted_red_pepper_chickpea_buddha_bowl_instructions_3
            .tr(),
        LocaleKeys
            .recipes_roasted_red_pepper_chickpea_buddha_bowl_instructions_4
            .tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 40,
        calories: 380,
        protein: 15,
        fiber: 10,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 141,
      title: LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_title.tr(),
      imgUrl: 'https://i.imgur.com/okB7RZI.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_info.tr(),
      gi: 20,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/shrimp.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_7_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/basil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_shrimp_zoodles_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_instructions_1.tr(),
        LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_instructions_2.tr(),
        LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_instructions_3.tr(),
        LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_instructions_4.tr(),
        LocaleKeys.recipes_lemon_garlic_shrimp_zoodles_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 15,
        netCarbs: 12,
        calories: 320,
        protein: 30,
        fiber: 3,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 142,
      title: LocaleKeys.recipes_turmeric_ginger_tofu_scramble_title.tr(),
      imgUrl: 'https://i.imgur.com/HXXcoym.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_turmeric_ginger_tofu_scramble_info.tr(),
      gi: 25,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/tofu.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_2_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/turmeric.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_6_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_turmeric_ginger_tofu_scramble_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_turmeric_ginger_tofu_scramble_instructions_1.tr(),
        LocaleKeys.recipes_turmeric_ginger_tofu_scramble_instructions_2.tr(),
        LocaleKeys.recipes_turmeric_ginger_tofu_scramble_instructions_3.tr(),
        LocaleKeys.recipes_turmeric_ginger_tofu_scramble_instructions_4.tr(),
        LocaleKeys.recipes_turmeric_ginger_tofu_scramble_instructions_5.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 19,
        calories: 300,
        protein: 20,
        fiber: 6,
        totalFat: 12,
        totalSugar: 5,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 143,
      title: LocaleKeys
          .recipes_mediterranean_roasted_vegetable_millet_salad_title
          .tr(),
      imgUrl: 'https://i.imgur.com/XT52vnv.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_roasted_vegetable_millet_salad_info
          .tr(),
      gi: 40,
      gl: 16,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_1_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/wheat.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_6_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_9_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_vegetable_millet_salad_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_mediterranean_roasted_vegetable_millet_salad_instructions_1
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_vegetable_millet_salad_instructions_2
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_vegetable_millet_salad_instructions_3
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_vegetable_millet_salad_instructions_4
            .tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 40,
        calories: 350,
        protein: 10,
        fiber: 10,
        totalFat: 12,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 144,
      title: LocaleKeys.recipes_grilled_lemon_dill_mackerel_with_wild_rice_title
          .tr(),
      imgUrl: 'https://i.imgur.com/lOiP21j.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_grilled_lemon_dill_mackerel_with_wild_rice_info
          .tr(),
      gi: 45,
      gl: 11,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/green-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_5_name
              .tr(),
          amount: 5,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/dill.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_grilled_lemon_dill_mackerel_with_wild_rice_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_grilled_lemon_dill_mackerel_with_wild_rice_instructions_1
            .tr(),
        LocaleKeys
            .recipes_grilled_lemon_dill_mackerel_with_wild_rice_instructions_2
            .tr(),
        LocaleKeys
            .recipes_grilled_lemon_dill_mackerel_with_wild_rice_instructions_3
            .tr(),
        LocaleKeys
            .recipes_grilled_lemon_dill_mackerel_with_wild_rice_instructions_4
            .tr(),
        LocaleKeys
            .recipes_grilled_lemon_dill_mackerel_with_wild_rice_instructions_5
            .tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 25,
        calories: 400,
        protein: 35,
        fiber: 5,
        totalFat: 15,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 145,
      title: LocaleKeys.recipes_Peach_Ginger_Overnight_Oats_title.tr(),
      imgUrl: 'https://i.imgur.com/I3tE2pq.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Peach_Ginger_Overnight_Oats_info.tr(),
      gi: 55,
      gl: 28,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_3_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Peach_Ginger_Overnight_Oats_ingredients_8_name
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Peach_Ginger_Overnight_Oats_instructions_1.tr(),
        LocaleKeys.recipes_Peach_Ginger_Overnight_Oats_instructions_2.tr(),
        LocaleKeys.recipes_Peach_Ginger_Overnight_Oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 51,
        calories: 340,
        protein: 7,
        fiber: 9,
        totalFat: 8,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 146,
      title: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/P51QKQs.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_info.tr(),
      gi: 30,
      gl: 13,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_2_name
              .tr(),
          amount: 10,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/parsley.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_3_name
              .tr(),
          amount: 5,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/coriander.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_8_name
              .tr(),
          amount: 10,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/flour.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_10_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_11_name
              .tr(),
          amount: 30,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_11_unit
              .tr(),
          icon: 'assets/svg/vegetable.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_12_name
              .tr(),
          amount: 2,
          unit: LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_ingredients_12_unit
              .tr(),
          icon: 'assets/svg/tahini.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_instructions_1.tr(),
        LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_instructions_2.tr(),
        LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_instructions_3.tr(),
        LocaleKeys.recipes_Vegan_Falafel_Pita_Wrap_instructions_4.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 42,
        calories: 380,
        protein: 14,
        fiber: 8,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 147,
      title: LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_title.tr(),
      imgUrl: 'https://i.imgur.com/rtkAPdt.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_info.tr(),
      gi: 35,
      gl: 16,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/lentils.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_5_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/curry.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_9_name
              .tr(),
          amount: 300,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/broth.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_10_name
              .tr(),
          amount: 70,
          unit: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_10_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Red_Lentil_Curry_with_Spinach_ingredients_11_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_instructions_1.tr(),
        LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_instructions_2.tr(),
        LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_instructions_3.tr(),
        LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_instructions_4.tr(),
        LocaleKeys.recipes_Red_Lentil_Curry_with_Spinach_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 55,
        netCarbs: 45,
        calories: 380,
        protein: 14,
        fiber: 10,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 148,
      title: LocaleKeys.recipes_chia_pomegranate_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/WdJ6Gp9.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_chia_pomegranate_overnight_oats_info.tr(),
      gi: 50,
      gl: 26,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_3_name
              .tr(),
          amount: 10,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_4_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/pomegranate.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_7_name
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_8_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_chia_pomegranate_overnight_oats_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/pomegranate.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_chia_pomegranate_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_chia_pomegranate_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_chia_pomegranate_overnight_oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 320,
        protein: 8,
        fiber: 8,
        totalFat: 8,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 149,
      title: LocaleKeys.recipes_asian_quinoa_salad_title.tr(),
      imgUrl: 'https://i.imgur.com/1DQQEFo.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_asian_quinoa_salad_info.tr(),
      gi: 50,
      gl: 19,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_1_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_1_unit.tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_2_name.tr(),
          amount: 80,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_2_unit.tr(),
          icon: 'assets/svg/edamame.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_3_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_3_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_4_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_4_unit.tr(),
          icon: 'assets/svg/red-cabbage.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_5_name.tr(),
          amount: 40,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_5_unit.tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_6_name.tr(),
          amount: 20,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_6_unit.tr(),
          icon: 'assets/svg/spring-onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_7_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_7_unit.tr(),
          icon: 'assets/svg/sesame.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_8_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_8_unit.tr(),
          icon: 'assets/svg/vinegar.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_9_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_9_unit.tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_10_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_asian_quinoa_salad_ingredients_11_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_asian_quinoa_salad_ingredients_11_unit.tr(),
          icon: 'assets/svg/sesame.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_asian_quinoa_salad_instructions_1.tr(),
        LocaleKeys.recipes_asian_quinoa_salad_instructions_2.tr(),
        LocaleKeys.recipes_asian_quinoa_salad_instructions_3.tr(),
        LocaleKeys.recipes_asian_quinoa_salad_instructions_4.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 37,
        calories: 350,
        protein: 14,
        fiber: 8,
        totalFat: 12,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 150,
      title: LocaleKeys.recipes_moroccan_lamb_stew_title.tr(),
      imgUrl: 'https://i.imgur.com/teRHmr8.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_moroccan_lamb_stew_info.tr(),
      gi: 40,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_1_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_1_unit.tr(),
          icon: 'assets/svg/beef.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_2_name.tr(),
          amount: 150,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_2_unit.tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_3_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_3_unit.tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_4_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_4_unit.tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_5_name.tr(),
          amount: 2,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_5_unit.tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_6_name.tr(),
          amount: 50,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_6_unit.tr(),
          icon: 'assets/svg/eggplant.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_7_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_7_unit.tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_8_name.tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_8_unit.tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_9_name.tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_9_unit.tr(),
          icon: 'assets/svg/paprika.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_10_name.tr(),
          amount: 1,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_10_unit.tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_11_name.tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_12_name.tr(),
          amount: 5,
          unit: LocaleKeys.recipes_moroccan_lamb_stew_ingredients_12_unit.tr(),
          icon: 'assets/svg/cilantro.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_moroccan_lamb_stew_instructions_1.tr(),
        LocaleKeys.recipes_moroccan_lamb_stew_instructions_2.tr(),
        LocaleKeys.recipes_moroccan_lamb_stew_instructions_3.tr(),
        LocaleKeys.recipes_moroccan_lamb_stew_instructions_4.tr(),
        LocaleKeys.recipes_moroccan_lamb_stew_instructions_5.tr(),
      ],
      cookingTime: 45,
      nutrition: Nutrition(
        carbs: 30,
        netCarbs: 24,
        calories: 450,
        protein: 30,
        fiber: 6,
        totalFat: 20,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
      ],
    ),
    Recipe(
      id: 151,
      title: LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/JzdvEB4.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_info.tr(),
      gi: 45,
      gl: 17,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/mango.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_2_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/coconut-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_4_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/granola.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Tropical_Avocado_Mango_Smoothie_Bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_instructions_1
            .tr(),
        LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_instructions_2
            .tr(),
        LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_instructions_3
            .tr(),
        LocaleKeys.recipes_Tropical_Avocado_Mango_Smoothie_Bowl_instructions_4
            .tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 38,
        calories: 350,
        protein: 8,
        fiber: 7,
        totalFat: 12,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 152,
      title: LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_title.tr(),
      imgUrl: 'https://i.imgur.com/eSXOm5I.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_info.tr(),
      gi: 40,
      gl: 16,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/carrot.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/zucchini.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_4_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_5_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_6_name
              .tr(),
          amount: 2,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_7_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_8_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_9_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/paprika.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_10_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_10_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_11_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_12_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_Moroccan_Spiced_Vegetable_Tagine_ingredients_12_unit
              .tr(),
          icon: 'assets/svg/quinoa.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_instructions_1.tr(),
        LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_instructions_2.tr(),
        LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_instructions_3.tr(),
        LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_instructions_4.tr(),
        LocaleKeys.recipes_Moroccan_Spiced_Vegetable_Tagine_instructions_5.tr(),
      ],
      cookingTime: 35,
      nutrition: Nutrition(
        carbs: 50,
        netCarbs: 40,
        calories: 400,
        protein: 10,
        fiber: 10,
        totalFat: 12,
        totalSugar: 12,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
    Recipe(
      id: 153,
      title: LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_title.tr(),
      imgUrl: 'https://i.imgur.com/3Bgp47M.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_info.tr(),
      gi: 45,
      gl: 17,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_2_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/sweet-potato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_3_name
              .tr(),
          amount: 80,
          unit: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/black-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_4_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_5_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_6_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/spinach.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_Sweet_Potato_Black_Bean_Quesadilla_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_instructions_1
            .tr(),
        LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_instructions_2
            .tr(),
        LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_instructions_3
            .tr(),
        LocaleKeys.recipes_Sweet_Potato_Black_Bean_Quesadilla_instructions_4
            .tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 37,
        calories: 350,
        protein: 12,
        fiber: 8,
        totalFat: 10,
        totalSugar: 8,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 154,
      title: LocaleKeys.recipes_avocado_cacao_smoothie_bowl_title.tr(),
      imgUrl: 'https://i.imgur.com/KbB8zAN.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_avocado_cacao_smoothie_bowl_info.tr(),
      gi: 45,
      gl: 24,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_1_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/avocado.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_2_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_3_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cocoa.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_7_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_avocado_cacao_smoothie_bowl_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/strawberry.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_avocado_cacao_smoothie_bowl_instructions_1.tr(),
        LocaleKeys.recipes_avocado_cacao_smoothie_bowl_instructions_2.tr(),
        LocaleKeys.recipes_avocado_cacao_smoothie_bowl_instructions_3.tr(),
        LocaleKeys.recipes_avocado_cacao_smoothie_bowl_instructions_4.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 320,
        protein: 8,
        fiber: 8,
        totalFat: 10,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.breakfast.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 155,
      title: LocaleKeys
          .recipes_mediterranean_roasted_red_pepper_feta_salad_title
          .tr(),
      imgUrl: 'https://i.imgur.com/K8OfkPn.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_mediterranean_roasted_red_pepper_feta_salad_info
          .tr(),
      gi: 30,
      gl: 6,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cherry-tomato.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_4_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/onion.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/feta.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_6_name
              .tr(),
          amount: 20,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olives.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_9_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_9_unit
              .tr(),
          icon: 'assets/svg/oregano.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_mediterranean_roasted_red_pepper_feta_salad_ingredients_10_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys
            .recipes_mediterranean_roasted_red_pepper_feta_salad_instructions_1
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_red_pepper_feta_salad_instructions_2
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_red_pepper_feta_salad_instructions_3
            .tr(),
        LocaleKeys
            .recipes_mediterranean_roasted_red_pepper_feta_salad_instructions_4
            .tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 20,
        calories: 300,
        protein: 10,
        fiber: 5,
        totalFat: 12,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 156,
      title: LocaleKeys.recipes_ginger_soy_glazed_salmon_title.tr(),
      imgUrl: 'https://i.imgur.com/k7aKL8g.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_ginger_soy_glazed_salmon_info.tr(),
      gi: 50,
      gl: 15,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/salmon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_2_name
              .tr(),
          amount: 80,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/rice.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/broccoli.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/ginger.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/soy-sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_8_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_8_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_ginger_soy_glazed_salmon_ingredients_9_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_ginger_soy_glazed_salmon_instructions_1.tr(),
        LocaleKeys.recipes_ginger_soy_glazed_salmon_instructions_2.tr(),
        LocaleKeys.recipes_ginger_soy_glazed_salmon_instructions_3.tr(),
        LocaleKeys.recipes_ginger_soy_glazed_salmon_instructions_4.tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 35,
        netCarbs: 30,
        calories: 400,
        protein: 32,
        fiber: 5,
        totalFat: 14,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withFish.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 157,
      title: LocaleKeys.recipes_vegan_maple_pecan_overnight_oats_title.tr(),
      imgUrl: 'https://i.imgur.com/qU72kbR.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_vegan_maple_pecan_overnight_oats_info.tr(),
      gi: 55,
      gl: 29,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/almond-milk.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_4_name
              .tr(),
          amount: 15,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/walnut.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/chia.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_6_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/vanilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_7_name
              .tr(),
          unit: LocaleKeys
              .recipes_vegan_maple_pecan_overnight_oats_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/salt.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_vegan_maple_pecan_overnight_oats_instructions_1.tr(),
        LocaleKeys.recipes_vegan_maple_pecan_overnight_oats_instructions_2.tr(),
        LocaleKeys.recipes_vegan_maple_pecan_overnight_oats_instructions_3.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 60,
        netCarbs: 52,
        calories: 350,
        protein: 8,
        fiber: 8,
        totalFat: 12,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.breakfast.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 158,
      title: LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_title.tr(),
      imgUrl: 'https://i.imgur.com/vliTvwq.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_info.tr(),
      gi: 30,
      gl: 10,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_1_name
              .tr(),
          amount: 1,
          icon: 'assets/svg/tortilla.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_2_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/hummus.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_3_name
              .tr(),
          amount: 50,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_4_name
              .tr(),
          amount: 40,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cucumber.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_5_name
              .tr(),
          amount: 30,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/lettuce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/sauce.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_7_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_7_unit
              .tr(),
          icon: 'assets/svg/lime.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_spicy_mediterranean_hummus_wrap_ingredients_8_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_instructions_1.tr(),
        LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_instructions_2.tr(),
        LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_instructions_3.tr(),
        LocaleKeys.recipes_spicy_mediterranean_hummus_wrap_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 40,
        netCarbs: 33,
        calories: 320,
        protein: 10,
        fiber: 7,
        totalFat: 10,
        totalSugar: 6,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 159,
      title: LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_title
          .tr(),
      imgUrl: 'https://i.imgur.com/EWEZ2TA.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_info.tr(),
      gi: 15,
      gl: 2,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chicken-breast.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_2_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cauliflower.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_3_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/green-beans.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_4_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/lemon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_6_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_6_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_lemon_garlic_chicken_cauliflower_rice_ingredients_7_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_instructions_1
            .tr(),
        LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_instructions_2
            .tr(),
        LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_instructions_3
            .tr(),
        LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_instructions_4
            .tr(),
        LocaleKeys.recipes_lemon_garlic_chicken_cauliflower_rice_instructions_5
            .tr(),
      ],
      cookingTime: 25,
      nutrition: Nutrition(
        carbs: 20,
        netCarbs: 16,
        calories: 400,
        protein: 35,
        fiber: 4,
        totalFat: 12,
        totalSugar: 4,
      ),
      mealTypes: [MealsEnum.lunch.value, MealsEnum.dinner.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.withMeat.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 160,
      title: LocaleKeys.recipes_crispy_roasted_kale_chips_title.tr(),
      imgUrl: 'https://i.imgur.com/Mf35x5W.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_crispy_roasted_kale_chips_info.tr(),
      gi: 15,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_1_name
              .tr(),
          amount: 50,
          unit: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/kale.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_3_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_crispy_roasted_kale_chips_ingredients_4_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_crispy_roasted_kale_chips_instructions_1.tr(),
        LocaleKeys.recipes_crispy_roasted_kale_chips_instructions_2.tr(),
        LocaleKeys.recipes_crispy_roasted_kale_chips_instructions_3.tr(),
        LocaleKeys.recipes_crispy_roasted_kale_chips_instructions_4.tr(),
        LocaleKeys.recipes_crispy_roasted_kale_chips_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 7,
        netCarbs: 5,
        calories: 120,
        protein: 4,
        fiber: 2,
        totalFat: 5,
        totalSugar: 1,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 161,
      title: LocaleKeys.recipes_banana_oat_energy_bites_title.tr(),
      imgUrl: 'https://i.imgur.com/dgK0Jnl.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_banana_oat_energy_bites_info.tr(),
      gi: 55,
      gl: 21,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_1_name
              .tr(),
          amount: 0.5,
          icon: 'assets/svg/banana.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_2_name
              .tr(),
          amount: 40,
          unit: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/oats.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/peanut-butter.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_4_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_5_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/maple-syrup.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_banana_oat_energy_bites_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_banana_oat_energy_bites_instructions_1.tr(),
        LocaleKeys.recipes_banana_oat_energy_bites_instructions_2.tr(),
        LocaleKeys.recipes_banana_oat_energy_bites_instructions_3.tr(),
        LocaleKeys.recipes_banana_oat_energy_bites_instructions_4.tr(),
      ],
      cookingTime: 15,
      nutrition: Nutrition(
        carbs: 45,
        netCarbs: 39,
        calories: 250,
        protein: 6,
        fiber: 6,
        totalFat: 10,
        totalSugar: 20,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 162,
      title: LocaleKeys.recipes_spiced_roasted_chickpeas_title.tr(),
      imgUrl: 'https://i.imgur.com/WoQAp4o.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_spiced_roasted_chickpeas_info.tr(),
      gi: 30,
      gl: 5,
      ingredients: [
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/chickpeas.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/cumin.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_4_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_5_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_5_unit
              .tr(),
          icon: 'assets/svg/bell-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys.recipes_spiced_roasted_chickpeas_ingredients_6_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_spiced_roasted_chickpeas_instructions_1.tr(),
        LocaleKeys.recipes_spiced_roasted_chickpeas_instructions_2.tr(),
        LocaleKeys.recipes_spiced_roasted_chickpeas_instructions_3.tr(),
        LocaleKeys.recipes_spiced_roasted_chickpeas_instructions_4.tr(),
        LocaleKeys.recipes_spiced_roasted_chickpeas_instructions_5.tr(),
      ],
      cookingTime: 30,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 17,
        calories: 200,
        protein: 10,
        fiber: 8,
        totalFat: 5,
        totalSugar: 3,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 163,
      title: LocaleKeys.recipes_crispy_cinnamon_apple_chips_title.tr(),
      imgUrl: 'https://i.imgur.com/KEBbF38.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_crispy_cinnamon_apple_chips_info.tr(),
      gi: 38,
      gl: 8,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_1_name
              .tr(),
          amount: 150,
          unit: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/apple.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_2_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/cinnamon.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_3_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/lemon-juice.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_crispy_cinnamon_apple_chips_ingredients_4_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_crispy_cinnamon_apple_chips_instructions_1.tr(),
        LocaleKeys.recipes_crispy_cinnamon_apple_chips_instructions_2.tr(),
        LocaleKeys.recipes_crispy_cinnamon_apple_chips_instructions_3.tr(),
        LocaleKeys.recipes_crispy_cinnamon_apple_chips_instructions_4.tr(),
        LocaleKeys.recipes_crispy_cinnamon_apple_chips_instructions_5.tr(),
      ],
      cookingTime: 120,
      nutrition: Nutrition(
        carbs: 25,
        netCarbs: 20,
        calories: 100,
        protein: 1,
        fiber: 5,
        totalFat: 1,
        totalSugar: 18,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 164,
      title: LocaleKeys.recipes_savory_spicy_roasted_edamame_title.tr(),
      imgUrl: 'https://i.imgur.com/ZkJRaDn.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_savory_spicy_roasted_edamame_info.tr(),
      gi: 15,
      gl: 1,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_1_name
              .tr(),
          amount: 100,
          unit: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_1_unit
              .tr(),
          icon: 'assets/svg/edamame.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_2_name
              .tr(),
          amount: 1,
          unit: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/olive-oil.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/chilli-pepper.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_4_name
              .tr(),
          amount: 0.25,
          unit: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_4_unit
              .tr(),
          icon: 'assets/svg/garlic.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_savory_spicy_roasted_edamame_ingredients_5_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_savory_spicy_roasted_edamame_instructions_1.tr(),
        LocaleKeys.recipes_savory_spicy_roasted_edamame_instructions_2.tr(),
        LocaleKeys.recipes_savory_spicy_roasted_edamame_instructions_3.tr(),
        LocaleKeys.recipes_savory_spicy_roasted_edamame_instructions_4.tr(),
        LocaleKeys.recipes_savory_spicy_roasted_edamame_instructions_5.tr(),
      ],
      cookingTime: 20,
      nutrition: Nutrition(
        carbs: 9,
        netCarbs: 4,
        calories: 120,
        protein: 11,
        fiber: 5,
        totalFat: 5,
        totalSugar: 2,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
      ],
    ),
    Recipe(
      id: 165,
      title: LocaleKeys.recipes_homemade_roasted_seaweed_crisps_title.tr(),
      imgUrl: 'https://i.imgur.com/HrF9Wvp.jpeg',
      servings: 1,
      info: LocaleKeys.recipes_homemade_roasted_seaweed_crisps_info.tr(),
      gi: 5,
      gl: 0,
      ingredients: [
        Ingredient(
          name: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_1_name
              .tr(),
          amount: 3,
          icon: 'assets/svg/nori.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_2_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_2_unit
              .tr(),
          icon: 'assets/svg/sesame.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_3_name
              .tr(),
          amount: 0.5,
          unit: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_3_unit
              .tr(),
          icon: 'assets/svg/vinegar.svg',
        ),
        Ingredient(
          name: LocaleKeys
              .recipes_homemade_roasted_seaweed_crisps_ingredients_4_name
              .tr(),
          icon: 'assets/svg/seasoning.svg',
        ),
      ],
      instructions: [
        LocaleKeys.recipes_homemade_roasted_seaweed_crisps_instructions_1.tr(),
        LocaleKeys.recipes_homemade_roasted_seaweed_crisps_instructions_2.tr(),
        LocaleKeys.recipes_homemade_roasted_seaweed_crisps_instructions_3.tr(),
        LocaleKeys.recipes_homemade_roasted_seaweed_crisps_instructions_4.tr(),
        LocaleKeys.recipes_homemade_roasted_seaweed_crisps_instructions_5.tr(),
      ],
      cookingTime: 10,
      nutrition: Nutrition(
        carbs: 3,
        netCarbs: 2,
        calories: 30,
        protein: 2,
        fiber: 1,
        totalFat: 1,
        totalSugar: 0,
      ),
      mealTypes: [MealsEnum.snack.value],
      dietLabels: [
        DietsEnum.glutenFree.value,
        DietsEnum.eggFree.value,
        DietsEnum.dairyFree.value,
        DietsEnum.nutFree.value,
        DietsEnum.vegan.value,
        DietsEnum.vegantarian.value,
        DietsEnum.lowFat.value,
        DietsEnum.lowSugar.value,
        DietsEnum.express.value,
        DietsEnum.freezer.value,
      ],
    ),
  ];
}
