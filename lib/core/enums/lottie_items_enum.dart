enum LottieItemsEnum {
  themeChange,
  like,
  loadingImage,
  loading,
  done,
  subscribe,
  swipeRightArrow,
  premium
}

extension LottieItemsEnumExtension on LottieItemsEnum {
  String _path() {
    switch (this) {
      case LottieItemsEnum.themeChange:
        return 'themeChange';
      case LottieItemsEnum.like:
        return 'like';
      case LottieItemsEnum.loadingImage:
        return 'loadingImage';
      case LottieItemsEnum.loading:
        return 'loading';
      case LottieItemsEnum.done:
        return 'done';
      case LottieItemsEnum.subscribe:
        return 'subscribe';
      case LottieItemsEnum.swipeRightArrow:
        return 'swipeRightArrow';
      case LottieItemsEnum.premium:
        return 'premium';
    }
  }

  String get lottiePath => 'assets/json/${_path()}.json';
}
