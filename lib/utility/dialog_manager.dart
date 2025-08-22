// ignore_for_file: use_build_context_synchronously

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

mixin DialogManager {
  void chatDialog(BuildContext buildContext, String basePath) {
    final textStyleMedium = Theme.of(
      buildContext,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);
    final textStyleSmall = Theme.of(buildContext).textTheme.titleSmall!;

    showAdaptiveDialog<String>(
      context: buildContext,
      builder: (BuildContext context) => AlertDialog.adaptive(
        //backgroundColor: Colors.black,
        title: Text(LocaleKeys.aiChat_sure.tr(), style: textStyleMedium),
        content: Text(LocaleKeys.aiChat_chatDelete.tr(), style: textStyleSmall),
        actions: <Widget>[
          adaptiveAction(
            context: context,
            onPressed: () => Navigator.pop(context),
            child: Text(LocaleKeys.aiChat_cancel.tr(), style: textStyleMedium),
          ),
          adaptiveAction(
            context: context,
            onPressed: () async {
              await ChatCrud(basePath).deleteChatData();
              Navigator.pop(context);
            },
            child: Text(
              LocaleKeys.aiChat_delete.tr(),
              style: textStyleMedium.copyWith(color: Colors.red.shade400),
            ),
          ),
        ],
      ),
    );
  }

  void deleteDataDialog(BuildContext buildContext, String basePath) {
    final textStyleMedium = Theme.of(
      buildContext,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);
    final textStyleSmall = Theme.of(buildContext).textTheme.titleSmall!;

    showAdaptiveDialog<String>(
      context: buildContext,
      builder: (BuildContext context) => AlertDialog.adaptive(
        backgroundColor: Colors.black,
        title: Text(
          LocaleKeys.profileitems_delete_title.tr(),
          style: textStyleMedium,
        ),
        content: Text(
          LocaleKeys.profileitems_delete_content.tr(),
          style: textStyleSmall,
        ),
        actions: <Widget>[
          adaptiveAction(
            context: context,
            onPressed: () => context.pop(),
            child: Text(
              LocaleKeys.profileitems_cancel.tr(),
              style: textStyleMedium,
            ),
          ),
          adaptiveAction(
            context: context,
            onPressed: () async {
              await ChatCrud(basePath).deleteChatData();
              HiveTransactions.deleteAllBloodGlucose();
              HiveTransactions.deleteAllWeightRecord();
              HiveTransactions.favRecipeDeleteAll();
              HiveTransactions.foodFavDeleteAll();
              HiveTransactions.shoppingListDeleteAll();
              context.pop();
            },
            child: Text(
              LocaleKeys.profileitems_delete_button.tr(),
              style: textStyleMedium.copyWith(color: Colors.red.shade400),
            ),
          ),
        ],
      ),
    );
  }

  void premiumDialog(BuildContext buildContext, String title, String content) {
    final textStyleMedium = Theme.of(
      buildContext,
    ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500);
    final textStyleSmall = Theme.of(buildContext).textTheme.titleSmall!;

    showAdaptiveDialog<String>(
      context: buildContext,
      builder: (BuildContext context) => AlertDialog.adaptive(
        backgroundColor: Colors.black,
        title: Text(title, style: textStyleMedium),
        content: Text(content, style: textStyleSmall),
        actions: <Widget>[
          adaptiveAction(
            context: context,
            onPressed: () => context.pop(),
            child: Text(
              LocaleKeys.text_confirmtext.tr(),
              style: textStyleMedium,
            ),
          ),
        ],
      ),
    );
  }

  Widget adaptiveAction({
    required BuildContext context,
    required VoidCallback onPressed,
    required Widget child,
  }) {
    final theme = Theme.of(context);
    switch (theme.platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return TextButton(onPressed: onPressed, child: child);
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return CupertinoDialogAction(onPressed: onPressed, child: child);
    }
  }
}
