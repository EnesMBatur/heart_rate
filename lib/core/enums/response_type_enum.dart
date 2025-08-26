enum ResponseTypeEnum { user, assistant, system }

extension ResponseTypeEnumExtension on ResponseTypeEnum {
  int get value {
    switch (this) {
      case ResponseTypeEnum.user:
        return 0;
      case ResponseTypeEnum.assistant:
        return 1;
      case ResponseTypeEnum.system:
        return 1;
    }
  }
}
