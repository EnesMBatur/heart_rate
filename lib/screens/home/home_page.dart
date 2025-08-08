import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';
import '../../viewmodels/home_view_model.dart';
import 'welcome_card.dart';
import 'last_measurement_card.dart';
import 'quick_start_button.dart';
import 'tips_preview_card.dart';

class HomePage extends StatelessWidget {
  final HomeViewModel viewModel;
  final VoidCallback onStartMeasurement;
  final VoidCallback onViewAllTips;

  const HomePage({
    super.key,
    required this.viewModel,
    required this.onStartMeasurement,
    required this.onViewAllTips,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocaleKeys.heartRater.tr()), elevation: 0),
      body: viewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: viewModel.refresh,
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Welcome Card
                    const WelcomeCard(),
                    const SizedBox(height: 20),

                    // Last Measurement Card
                    if (viewModel.hasLastMeasurement) ...[
                      LastMeasurementCard(
                        measurement: viewModel.lastMeasurement!,
                      ),
                      const SizedBox(height: 20),
                    ],

                    // Quick Start Button
                    QuickStartButton(onPressed: onStartMeasurement),
                    const SizedBox(height: 20),

                    // Tips Preview
                    TipsPreviewCard(onViewAllTips: onViewAllTips),
                  ],
                ),
              ),
            ),
    );
  }
}
