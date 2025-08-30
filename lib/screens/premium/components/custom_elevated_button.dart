import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:heart_rate/core/enums/lottie_items_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/premium_provider.dart';
import 'package:heart_rate/provider/revenuecat.dart';
import 'package:heart_rate/services/purchase_api.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/models/package_wrapper.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomElevatedButton extends ConsumerStatefulWidget {
  const CustomElevatedButton(this.listPackages, {super.key});

  final List<Package>? listPackages;

  @override
  ConsumerState<CustomElevatedButton> createState() =>
      _CustomElevatedButtonState();
}

class _CustomElevatedButtonState extends ConsumerState<CustomElevatedButton>
    with SingleTickerProviderStateMixin {
  Package? packageWeekly;
  Package? packageLifetime;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: DurationItems.high(),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pop(context);
        controller.reset();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(premiumProvider);
    var packageWeekly = context.watch<RevenueCatProvider>().packageWeekly;
    var packageLifetime = context.watch<RevenueCatProvider>().packageLifetime;
    if (packageWeekly == null || packageLifetime == null) {
      packageWeekly = widget.listPackages?[0];
      packageLifetime = widget.listPackages?[1];
    }
    return Padding(
      padding: EdgeInsets.only(
        bottom: Device.screenType == ScreenType.tablet ? 8 : 0,
      ),
      child: ElevatedButton(
        onPressed: () async {
          bool? isTrue;
          state.setLoading(isLoading: false);
          switch (state.indexSelected) {
            case 0:
              isTrue = await PurchaseApi.purchasePackage(packageLifetime!);
            case 1:
              isTrue = await PurchaseApi.purchasePackage(packageWeekly!);
          }
          if (isTrue ?? false) {
            await showDoneDialog();
            if (!context.mounted) return;
            context.pop();
          }
          state.setLoading(isLoading: true);
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            Device.screenType == ScreenType.tablet ? 72 : 56,
          ),
          shape: roundedRectangleBorder(),
        ),
        child: SizedBox(
          height: Device.screenType == ScreenType.tablet ? 60 : 42,
          child: Stack(
            children: [
              Center(
                child: Text(
                  Platform.isAndroid
                      ? LocaleKeys.paywall_subscribe_now.tr()
                      : state.indexSelected == 0
                      ? LocaleKeys.premium_continue.tr()
                      : LocaleKeys.paywall_try.tr(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).primaryColorLight,
                    fontSize: Device.screenType == ScreenType.tablet ? 24 : 20,
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                right: -8,
                child: Lottie.asset(
                  LottieItemsEnum.subscribe.lottiePath,
                  height: Device.screenType == ScreenType.tablet ? 60 : 42,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showDoneDialog() => showDialog<void>(
    barrierDismissible: false,
    context: context,
    builder: (context) => Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset(
            LottieItemsEnum.done.lottiePath,
            repeat: false,
            controller: controller,
            onLoaded: (composition) {
              controller.forward();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              LocaleKeys.paywall_congratulation.tr(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: Device.screenType == ScreenType.tablet ? 20 : 14,
              ),
            ),
          ),
          SizedBox(height: Device.screenType == ScreenType.tablet ? 24 : 16),
        ],
      ),
    ),
  );

  RoundedRectangleBorder roundedRectangleBorder() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(25),
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    );
  }
}
