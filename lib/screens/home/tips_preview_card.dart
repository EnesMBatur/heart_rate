import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';

class TipsPreviewCard extends StatelessWidget {
  final VoidCallback onViewAllTips;

  const TipsPreviewCard({super.key, required this.onViewAllTips});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          LocaleKeys.quick_tips.tr(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _TipItem(tip: LocaleKeys.tip_hold_steady.tr()),
                _TipItem(tip: LocaleKeys.tip_breathe_calm.tr()),
                _TipItem(tip: LocaleKeys.tip_cover_camera.tr()),
                _TipItem(tip: LocaleKeys.tip_light_touch.tr()),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: onViewAllTips,
                  child: Text(LocaleKeys.view_all_tips.tr()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TipItem extends StatelessWidget {
  final String tip;

  const _TipItem({required this.tip});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }
}
