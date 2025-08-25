enum SvgGeneralEnum {
  clock,
  menu,
  search,
  favFood,
  favRecipe,
  shoppingList,
  notFound,
  plate,
  calories,
  fats,
  fiber,
  glycemicindex,
  protein,
  explore,
  customfood,
  blood,
  weight,
  lock,
  gem,
  carbs,
}

extension SvgGeneralEnumExtension on SvgGeneralEnum {
  String _path() {
    switch (this) {
      case SvgGeneralEnum.clock:
        return 'clock';
      case SvgGeneralEnum.menu:
        return 'menu';
      case SvgGeneralEnum.search:
        return 'search';
      case SvgGeneralEnum.favFood:
        return 'favFood';
      case SvgGeneralEnum.favRecipe:
        return 'favRecipe';
      case SvgGeneralEnum.shoppingList:
        return 'shoppingList';
      case SvgGeneralEnum.notFound:
        return 'notFound';
      case SvgGeneralEnum.plate:
        return 'plate';
      case SvgGeneralEnum.calories:
        return 'calories';
      case SvgGeneralEnum.fats:
        return 'fats';
      case SvgGeneralEnum.fiber:
        return 'fiber';
      case SvgGeneralEnum.glycemicindex:
        return 'glycemicindex';
      case SvgGeneralEnum.protein:
        return 'protein';
      case SvgGeneralEnum.explore:
        return 'explore';
      case SvgGeneralEnum.customfood:
        return 'customfood';
      case SvgGeneralEnum.blood:
        return 'blood';
      case SvgGeneralEnum.weight:
        return 'weight';
      case SvgGeneralEnum.lock:
        return 'lock';
      case SvgGeneralEnum.gem:
        return 'gem';
      case SvgGeneralEnum.carbs:
        return 'carbs';
    }
  }

  String get svgPath => 'assets/svg/general/${_path()}.svg';
}
