import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../router/app_router.dart';
import 'viewmodels/home_view_model.dart';
import 'components/home_header.dart';
import 'components/health_cards_grid.dart';
import 'components/check_up_history_section.dart';
import '../../services/event_bus.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  late HomeViewModel _viewModel;
  StreamSubscription<String>? _eventSubscription;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.initialize();
    });

    // Listen for data changes from all modules
    _eventSubscription = EventBus().events.listen((event) {
      if (event == Events.heartRateDataChanged ||
          event == Events.bloodOxygenDataChanged ||
          event == Events.bloodPressureDataChanged ||
          event == Events.bloodSugarDataChanged ||
          event == Events.bmiDataChanged) {
        _viewModel.refresh();
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _eventSubscription?.cancel();
    _viewModel.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // App resumed, refresh all data including last measurement
      _viewModel.refresh();
    }
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
                      bloodOxygenRecords: viewModel.bloodOxygenRecords,
                      onHeartRatePressed: _onHeartRateMeasurePressed,
                      onHeartRateTrackerPressed: _onHeartRateTrackerPressed,
                      onBloodPressurePressed: _onBloodPressurePressed,
                      onBloodSugarPressed: _onBloodSugarPressed,
                      onWeightBmiPressed: _onWeightBmiPressed,
                      onAiDoctorPressed: _onAiDoctorPressed,
                      onBloodOxygenPressed: _onBloodOxygenPressed,
                      onRecipesPressed: _onRecipesPressed,
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

  void _onHeartRateMeasurePressed() {
    context.push(AppRouter.measure).then((_) {
      // Update data when returning from measure screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onHeartRateTrackerPressed() {
    context.push(AppRouter.heartRateTracker).then((_) {
      // Update data when returning from heart rate tracker screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onBloodPressurePressed() {
    context.push(AppRouter.bloodPressure).then((_) {
      // Update data when returning from blood pressure screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onBloodSugarPressed() {
    context.push(AppRouter.bloodSugar).then((_) {
      // Update data when returning from blood sugar screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onWeightBmiPressed() {
    context.push(AppRouter.bmi).then((_) {
      // Update data when returning from BMI screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onAiDoctorPressed() {
    context.push(AppRouter.aiDoctor);
  }

  void _onBloodOxygenPressed() {
    context.push(AppRouter.bloodOxygen).then((_) {
      // Update data when returning from blood oxygen screen
      _viewModel.updateRecordCounts();
    });
  }

  void _onRecipesPressed() {
    context.push(AppRouter.recipes);
  }

  void _onViewAllHistoryPressed() {
    context.push(AppRouter.heartRateTracker);
  }
}
