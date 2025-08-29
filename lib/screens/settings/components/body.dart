// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/locale/l10n.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/router/app_router.dart';
import 'package:heart_rate/screens/settings/components/custom_shape.dart';
import 'package:heart_rate/screens/settings/components/profile_menu_item.dart';
import 'package:heart_rate/utils/dialog_manager.dart';
import 'package:heart_rate/utils/id_manager.dart';
import 'package:heart_rate/utils/launch_manager.dart';
import 'package:line_icons/line_icons.dart';
import 'package:open_store/open_store.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:share_plus/share_plus.dart';

class Body extends StatelessWidget
    with LaunchManager, DialogManager, IdManager {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const CustomShape(),
          Padding(
            padding: const EdgeInsets.only(left: 6, right: 8),
            child:
                //TODO: Revenuecat
                // Consumer<RevenueCatProvider>(
                //   builder: (context, revenueCatProvider, child) {
                //     final entitlement = revenueCatProvider.entitlement;
                //     return
                Column(
                  children: [
                    // if (entitlement == Entitlement.free)
                    //   const PremiumCard()
                    // else
                    const SizedBox.shrink(),
                    const SizedBox(height: 6),
                    ProfileMenuItem(
                      icon: LineIcons.globe,
                      text: LocaleKeys.profileitems_language.tr(
                        context: context,
                      ),
                      press: () => _showLanguagePicker(context),
                    ),
                    const SizedBox(height: 6),
                    ProfileMenuItem(
                      icon: LineIcons.alternateShareSquare,
                      text: LocaleKeys.profileitems_tellafriend.tr(
                        context: context,
                      ),
                      press: _buildShare,
                    ),
                    const SizedBox(height: 6),
                    ProfileMenuItem(
                      icon: LineIcons.star,
                      text: LocaleKeys.profileitems_rateus.tr(context: context),
                      press: _buildOpenStore,
                    ),
                    const SizedBox(height: 6),
                    ProfileMenuItem(
                      icon: LineIcons.envelope,
                      text: LocaleKeys.profileitems_contactus.tr(
                        context: context,
                      ),
                      press: () async {
                        final packageInfo = await PackageInfo.fromPlatform();

                        sendEposta(packageInfo.version);
                      },
                    ),
                    const SizedBox(height: 6),
                    ProfileMenuItem(
                      icon: LineIcons.alternateTrashAlt,
                      text: LocaleKeys.profileitems_delete.tr(context: context),
                      press: () async {
                        final basePath = await getUuid();
                        deleteDataDialog(context, basePath);
                      },
                    ),
                    ProfileMenuItem(
                      icon: LineIcons.lightbulb,
                      text: LocaleKeys.settings_tips.tr(),
                      press: () => context.push(AppRouter.tips),
                    ),
                    ProfileMenuItem(
                      icon: LineIcons.info,
                      text: LocaleKeys.navigation_disclaimer.tr(),
                      press: () => context.push(AppRouter.disclaimer),
                    ),
                  ],
                ),
            //   },
            // ),
          ),
        ],
      ),
    );
  }

  Future<void> _buildOpenStore() {
    return OpenStore.instance.open(
      appStoreId: '6746160215',
      androidAppBundleId: 'co.wiserapps.glycemicindex',
    );
  }

  //TODO: Change
  Future<void> _buildShare() {
    final params = ShareParams(
      text: Platform.isIOS
          ? '${LocaleKeys.profileitems_share_text.tr()} https://apps.apple.com/tr/app/id6746160215'
          : '${LocaleKeys.profileitems_share_text.tr()} https://play.google.com/store/apps/details?id=co.wiserapps.heartrate',
      subject: LocaleKeys.general_app_title.tr(),
    );
    return SharePlus.instance.share(params);
  }

  void _showLanguagePicker(BuildContext context) {
    showModalBottomSheet<void>(
      backgroundColor: Colors.transparent,
      context: context,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Container(
          height: 86.h,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: AppConst.kDefaultPadding,
            ),
            child: Column(
              children: [
                Center(child: buildDecorationSizedBox(context)),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: context.supportedLocales.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Row(
                          children: [
                            Text(L10n.flag[index]),
                            const SizedBox(width: 24),
                            Text(L10n.name[index]),
                          ],
                        ),
                        trailing: Icon(
                          LineIcons.angleRight,
                          color: AppConst.kPrimaryColor,
                          size: Device.screenType == ScreenType.tablet
                              ? 32
                              : 26,
                        ),
                        onTap: () {
                          log(context.supportedLocales[index].toString());
                          context.setLocale(context.supportedLocales[index]);
                          // HiveTransactions.favRecipeDeleteAll();
                          // HiveTransactions.foodFavDeleteAll();
                          // HiveTransactions.shoppingListDeleteAll();
                          Navigator.of(context).pop();
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  SizedBox buildDecorationSizedBox(BuildContext context) {
    return SizedBox(
      height: 5,
      width: 40,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Theme.of(context).dividerColor,
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}
