// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/diets_enum.dart';
import 'package:heart_rate/core/enums/meals_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/recipe_provider.dart';
import 'package:heart_rate/screens/recipes/components/sheet_row.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomBottomSheet extends ConsumerStatefulWidget {
  const CustomBottomSheet({
    required this.onClickedConfirm,
    required this.onClickedClose,
    required this.onClickedClearFilters,
    super.key,
  });

  final VoidCallback onClickedConfirm;
  final VoidCallback onClickedClose;
  final VoidCallback onClickedClearFilters;

  @override
  CustomBottomSheetState createState() => CustomBottomSheetState();
}

class CustomBottomSheetState extends ConsumerState<CustomBottomSheet> {
  //List<Map<String, String>> selectedOption = [];

  final filters = <String>[
    LocaleKeys.filters_diet.tr(),
    LocaleKeys.filters_moment.tr(),
  ];

  final List<List<String>> options = [
    DietsEnum.values.map((e) => e.name).toList(),
    MealsEnum.values.map((e) => e.name).toList(),
  ];

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 30 : 18,
    );
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
        padding: const EdgeInsets.all(AppConst.kDefaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SheetRow(title: LocaleKeys.filters_filters.tr()),
            SizedBox(height: Device.screenType == ScreenType.tablet ? 32 : 16),
            buildFilterListView(textStyle),
            buildButtons(textStyle),
            SizedBox(height: Device.screenType == ScreenType.tablet ? 40 : 20),
          ],
        ),
      ),
    );
  }

  ListView buildFilterListView(TextStyle textStyle) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      itemCount: filters.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              filters[index],
              style: textStyle.copyWith(fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: Device.screenType == ScreenType.tablet ? 24 : 16,
              children: options[index]
                  .map((option) => buildChip(option, textStyle, context, index))
                  .toList(),
            ),
            SizedBox(height: Device.screenType == ScreenType.tablet ? 20 : 10),
          ],
        );
      },
    );
  }

  Widget buildChip(
    String option,
    TextStyle textStyle,
    BuildContext context,
    int index,
  ) {
    final selectedOption = ref.watch(recipeProvider).filters;
    final isSelected = selectedOption.any(
      (element) => mapEquals(element, {filters[index]: option}),
    );

    final foregroundColor = isSelected
        ? Theme.of(context).primaryColorLight
        : Theme.of(context).primaryColor;
    final backgroundColor = isSelected
        ? AppConst.kPrimaryColor
        : Theme.of(context).primaryColorLight;

    return GestureDetector(
      onTap: () => setState(() {
        //selectedOption.contains({filters[index]: option})
        selectedOption.any(
              (element) => mapEquals(element, {filters[index]: option}),
            )
            ? selectedOption.removeWhere(
                (element) => element[filters[index]] == option,
              )
            : selectedOption.add({filters[index]: option});
      }),
      child: Chip(
        shape: const StadiumBorder(
          side: BorderSide(color: AppConst.kPrimaryColor),
        ),
        label: Text(
          option,
          style: textStyle.copyWith(
            fontSize: Device.screenType == ScreenType.tablet ? 24 : 16,
            color: foregroundColor,
          ),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }

  Widget buildButtons(TextStyle textStyle) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton(
              onPressed: widget.onClickedClose,
              child: Text(LocaleKeys.button_close.tr(), style: textStyle),
            ),
            //TODO: RevenueCat integration
            // provider.Consumer<RevenueCatProvider>(
            //   builder: (context, revenueCatProvider, child) {
            // return
            ElevatedButton(
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              onPressed: () async {
                // final entitlement = revenueCatProvider.entitlement;
                // if (entitlement == Entitlement.free) {
                //   await context.push(AppRouter.paywall);
                // } else {
                widget.onClickedConfirm();
                //}
              },
              child: Text(
                LocaleKeys.button_filter.tr(),
                style: textStyle.copyWith(
                  color: Theme.of(context).primaryColorLight,
                ),
              ),
            ),
            //   },
            // ),
          ],
        ),
        TextButton(
          onPressed: widget.onClickedClearFilters,
          child: Text(LocaleKeys.button_clearfilters.tr(), style: textStyle),
        ),
      ],
    );
  }
}
