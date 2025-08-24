import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../locale/lang/locale_keys.g.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.general_heart_health_tips.tr())),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // How to measure section
            _buildSectionCard(
              context,
              'how_to_check_pulse'.tr(),
              Icons.fingerprint,
              [
                'pulse_tip_1'.tr(),
                'pulse_tip_2'.tr(),
                'pulse_tip_3'.tr(),
                'pulse_tip_4'.tr(),
                'pulse_tip_5'.tr(),
              ],
            ),

            const SizedBox(height: 20),

            // Best practices section
            _buildSectionCard(
              context,
              LocaleKeys.general_best_results_tips.tr(),
              Icons.lightbulb_outline,
              [
                LocaleKeys.general_best_tip_1.tr(),
                LocaleKeys.general_best_tip_2.tr(),
                LocaleKeys.general_best_tip_3.tr(),
                LocaleKeys.general_best_tip_4.tr(),
                LocaleKeys.general_best_tip_5.tr(),
                LocaleKeys.general_best_tip_6.tr(),
                LocaleKeys.general_best_tip_7.tr(),
                LocaleKeys.general_best_tip_8.tr(),
              ],
            ),

            const SizedBox(height: 20),

            // Heart rate zones section
            _buildHeartRateZonesCard(context),

            const SizedBox(height: 20),

            // Health tips section
            _buildSectionCard(
              context,
              'keeping_heart_strong'.tr(),
              Icons.favorite,
              [
                'health_tip_1'.tr(),
                'health_tip_2'.tr(),
                'health_tip_3'.tr(),
                'health_tip_4'.tr(),
                'health_tip_5'.tr(),
                'health_tip_6'.tr(),
                'health_tip_7'.tr(),
                'health_tip_8'.tr(),
                'health_tip_9'.tr(),
              ],
            ),

            const SizedBox(height: 20),

            // Risk factors section
            _buildSectionCard(
              context,
              'minimizing_risk_factors'.tr(),
              Icons.warning_outlined,
              [
                'risk_tip_1'.tr(),
                'risk_tip_2'.tr(),
                'risk_tip_3'.tr(),
                'risk_tip_4'.tr(),
                'risk_tip_5'.tr(),
                'risk_tip_6'.tr(),
                'risk_tip_7'.tr(),
                'risk_tip_8'.tr(),
                'risk_tip_9'.tr(),
                'risk_tip_10'.tr(),
              ],
            ),

            const SizedBox(height: 20),

            // When to see a doctor section
            _buildWarningCard(context),

            const SizedBox(height: 20),

            // Sharing section
            _buildSectionCard(context, 'share_with_family'.tr(), Icons.share, [
              'share_tip_1'.tr(),
              'share_tip_2'.tr(),
              'share_tip_3'.tr(),
              'share_tip_4'.tr(),
              'share_tip_5'.tr(),
              'share_tip_6'.tr(),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(
    BuildContext context,
    String title,
    IconData icon,
    List<String> tips,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Theme.of(context).primaryColor, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...tips.map((tip) => _buildTipItem(context, tip)),
          ],
        ),
      ),
    );
  }

  Widget _buildTipItem(BuildContext context, String tip) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 16),
          const SizedBox(width: 8),
          Expanded(
            child: Text(tip, style: Theme.of(context).textTheme.bodyMedium),
          ),
        ],
      ),
    );
  }

  Widget _buildHeartRateZonesCard(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.monitor_heart,
                  color: Theme.of(context).primaryColor,
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'understanding_heart_rate_zones'.tr(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildHeartRateZone(
              context,
              'resting_heart_rate'.tr(),
              'resting_range'.tr(),
              'resting_description'.tr(),
              Colors.green,
            ),
            _buildHeartRateZone(
              context,
              'low_heart_rate'.tr(),
              'low_range'.tr(),
              'low_description'.tr(),
              Colors.blue,
            ),
            _buildHeartRateZone(
              context,
              'elevated_heart_rate'.tr(),
              'elevated_range'.tr(),
              'elevated_description'.tr(),
              Colors.orange,
            ),
            _buildHeartRateZone(
              context,
              'high_heart_rate'.tr(),
              'high_range'.tr(),
              'high_description'.tr(),
              Colors.red,
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.amber[200]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.info_outline, color: Colors.amber[700], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'heart_rate_zones_disclaimer'.tr(),
                      style: TextStyle(fontSize: 12, color: Colors.amber[700]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartRateZone(
    BuildContext context,
    String zone,
    String range,
    String description,
    Color color,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$zone ($range)',
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWarningCard(BuildContext context) {
    return Card(
      color: Colors.red[50],
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.medical_services_outlined,
                  color: Colors.red[700],
                  size: 28,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'when_to_see_doctor'.tr(),
                    style: Theme.of(
                      context,
                    ).textTheme.titleLarge?.copyWith(color: Colors.red[700]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              'consult_healthcare_provider'.tr(),
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(color: Colors.red[700]),
            ),
            const SizedBox(height: 8),
            ...[
              'symptom_1'.tr(),
              'symptom_2'.tr(),
              'symptom_3'.tr(),
              'symptom_4'.tr(),
              'symptom_5'.tr(),
              'symptom_6'.tr(),
              'symptom_7'.tr(),
              'symptom_8'.tr(),
            ].map(
              (symptom) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.emergency, color: Colors.red[700], size: 16),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        symptom,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.red[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.red[300]!),
              ),
              child: Row(
                children: [
                  Icon(Icons.emergency, color: Colors.red[700], size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'medical_disclaimer'.tr(),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.red[700],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
