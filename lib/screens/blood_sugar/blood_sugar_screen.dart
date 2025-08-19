import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'viewmodels/blood_sugar_view_model.dart';
import 'components/blood_sugar_stats.dart';
import 'components/blood_sugar_history.dart';
import 'components/blood_sugar_toggle_buttons.dart';
import 'components/blood_sugar_chart.dart';

class BloodSugarScreen extends StatefulWidget {
  const BloodSugarScreen({super.key});

  @override
  State<BloodSugarScreen> createState() => _BloodSugarScreenState();
}

class _BloodSugarScreenState extends State<BloodSugarScreen> {
  late BloodSugarViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BloodSugarViewModel();
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
        appBar: AppBar(
          backgroundColor: const Color(0xFFF8F9FA),
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => context.pop(),
          ),
          title: Text(
            'Blood Sugar',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        body: Consumer<BloodSugarViewModel>(
          builder: (context, viewModel, child) {
            if (viewModel.isLoading) {
              return const Center(
                child: CircularProgressIndicator(color: Color(0xFFFF6B6B)),
              );
            }

            return RefreshIndicator(
              onRefresh: viewModel.loadMeasurements,
              color: const Color(0xFFFF6B6B),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: EdgeInsets.all(4.w),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with decorative elements
                    Text(
                      'Lifetime average summary',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),

                    SizedBox(height: 1.5.h),

                    // Statistics section
                    const BloodSugarStats(),

                    SizedBox(height: 2.h),

                    // Toggle buttons
                    const BloodSugarToggleButtons(),

                    SizedBox(height: 2.h),

                    // Content based on toggle
                    viewModel.showStatistics
                        ? const BloodSugarChart()
                        : const BloodSugarHistory(),

                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            context.push('/blood-sugar/add');
          },
          backgroundColor: const Color(0xFFFF6B6B),
          foregroundColor: Colors.white,
          icon: const Icon(Icons.add),
          label: const Text(
            'Add',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
