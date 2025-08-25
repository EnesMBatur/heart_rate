import 'package:flutter/material.dart';

class IngredientList extends ConsumerWidget {
  const IngredientList({required this.recipeData, super.key});

  final Recipe recipeData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pieceRef = ref.watch(recipeProvider);
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: recipeData.ingredients.length,
      itemBuilder: (context, index) {
        final piece = pieceRef.getPiece(
          recipeData,
          recipeData.ingredients[index].amount ?? 0,
        );
        return IngredientListTile(
          ingredient: recipeData.ingredients[index],
          piece: piece,
        );
      },
    );
  }
}
