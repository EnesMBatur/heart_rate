import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/premium_provider.dart';
import 'package:heart_rate/provider/revenuecat.dart';
import 'package:heart_rate/services/purchase_api.dart';
import 'package:heart_rate/utils/dialog_manager.dart';
import 'package:heart_rate/utils/launch_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DetailButtons extends ConsumerWidget with LaunchManager, DialogManager {
  const DetailButtons({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final privacyUrl = Uri.parse(
      'https://www.wiserapps.co/glycemicindex-privacy-policy',
    );
    final termsUrl = Uri.parse(
      'https://www.wiserapps.co/glycemicindex-terms-conditions',
    );

    final state = ref.watch(premiumProvider);
    return FittedBox(
      child: Row(
        children: [
          TextButton(
            onPressed: () async {
              state.setLoading(isLoading: false);
              await restorePurchase(context);
              state.setLoading(isLoading: true);
            },
            child: Text(
              LocaleKeys.premium_restore.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 20 : 12,
                //color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchUri(privacyUrl);
            },
            child: Text(
              LocaleKeys.premium_privacy.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 20 : 12,
                //color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              launchUri(termsUrl);
            },
            child: Text(
              LocaleKeys.premium_terms.tr(),
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontSize: Device.screenType == ScreenType.tablet ? 20 : 12,
                //color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> restorePurchase(BuildContext context) async {
    var entitlement = Entitlement.free;
    final customerInfo = await PurchaseApi.restorePurchases();
    if (customerInfo != null) {
      final entitlements = customerInfo.entitlements.active.values.toList();
      entitlement = entitlements.isEmpty
          ? Entitlement.free
          : Entitlement.premium;
    }
    if (!context.mounted) return;
    if (entitlement == Entitlement.free) {
      return premiumDialog(
        context,
        LocaleKeys.premium_nofound.tr(),
        LocaleKeys.premium_nofound_text.tr(),
      );
    } else {
      return premiumDialog(
        context,
        LocaleKeys.premium_purcheserestored.tr(),
        LocaleKeys.premium_purcheserestoredtext.tr(),
      );
    }
  }
}
