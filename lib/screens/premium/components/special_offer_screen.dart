// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/revenuecat.dart';
import 'package:heart_rate/services/purchase_api.dart';
import 'package:heart_rate/utils/launch_manager.dart';
import 'package:heart_rate/utils/revenue_manager.dart';
import 'package:heart_rate/utils/snackbar_manager.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../core/constants/constants.dart';
import '../../../core/constants/duration_items.dart';
import '../../../core/enums/lottie_items_enum.dart';

// Special Offer Screen Widget - Full Screen Premium Paywall Style
class SpecialOfferScreen extends StatefulWidget {
  final List<Package>? listPackages;
  final VoidCallback onOfferCompleted;

  const SpecialOfferScreen({
    super.key,
    required this.onOfferCompleted,
    this.listPackages,
  });

  @override
  State<SpecialOfferScreen> createState() => _SpecialOfferScreenState();
}

class _SpecialOfferScreenState extends State<SpecialOfferScreen>
    with
        SingleTickerProviderStateMixin,
        LaunchManager,
        SnackBarManager,
        RevenueCatManager {
  late AnimationController controller;
  bool _isLoading = true;
  int _countdown = 60; // 60 saniye
  late Timer _timer;
  final Uri _privacyUrl = Uri.parse(
    'https://www.wiserapps.co/glycemicindex-privacy-policy',
  );
  final Uri _termsUrl = Uri.parse(
    'https://www.wiserapps.co/glycemicindex-terms-conditions',
  );

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: DurationItems.high(),
    );

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onOfferCompleted();
        controller.reset();
      }
    });

    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer.cancel();
          widget.onOfferCompleted();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    controller.dispose();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Opacity(
              opacity: _isLoading ? 1 : 0.5,
              child: buildListview(context),
            ),
            Opacity(opacity: _isLoading ? 0 : 1, child: buildSpinKitCircle()),
          ],
        ),
      ),
    );
  }

  Widget buildListview(BuildContext context) {
    final scrollableContent = ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 10,
            left: AppConst.kDefaultPadding,
            right: AppConst.kDefaultPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildTimesIcon(context),
              SizedBox(height: 1.h),
              buildSpecialOfferHeader(context),
              SizedBox(height: 1.h),

              // Premium Lottie Animation - Sayacın altına taşındı
              Center(
                child: SizedBox(
                  height: 18.h,
                  child: Lottie.asset(
                    'assets/json/premium.json',
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SizedBox(height: 2.h),

              // Special Offer Pricing Card
              buildSpecialOfferPricing(context),

              SizedBox(height: 2.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                child: Column(
                  children: [
                    // Yıldızlar - Ortadaki büyük, yanlara küçülen
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: Device.screenType == ScreenType.tablet
                              ? 20
                              : 24,
                        ),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: Device.screenType == ScreenType.tablet
                              ? 28
                              : 32,
                        ),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: Device.screenType == ScreenType.tablet
                              ? 36
                              : 48,
                        ),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: Device.screenType == ScreenType.tablet
                              ? 28
                              : 32,
                        ),
                        SizedBox(width: 1.w),
                        Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: Device.screenType == ScreenType.tablet
                              ? 20
                              : 24,
                        ),
                      ],
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      LocaleKeys.offer_join.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                        fontSize: Device.screenType == ScreenType.tablet
                            ? 24
                            : 20,
                      ),
                    ),
                    SizedBox(height: 0.8.h),
                    Text(
                      LocaleKeys.offer_unlock.tr(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                        height: 1.3,
                        fontWeight: FontWeight.w600,
                        fontSize: Device.screenType == ScreenType.tablet
                            ? 24
                            : 20,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 2.h),
      ],
    );

    final Widget fixedBottomContent = Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 4.w,
        ).copyWith(top: 2.h, bottom: 1.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildSpecialOfferButton(context),
            SizedBox(height: 1.h),
            buildButton(context),
          ],
        ),
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: scrollableContent),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 4.0),
          child: Divider(height: 1, thickness: 1, color: AppConst.kCircleColor),
        ),
        fixedBottomContent,
      ],
    );
  }

  Widget buildTimesIcon(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: AppConst.kDefaultEdgeInsets),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            splashRadius: 22,
            onPressed: () => widget.onOfferCompleted(),
            icon: Icon(LineIcons.times, size: 24, color: Colors.grey.shade300),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialOfferHeader(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(6.w),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.timer, color: Colors.white, size: 7.w),
              SizedBox(width: 2.w),
              Flexible(
                child: Text(
                  '${LocaleKeys.offer_limited_offer.tr()} ${_formatTime(_countdown)}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: Device.screenType == ScreenType.tablet ? 24 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          LocaleKeys.offer_special_offer.tr(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.bold,
            fontSize: Device.screenType == ScreenType.tablet ? 30 : 26,
          ),
        ),
      ],
    );
  }

  Widget buildSpecialOfferPricing(BuildContext context) {
    // String duration = LocaleKeys.offer_lifetime.tr(); // Default fallback
    Package? specialOffer;

    if (widget.listPackages != null) {
      specialOffer = widget.listPackages![2];
    } else {
      specialOffer = context.watch<RevenueCatProvider>().specialOffer;
    }

    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(color: Colors.red[200]!, width: 0.8.w),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                specialOffer?.storeProduct.priceString ?? '...',
                style: TextStyle(
                  fontSize: Device.screenType == ScreenType.tablet ? 34 : 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[700],
                ),
              ),
              // SizedBox(width: 1.w),
              // Text(
              //   duration,
              //   style: TextStyle(
              //     fontSize: Device.screenType == ScreenType.tablet ? 18 : 16,
              //     color: Colors.grey[600],
              //   ),
              // ),
            ],
          ),
          SizedBox(height: 1.h),
          Text(
            LocaleKeys.offer_lifetime.tr(),
            style: TextStyle(
              fontSize: Device.screenType == ScreenType.tablet ? 24 : 22,
              fontWeight: FontWeight.w600,
              color: Colors.red[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSpecialOfferButton(BuildContext context) {
    Package? specialOffer;
    specialOffer = context.read<RevenueCatProvider>().specialOffer;
    return Padding(
      padding: EdgeInsets.only(
        bottom: Device.screenType == ScreenType.tablet ? 8 : 4,
      ),
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            _isLoading = false;
          });

          try {
            final success = await PurchaseApi.purchasePackage(specialOffer!);
            if (success) {
              await showDoneDialog();
              if (!context.mounted) return;
              widget.onOfferCompleted();
            }
          } catch (e) {
            // Satın alma hatası durumunda kullanıcıya bilgi verilebilir
            if (context.mounted) {
              showErrorSnackBar(context, 'Purchase failed: ${e.toString()}');
            }
          } finally {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          }
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(
            double.infinity,
            Device.screenType == ScreenType.tablet ? 72 : 56,
          ),
          // backgroundColor: const Color(0xFFFF6B35),
          // foregroundColor: Colors.white,
          shape: roundedRectangleBorder(),
        ),
        child: SizedBox(
          height: Device.screenType == ScreenType.tablet ? 60 : 42,
          child: Stack(
            children: [
              Center(
                child: Text(
                  LocaleKeys.button_signin.tr(),
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

  FittedBox buildButton(BuildContext context) {
    return FittedBox(
      child: Row(
        children: [
          TextButton(
            onPressed: () async {
              setState(() {
                _isLoading = false;
              });
              await restorePurchase();
              setState(() {
                _isLoading = true;
              });
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              LocaleKeys.premium_restore.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 18 : 14,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchUri(_privacyUrl);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              LocaleKeys.premium_privacy.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 18 : 14,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchUri(_termsUrl);
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 6),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: Size.zero,
            ),
            child: Text(
              LocaleKeys.premium_terms.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 18 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }

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

  Future restorePurchase() async {
    var entitlement = Entitlement.free;
    final customerInfo = await PurchaseApi.restorePurchases();
    if (customerInfo != null) {
      final entitlements = customerInfo.entitlements.active.values.toList();
      entitlement = entitlements.isEmpty
          ? Entitlement.free
          : Entitlement.premium;
    }
    if (mounted) {
      if (entitlement == Entitlement.free) {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Platform.isAndroid
                ? buildAndroidAlertDialog(
                    context,
                    LocaleKeys.premium_nofound.tr(),
                    LocaleKeys.premium_nofound_text.tr(),
                  )
                : buildCupertinoAlertDialog(
                    context,
                    LocaleKeys.premium_nofound.tr(),
                    LocaleKeys.premium_nofound_text.tr(),
                  );
          },
        );
      } else {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return Platform.isAndroid
                ? buildAndroidAlertDialog(
                    context,
                    LocaleKeys.premium_purcheserestored.tr(),
                    LocaleKeys.premium_purcheserestoredtext.tr(),
                  )
                : buildCupertinoAlertDialog(
                    context,
                    LocaleKeys.premium_purcheserestored.tr(),
                    LocaleKeys.premium_purcheserestoredtext.tr(),
                  );
          },
        );
      }
    }
  }

  Future<void> showDoneDialog() => showDialog(
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
          Text(
            LocaleKeys.paywall_congratulation.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: Device.screenType == ScreenType.tablet ? 20 : 14,
            ),
          ),
          SizedBox(height: Device.screenType == ScreenType.tablet ? 24 : 16),
        ],
      ),
    ),
  );

  Widget buildAndroidAlertDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 20 : 14,
    );
    return AlertDialog(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        title,
        style: textStyle.copyWith(fontWeight: FontWeight.w500),
      ),
      content: Text(content, style: textStyle),
      actions: <Widget>[
        ElevatedButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            LocaleKeys.button_ok.tr(),
            style: textStyle.copyWith(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildCupertinoAlertDialog(
    BuildContext context,
    String title,
    String content,
  ) {
    final textStyle = Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: Device.screenType == ScreenType.tablet ? 20 : 14,
    );
    return CupertinoAlertDialog(
      title: Text(
        title,
        style: textStyle.copyWith(fontWeight: FontWeight.w500),
      ),
      content: Text(content, style: textStyle),
      actions: <Widget>[
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            LocaleKeys.button_ok.tr(),
            style: textStyle.copyWith(color: Theme.of(context).primaryColor),
          ),
        ),
      ],
    );
  }

  Widget buildSpinKitCircle() {
    return Center(
      child: SizedBox(
        height: Device.screenType == ScreenType.tablet ? 240 : 150,
        child: Lottie.asset('assets/json/loading.json'),
      ),
    );
  }
}
