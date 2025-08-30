import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/provider/premium_provider.dart';
import 'package:heart_rate/utils/launch_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AndroidCancel extends ConsumerWidget with LaunchManager {
  const AndroidCancel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sku = 'glycemic_19.99';
    final state = ref.watch(premiumProvider);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Text(
            LocaleKeys.premium_canceltext.tr(),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: Device.screenType == ScreenType.tablet ? 20 : 10,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            if (state.indexSelected == 1) {
              sku = 'glycemic_3.99';
            } else if (state.indexSelected == 0) {
              sku = 'glycemic_19.99';
            }
            launchUri(
              Uri.parse(
                'https://play.google.com/store/account/subscriptions?sku=$sku&package=$packageName',
              ),
            );
          },
          child: Text(
            LocaleKeys.premium_cancelbutton.tr(),
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: Device.screenType == ScreenType.tablet ? 20 : 12,
            ),
          ),
        ),
      ],
    );
  }
}

const packageName = 'co.wiserapps.glycemicindex';
