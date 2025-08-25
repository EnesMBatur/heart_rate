enum RecipeTabBarEnum { ingredients, instructions, info }

extension RecipeTabBarEnumExtension on RecipeTabBarEnum {
  int get value {
    switch (this) {
      case RecipeTabBarEnum.ingredients:
        return 1;
      case RecipeTabBarEnum.instructions:
        return 2;
      case RecipeTabBarEnum.info:
        return 0;
    }
  }
}
