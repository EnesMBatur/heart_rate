import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/lottie_items_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/router/app_router.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async => await context.push(AppRouter.paywall),
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppConst.kDefaultPadding,
          left: AppConst.kDefaultPadding,
          right: AppConst.kDefaultPadding,
          bottom: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF1A8A26), // Koyu yeşil
                Color(0xFF2EBA39), // Ana yeşil renk
                Color(0xFF39CABE), // Turkuaz tonu
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              bottom: 16,
              left: 8,
              right: 12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Lottie.asset(
                        LottieItemsEnum.premium.lottiePath,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              LocaleKeys.premium_upgrade.tr(),
                              style: Theme.of(context).textTheme.titleMedium!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                    fontWeight: FontWeight.bold,
                                  ),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              LocaleKeys.premium_upgrade_subtitle.tr(),
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        LineIcons.angleRight,
                        color: Theme.of(context).primaryColorLight,
                        size: Device.screenType == ScreenType.tablet ? 46 : 30,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
