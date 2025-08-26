import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/screens/recipes/glycemic_indicator.dart';
import 'package:heart_rate/utils/glycemic_index_color.dart';

class GlycemicCard extends StatelessWidget with GlycemicIndexColor {
  const GlycemicCard({
    super.key,
    this.name,
    required this.gi,
    required this.gl,
    required this.calories,
    this.unit,
    this.servingSize,
    this.isRecipe,
  });

  final String? name;
  final String gi;
  final String gl;
  final String calories;
  final String? unit;
  final String? servingSize;
  final bool? isRecipe;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name == null
                    ? const SizedBox.shrink()
                    : Text(
                        name!,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                const SizedBox(height: 8),
                if (isRecipe != true)
                  Text(
                    "$calories ${LocaleKeys.recipe_caloriesper.tr()} $servingSize $unit",
                    style: Theme.of(context).textTheme.bodyMedium,
                  )
                else
                  Text(
                    "$calories ${LocaleKeys.recipe_caloriesper.tr()} ${LocaleKeys.others_servings.tr()}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // GI değeri
          GlycemicIndicator(
            context: context,
            value: gi,
            label: LocaleKeys.others_GI.tr(),
            color: getGIColor(gi),
            size: 52,
          ),
          const SizedBox(width: 8),
          // GL değeri
          GlycemicIndicator(
            context: context,
            value: gl,
            label: LocaleKeys.others_GL.tr(),
            color: getGLColor(gl),
            size: 52,
          ),
        ],
      ),
    );
  }
}
