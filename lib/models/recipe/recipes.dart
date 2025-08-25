import 'package:heart_rate/models/recipe/ingredient.dart';
import 'package:heart_rate/models/recipe/nutrition.dart';
import 'package:hive_ce/hive.dart';

part 'recipes.g.dart';

@HiveType(typeId: 0)
class Recipe {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(10)
  final String imgUrl;
  @HiveField(2)
  final int servings;
  @HiveField(3)
  final String info;
  @HiveField(11)
  final double gi;
  @HiveField(12)
  final double gl;
  @HiveField(4)
  final List<Ingredient> ingredients;
  @HiveField(5)
  final List<String> instructions;
  @HiveField(6)
  final int cookingTime;
  @HiveField(7)
  final Nutrition nutrition;
  @HiveField(8)
  final List<int>? mealTypes;
  @HiveField(9)
  final List<int>? dietLabels;

  Recipe({
    required this.id,
    required this.title,
    required this.imgUrl,
    required this.servings,
    required this.info,
    required this.gi,
    required this.gl,
    required this.ingredients,
    required this.instructions,
    required this.cookingTime,
    required this.nutrition,
    this.mealTypes,
    this.dietLabels,
  });
}
