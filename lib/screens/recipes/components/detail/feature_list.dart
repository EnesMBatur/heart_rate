// ignore_for_file: public_member_api_docs, sort_constructors_first, omit_local_variable_types, inference_failure_on_collection_literal, lines_longer_than_80_chars
import 'package:flutter/material.dart';
import 'package:glycemic_index/core/constants/constants.dart';
import 'package:glycemic_index/core/enums/diets_enum.dart';
import 'package:glycemic_index/core/enums/meals_enum.dart';
import 'package:glycemic_index/models/recipes.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FeatureList extends StatefulWidget {
  const FeatureList({
    required this.recipeData,
    super.key,
  });

  final Recipe recipeData;

  @override
  State<FeatureList> createState() => _FeatureListState();
}

class _FeatureListState extends State<FeatureList> {
  final featureList = [];

  @override
  void initState() {
    super.initState();

    for (final moment in widget.recipeData.mealTypes!) {
      featureList.add(MealsEnum.values[moment].name);
    }

    for (final int diet in widget.recipeData.dietLabels ?? []) {
      featureList.add(DietsEnum.values[diet].name);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: featureList.length,
      separatorBuilder: (context, index) {
        return const Padding(padding: EdgeInsets.only(left: 12));
      },
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(
            horizontal: AppConst.kDefaultPadding,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: AppConst.kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            featureList[index] as String,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: Device.screenType == ScreenType.tablet ? 22 : 14,
                  color: Theme.of(context).primaryColorLight,
                ),
          ),
        );
      },
    );
  }
}
