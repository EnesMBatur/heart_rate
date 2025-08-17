import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../router/app_router.dart';
import 'viewmodels/home_view_model.dart';
import 'components/home_header.dart';
import 'components/health_cards_grid.dart';
import 'components/check_up_history_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.initialize();
    });
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: HomeAppBar(onProButtonPressed: _onProButtonPressed),
        body: Consumer<HomeViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFFF6B6B)),
              );
            }

            return RefreshIndicator(
              onRefresh: viewModel.refresh,
              color: const Color(0xFFFF6B6B),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Health Cards Grid
                    HealthCardsGrid(
                      heartRateRecords: viewModel.heartRateRecords,
                      bloodPressureRecords: viewModel.bloodPressureRecords,
                      bloodSugarRecords: viewModel.bloodSugarRecords,
                      weightBmiRecords: viewModel.weightBmiRecords,
                      onHeartRatePressed: _onHeartRatePressed,
                      onBloodPressurePressed: _onBloodPressurePressed,
                      onBloodSugarPressed: _onBloodSugarPressed,
                      onWeightBmiPressed: _onWeightBmiPressed,
                      onAiDoctorPressed: _onAiDoctorPressed,
                    ),

                    SizedBox(height: 2.h),

                    // Check Up History Section
                    CheckUpHistorySection(
                      lastMeasurement: viewModel.lastMeasurement,
                      onViewAllPressed: _onViewAllHistoryPressed,
                    ),

                    // Bottom padding for better scrolling
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void _onProButtonPressed() {
    // TODO: Navigate to PRO/Premium screen
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('PRO features coming soon!'),
        backgroundColor: Color(0xFFFF6B6B),
      ),
    );
  }

  void _onHeartRatePressed() {
    context.go(AppRouter.measure);
  }

  void _onBloodPressurePressed() {
    // TODO: Navigate to blood pressure measurement
    _showFeatureComingSoon('Blood Pressure measurement');
  }

  void _onBloodSugarPressed() {
    // TODO: Navigate to blood sugar measurement
    _showFeatureComingSoon('Blood Sugar measurement');
  }

  void _onWeightBmiPressed() {
    // TODO: Navigate to weight & BMI measurement
    _showFeatureComingSoon('Weight & BMI measurement');
  }

  void _onAiDoctorPressed() {
    // TODO: Navigate to AI Doctor chat
    _showFeatureComingSoon('AI Doctor chat');
  }

  void _onViewAllHistoryPressed() {
    context.go(AppRouter.history);
  }

  void _showFeatureComingSoon(String featureName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$featureName coming soon!'),
        backgroundColor: const Color(0xFFFF6B6B),
      ),
    );
  }
}
