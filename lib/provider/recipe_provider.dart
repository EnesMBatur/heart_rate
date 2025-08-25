import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/enums/diets_enum.dart';
import 'package:heart_rate/core/enums/meals_enum.dart';
import 'package:heart_rate/data/recipes_data.dart';
import 'package:heart_rate/models/recipe/recipes.dart';

class RecipeNotifier extends ChangeNotifier {
  int trimester = 0;
  int tab = 0;
  int serving = 1;
  List<int> diets = [];
  List<int> moments = [];
  List<Map<String, String>> filters = [];
  List<String> aiTags = [];

  static List<Recipe> getData() {
    return RecipeData().values;
  }

  void setTrimester(int selectedTrimester) {
    trimester = selectedTrimester;
    notifyListeners();
  }

  void setSelectedTab(int selectedTab) {
    tab = selectedTab;
    notifyListeners();
  }

  void setServing(int servings) {
    serving = servings;
    notifyListeners();
  }

  void addServing() {
    serving++;
    notifyListeners();
  }

  void minusServing() {
    if (serving == 1) return;
    serving--;
    notifyListeners();
  }

  void clearFilter() {
    filters = [];
    notifyListeners();
  }

  void clearTags() {
    aiTags = [];
    notifyListeners();
  }

  double getPiece(Recipe recipeData, double ingredientsPiece) {
    final unitValue = ingredientsPiece / recipeData.servings;
    return unitValue * serving;
  }

  List<Recipe> getList(int pageKey, int pageSize) {
    final momentFilter = <Recipe>[];
    final dietFilter = <Recipe>[];
    var last = <Recipe>[];

    momentFilter.clear();
    dietFilter.clear();
    last.clear();

    for (final recipe in RecipeData().values) {
      final recipeDietsList = recipe.dietLabels;

      for (final moment in moments) {
        if (recipe.mealTypes!.contains(moment)) {
          if (!momentFilter.any((e) => e.id == recipe.id)) {
            momentFilter.add(recipe);
          }
        }
      }

      if (diets.length > 1) {
        final recipeDietsSet = recipeDietsList!.toSet();
        final dietSet = diets.toSet();
        final results = recipeDietsSet.containsAll(dietSet);
        if (results) {
          dietFilter.add(recipe);
        }
      } else {
        for (final diet in diets) {
          if (recipe.dietLabels!.contains(diet)) {
            if (!dietFilter.any((e) => e.id == recipe.id)) {
              dietFilter.add(recipe);
            }
          }
        }
      }
    }
    if (moments.isNotEmpty && diets.isEmpty) {
      last = momentFilter;
    } else if (diets.isNotEmpty && moments.isEmpty) {
      last = dietFilter;
    }

    if (moments.isNotEmpty && diets.isNotEmpty) {
      final momentFilterSet = momentFilter.toSet();
      final dietFilterSet = dietFilter.toSet();
      final results = momentFilterSet.intersection(dietFilterSet).toList();
      last = results;
    }

    if (filters.isEmpty) {
      last = RecipeData().values;
    }

    return last.skip((pageKey - 1) * pageSize).take(pageSize).toList();
  }

  void filterDivision() {
    moments.clear();
    diets.clear();
    for (final filter in filters) {
      if (MealsEnum.values.any(
        (element) => element.name == filter.values.first,
      )) {
        final momentValue = MealsEnum.values.firstWhere(
          (element) => element.name == filter.values.first,
        );

        moments.add(momentValue.index);
      } else if (DietsEnum.values.any(
        (element) => element.name == filter.values.first,
      )) {
        final dietValue = DietsEnum.values.firstWhere(
          (element) => element.name == filter.values.first,
        );

        diets.add(dietValue.index);
      }
    }
    notifyListeners();
  }
}

final recipeProvider = ChangeNotifierProvider<RecipeNotifier>((ref) {
  return RecipeNotifier();
});
