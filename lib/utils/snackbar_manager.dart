import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

mixin SnackBarManager {
  void showErrorSnackBar(BuildContext context, String errorMessage) {
    final textStyle = Theme.of(
      context,
    ).textTheme.titleMedium!.copyWith(fontSize: 14);

    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        textStyle: textStyle.copyWith(color: Colors.white),
        message: errorMessage,
        maxLines: 3,
      ),
    );
  }

  void showSuccessSnackBar(BuildContext context, String successMessage) {
    final textStyle = Theme.of(context).textTheme.titleMedium!;
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        textStyle: textStyle.copyWith(color: Colors.white),
        message: successMessage,
        maxLines: 3,
      ),
    );
  }
}
