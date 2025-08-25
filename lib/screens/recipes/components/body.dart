import 'package:flutter/material.dart';
import 'package:glycemic_index/screens/recipes/components/recipes_list.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        RecipesList(),
      ],
    );
  }
}
