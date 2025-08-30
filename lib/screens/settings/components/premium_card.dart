import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/core/enums/lottie_items_enum.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';
import 'package:heart_rate/screens/premium/paywall.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await showDialog(
          context: context,
          barrierDismissible: false,
          useSafeArea: false,
          builder: (context) => const PaywallScreen(),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: AppConst.kDefaultPadding,
          left: AppConst.kDefaultPadding,
          right: AppConst.kDefaultPadding,
          bottom: 8,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF667eea), // Soft purple-blue
                Color(0xFF764ba2), // Deep purple
                Color(0xFFf093fb), // Light pink
                Color(0xFFf5576c), // Coral red
                Color(0xFFE53E3E), // Heart red (brand color)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 0.25, 0.5, 0.75, 1.0],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 15,
                offset: const Offset(0, 5),
              ),
              BoxShadow(
                color: Color(0xFF667eea).withOpacity(0.3),
                spreadRadius: 1,
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
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
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize:
                                        Device.screenType == ScreenType.tablet
                                        ? 23.sp
                                        : 17.sp,
                                  ),
                              softWrap: true,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              LocaleKeys.premium_upgrade_subtitle.tr(),
                              style: Theme.of(context).textTheme.bodyLarge!
                                  .copyWith(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize:
                                        Device.screenType == ScreenType.tablet
                                        ? 20.sp
                                        : 16.sp,
                                  ),
                              softWrap: true,
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        LineIcons.angleRight,
                        color: Colors.white,
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
