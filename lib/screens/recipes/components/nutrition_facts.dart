import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NutritionFacts extends StatelessWidget {
  const NutritionFacts({
    super.key,
    required this.calories,
    required this.gi,
    required this.gl,
    required this.carbs,
    required this.netCarbs,
    required this.totalSugar,
    required this.fiber,
    required this.protein,
    required this.totalFat,
    this.cholestrol,
    required this.servingSize,
  });

  final String calories;
  final String gi;
  final String gl;
  final String carbs;
  final String netCarbs;
  final String totalSugar;
  final String fiber;
  final String protein;
  final String totalFat;
  final String? cholestrol;
  final String servingSize; // Yeni parametre

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Başlık
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            //alignment: Alignment.center,
            child: Text(
              LocaleKeys.general_nutrition.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(thickness: 6, height: 6, color: Colors.black),
          // Serving Size
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Text(
              '${LocaleKeys.calendar_serving_size.tr()}: $servingSize',
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),

          const Divider(thickness: 3, height: 3, color: Colors.black),

          // Kalori
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_calories.tr(),
            value: calories,
            isBold: true,
            isLarge: true,
            showUnit: false,
          ),

          const Divider(thickness: 1, height: 1, color: Colors.black),

          // Glycemic Values
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_glycemic.tr(),
            value: gi,
            showUnit: false,
          ),
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_glycemicload.tr(),
            value: gl,
            showUnit: false,
          ),
          const Divider(thickness: 3, height: 3, color: Colors.black),
          // Total Carbs
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_carbohydrates.tr(),
            value: carbs,
            isBold: true,
          ),
          // Net Carbs
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _buildNutritionRow(
              context: context,
              title: LocaleKeys.general_netCarbs.tr(),
              value: netCarbs,
            ),
          ),
          // Total Sugar
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _buildNutritionRow(
              context: context,
              title: LocaleKeys.general_sugars.tr(),
              value: totalSugar,
            ),
          ),
          // Fiber
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: _buildNutritionRow(
              context: context,
              title: LocaleKeys.general_fiber.tr(),
              value: fiber,
            ),
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black),
          // Protein
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_protein.tr(),
            value: protein,
            isBold: true,
          ),
          const Divider(thickness: 1, height: 1, color: Colors.black),
          // Total Fat
          _buildNutritionRow(
            context: context,
            title: LocaleKeys.general_fat.tr(),
            value: totalFat,
            isBold: true,
          ),
          cholestrol == null
              ? const SizedBox.shrink()
              : const Divider(thickness: 1, height: 1, color: Colors.black),
          // Cholesterol
          cholestrol == null
              ? const SizedBox.shrink()
              : _buildNutritionRow(
                  context: context,
                  title: LocaleKeys.general_cholesterol.tr(),
                  value: cholestrol!,
                  isBold: true,
                  unit: "mg",
                ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildNutritionRow({
    required BuildContext context,
    required String title,
    required String value,
    bool isBold = false,
    bool isLarge = false,
    bool showUnit = true,
    String unit = "g",
  }) {
    // N/A veya boş değerleri kontrol et
    final displayValue = (value == 'N/A' || value.isEmpty) ? 'N/A' : value;
    final showUnitText = showUnit && displayValue != 'N/A';
    final entitlement = Provider.of<RevenueCatProvider>(context).entitlement;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: (isLarge)
                ? Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  )
                : Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
                  ),
          ),
          entitlement == Entitlement.free
              ? GestureDetector(
                  onTap: () async => await context.push(AppRouter.paywall),
                  child: SvgPicture.asset(
                    height: 22,
                    SvgGeneralEnum.lock.svgPath,
                  ),
                )
              : Text(
                  showUnitText ? "$displayValue$unit" : displayValue,
                  style: (isLarge)
                      ? Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                        )
                      : Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: isBold
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                ),
        ],
      ),
    );
  }
}
