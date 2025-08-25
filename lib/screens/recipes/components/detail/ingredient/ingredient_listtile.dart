// ignore_for_file: avoid_redundant_argument_values, use_named_constants

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fraction/fraction.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/hive/transactions.dart';
import 'package:glycemic_index/locale/lang/locale_keys.g.dart';
import 'package:glycemic_index/models/ingredient.dart';
import 'package:glycemic_index/utility/snackbar_manager.dart';
import 'package:line_icons/line_icons.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class IngredientListTile extends StatelessWidget with SnackBarManager {
  const IngredientListTile({
    required this.ingredient,
    required this.piece,
    super.key,
  });

  final Ingredient ingredient;
  final double piece;

  @override
  Widget build(BuildContext context) {
    final regex = RegExp(r'([.]*0)(?!.*\d)');
    final regexPiece = piece
        .toStringAsFixed(piece.truncateToDouble() == piece ? 1 : 2)
        .replaceAll(regex, '');
    final textStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(fontSize: Device.screenType == ScreenType.tablet ? 24 : 16);
    return ListTile(
      visualDensity: Device.screenType == ScreenType.tablet
          ? const VisualDensity(vertical: 4, horizontal: 4)
          : const VisualDensity(vertical: 0, horizontal: 0),
      contentPadding: EdgeInsets.only(
        bottom: Device.screenType == ScreenType.tablet ? 20 : 10,
      ),
      leading: Container(
        height: Device.screenType == ScreenType.tablet ? 80 : 50,
        width: Device.screenType == ScreenType.tablet ? 80 : 50,
        decoration: BoxDecoration(
          color: const Color(0XFFE6EBF2),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ingredient.icon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
                child: SvgPicture.asset(
                  ingredient.icon!,
                  //height: 22,
                ),
              )
            : const SizedBox(),
      ),
      title: Text(
        ingredient.name,
        style: textStyle,
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (piece == 0)
            const SizedBox.shrink()
          else
            piece == 0.20 ||
                    piece == 0.25 ||
                    piece == 1 / 3 ||
                    piece == 0.5 ||
                    piece == 0.75
                ? Text(
                    piece.toFraction().toString(),
                    style: textStyle,
                  )
                : Text(
                    regexPiece,
                    style: textStyle,
                  ),
          const Text(' '),
          Text(
            ingredient.unit ?? '',
            style: textStyle,
          ),
          const SizedBox(width: 6),
          IconButton(
            icon: const Icon(LineIcons.plusCircle),
            color: AppConst.kPrimaryColor,
            iconSize: Device.screenType == ScreenType.tablet
                ? AppConst.kTabletDefaultPadding
                : AppConst.kIconSize,
            onPressed: () {
              try {
                HiveTransactions.shoppingListAdd(ingredient, piece);
                showSuccessSnackBar(
                  context,
                  LocaleKeys.snackbar_shoppingcartsuccess.tr(
                    namedArgs: {
                      'piece': regexPiece == '0' ? '' : regexPiece,
                      'unit': ingredient.unit ?? '',
                      'content': ingredient.name,
                    },
                  ),
                );
              } catch (e) {
                showErrorSnackBar(
                  context,
                  'Something went wrong. Please try again.',
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
