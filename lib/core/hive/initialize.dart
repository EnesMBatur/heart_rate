import 'package:heart_rate/models/recipe/ingredient.dart';
import 'package:heart_rate/models/recipe/nutrition.dart';
import 'package:heart_rate/models/recipe/recipes.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';

Future<void> hiveInitialize() async {
  await Hive.initFlutter();
  Hive
    ..registerAdapter(RecipeAdapter())
    ..registerAdapter(IngredientAdapter())
    ..registerAdapter(NutritionAdapter());

  //await Hive.deleteFromDisk();
  await Hive.openBox('themeMode');
  await Hive.openBox<bool>('onboarding');
}
