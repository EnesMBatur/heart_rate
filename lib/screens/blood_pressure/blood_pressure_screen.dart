import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'viewmodels/blood_pressure_view_model.dart';
import 'components/blood_pressure_header.dart';
import 'components/blood_pressure_stats.dart';
import 'components/blood_pressure_chart.dart';
import 'components/blood_pressure_history.dart';
import 'components/blood_pressure_toggle_buttons.dart';

class BloodPressureScreen extends StatefulWidget {
  const BloodPressureScreen({super.key});

  @override
  State<BloodPressureScreen> createState() => _BloodPressureScreenState();
}

class _BloodPressureScreenState extends State<BloodPressureScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      appBar: const BloodPressureHeader(),
      body: Consumer<BloodPressureViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: viewModel.refresh,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  // Statistics Summary
                  const BloodPressureStats(),

                  SizedBox(height: 2.h),

                  // Toggle Buttons (Statistics/History)
                  const BloodPressureToggleButtons(),

                  SizedBox(height: 2.h),

                  // Content based on selected view
                  if (viewModel.showStatistics) ...[
                    // Chart View
                    const BloodPressureChart(),
                  ] else ...[
                    // History List View
                    const BloodPressureHistory(),
                  ],

                  SizedBox(height: 10.h), // Space for FAB
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/blood-pressure/add');
        },
        backgroundColor: const Color(0xFFFF6B6B),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
