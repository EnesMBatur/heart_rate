import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/locale/lang/locale_keys.g.dart';

class PaywallOption extends StatelessWidget {
  const PaywallOption({
    required this.label,
    required this.subtitle,
    required this.price,
    required this.isBestSeller,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });
  final String label;
  final String subtitle;
  final String price;
  final bool isBestSeller;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Stack(
        clipBehavior: Clip.none, // Etiketin dışarı taşmasına izin verir
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(15),
              // Seçilmişse kenar rengi turuncu, değilse gri
              border: Border.all(
                color: isSelected
                    ? AppConst.kPrimaryColor
                    : Colors.grey.shade400,
                width: 2,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Seçme butonu
                Row(
                  children: [
                    Icon(
                      isSelected
                          ? Icons.radio_button_checked
                          : Icons.radio_button_unchecked,
                      color: isSelected
                          ? AppConst.kPrimaryColor
                          : Theme.of(context).primaryColor,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(label, style: TextTheme.of(context).titleMedium),
                        if (Platform.isIOS)
                          Text(
                            subtitle,
                            style: TextTheme.of(
                              context,
                            ).bodyMedium!.copyWith(color: Colors.grey.shade600),
                          ),
                      ],
                    ),
                  ],
                ),
                Text(price, style: TextTheme.of(context).titleMedium),
              ],
            ),
          ),
          // Best Seller etiketi sadece isBestSeller true olduğunda gösterilecek
          if (isBestSeller)
            Positioned(
              right: 15,
              top: -15, // Etiketin biraz daha yukarı taşması
              // için negatif değer artırıldı
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                decoration: BoxDecoration(
                  color: AppConst.kPrimaryColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  LocaleKeys.premium_best_offer.tr(),
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
