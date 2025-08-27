import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'viewmodels/blood_oxygen_view_model.dart';
import 'components/blood_oxygen_stats.dart';
import 'components/blood_oxygen_history.dart';
import 'components/blood_oxygen_toggle_buttons.dart';
import 'components/blood_oxygen_chart.dart';

class BloodOxygenScreen extends StatefulWidget {
  const BloodOxygenScreen({super.key});

  @override
  State<BloodOxygenScreen> createState() => _BloodOxygenScreenState();
}

class _BloodOxygenScreenState extends State<BloodOxygenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.pop(),
        ),
        title: Text('Blood Oxygen'),
        centerTitle: true,
      ),
      body: Consumer<BloodOxygenViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return RefreshIndicator(
            onRefresh: viewModel.load,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with decorative elements
                  Text(
                    'Lifetime average summary',
                    style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                  ),

                  SizedBox(height: 1.5.h),

                  // Statistics section
                  const BloodOxygenStats(),

                  SizedBox(height: 2.h),

                  // Toggle buttons
                  const BloodOxygenToggleButtons(),

                  SizedBox(height: 2.h),

                  // Content based on selected view
                  if (viewModel.showStatistics) ...[
                    const BloodOxygenChart(),
                  ] else ...[
                    const BloodOxygenHistory(),
                  ],

                  SizedBox(height: 10.h), // Space for FAB (prevents jumps)
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.push('/blood-oxygen/input');
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
    );
  }
}
