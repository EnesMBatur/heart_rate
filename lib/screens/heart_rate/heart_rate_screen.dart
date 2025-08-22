import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'viewmodels/heart_rate_view_model.dart';
import 'components/heart_rate_header.dart';
import 'components/heart_rate_stats.dart';
import 'components/heart_rate_chart.dart';
import 'components/heart_rate_history.dart';
import 'components/heart_rate_toggle_buttons.dart';

class HeartRateScreen extends StatefulWidget {
  const HeartRateScreen({super.key});

  @override
  State<HeartRateScreen> createState() => _HeartRateScreenState();
}

class _HeartRateScreenState extends State<HeartRateScreen> {
  late HeartRateViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HeartRateViewModel();
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
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: const HeartRateHeader(),
        body: Consumer<HeartRateViewModel>(
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
                padding: EdgeInsets.all(4.w),
                child: Column(
                  children: [
                    // Statistics Summary
                    const HeartRateStats(),

                    SizedBox(height: 2.h),

                    // Toggle Buttons (Statistics/History)
                    const HeartRateToggleButtons(),

                    SizedBox(height: 2.h),

                    // Content based on selected view
                    if (viewModel.showStatistics) ...[
                      // Chart View
                      const HeartRateChart(),
                    ] else ...[
                      // History List View
                      const HeartRateHistory(),
                    ],

                    SizedBox(height: 2.h), // Space for FAB
                  ],
                ),
              ),
            );
          },
        ),
        // floatingActionButton: FloatingActionButton.extended(
        //   onPressed: () {
        //     context.push('/measure');
        //   },
        //   backgroundColor: const Color(0xFFFF6B6B),
        //   icon: const Icon(Icons.favorite, color: Colors.white),
        //   label: Text(
        //     'Measure',
        //     style: TextStyle(
        //       color: Colors.white,
        //       fontSize: 16.sp,
        //       fontWeight: FontWeight.w600,
        //     ),
        //   ),
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
