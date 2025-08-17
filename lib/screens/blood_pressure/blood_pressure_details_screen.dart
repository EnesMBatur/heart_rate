import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'viewmodels/blood_pressure_view_model.dart';
import '../../models/blood_pressure_measurement.dart';

class BloodPressureDetailsScreen extends StatelessWidget {
  const BloodPressureDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodPressureViewModel>(
      builder: (context, viewModel, child) {
        final measurement = viewModel.selectedMeasurement;

        if (measurement == null) {
          return Scaffold(
            appBar: AppBar(title: const Text('Details')),
            body: const Center(child: Text('No measurement selected')),
          );
        }

        return Scaffold(
          backgroundColor: Colors.grey[50],
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
            title: Text(
              'Details',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              GestureDetector(
                onTap: () => _selectDateTime(context, measurement, viewModel),
                child: Row(
                  children: [
                    Text(
                      DateFormat(
                        'MMM dd • h:mm a',
                      ).format(measurement.timestamp),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                    SizedBox(width: 3.w),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    _deleteMeasurement(context, measurement, viewModel),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(6.w),
            child: Column(
              children: [
                // Blood pressure display section
                _buildBloodPressureDisplay(measurement),

                SizedBox(height: 4.h),

                // Additional info section
                _buildAdditionalInfo(measurement),

                SizedBox(height: 4.h),

                // Note section
                _buildNoteSection(measurement),

                SizedBox(height: 4.h),

                // Category indicator
                _buildCategoryIndicator(measurement),

                SizedBox(height: 8.h),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildBloodPressureDisplay(BloodPressureMeasurement measurement) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildLabel('Systolic'),
            _buildLabel('Diastolic'),
            _buildLabel('Pulse'),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildValue(measurement.systolic.toString()),
            _buildValue(measurement.diastolic.toString()),
            _buildValue(measurement.pulse.toString()),
          ],
        ),
        SizedBox(height: 2.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildValue(
              (measurement.systolic + 1).toString(),
              isSecondary: true,
            ),
            _buildValue(
              (measurement.diastolic + 1).toString(),
              isSecondary: true,
            ),
            _buildValue((measurement.pulse + 1).toString(), isSecondary: true),
          ],
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return SizedBox(
      width: 25.w,
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16.sp,
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildValue(String value, {bool isSecondary = false}) {
    return SizedBox(
      width: 25.w,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSecondary ? Colors.grey[300]! : const Color(0xFFFF6B6B),
              width: 2,
            ),
          ),
        ),
        child: Text(
          value,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
            color: isSecondary ? Colors.grey[400] : const Color(0xFFFF6B6B),
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo(BloodPressureMeasurement measurement) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: _buildInfoItem(
              'State',
              measurement.state,
              Icons.accessibility,
            ),
          ),
          Container(width: 1, height: 60, color: Colors.grey[200]),
          Expanded(
            child: _buildInfoItem('Gender', measurement.gender, Icons.person),
          ),
          Container(width: 1, height: 60, color: Colors.grey[200]),
          Expanded(
            child: _buildInfoItem(
              'Age',
              measurement.age.toString(),
              Icons.cake,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFFF6B6B), size: 24),
        SizedBox(height: 1.h),
        Text(
          label,
          style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
        ),
        SizedBox(height: 0.5.h),
        Text(
          value,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Icon(Icons.edit, size: 16, color: Colors.grey[400]),
      ],
    );
  }

  Widget _buildNoteSection(BloodPressureMeasurement measurement) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.note, color: Color(0xFFFF6B6B)),
              SizedBox(width: 2.w),
              Text(
                'Note',
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Text(
            measurement.note?.isEmpty ?? true
                ? 'Add your note here ...'
                : measurement.note!,
            style: TextStyle(
              fontSize: 14.sp,
              color: measurement.note?.isEmpty ?? true
                  ? Colors.grey[400]
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIndicator(BloodPressureMeasurement measurement) {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            measurement.category.displayName,
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2.h),

          // Category color indicators
          Row(
            children: BloodPressureCategory.values.map((cat) {
              final isSelected = cat == measurement.category;
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: isSelected ? 30 : 20,
                height: 6,
                decoration: BoxDecoration(
                  color: cat.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 2.h),

          // Category descriptions
          ...BloodPressureCategory.values.map((cat) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: cat.color,
                      shape: BoxShape.circle,
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Text(
                    cat.displayName,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    cat.description,
                    style: TextStyle(fontSize: 12.sp, color: Colors.grey[600]),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  void _selectDateTime(
    BuildContext context,
    BloodPressureMeasurement measurement,
    BloodPressureViewModel viewModel,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: measurement.timestamp,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(measurement.timestamp),
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );

        final updatedMeasurement = measurement.copyWith(timestamp: newDateTime);
        await viewModel.updateMeasurement(updatedMeasurement);
        viewModel.selectMeasurement(updatedMeasurement);
      }
    }
  }

  void _deleteMeasurement(
    BuildContext context,
    BloodPressureMeasurement measurement,
    BloodPressureViewModel viewModel,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Measurement'),
        content: const Text(
          'Are you sure you want to delete this measurement?',
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              viewModel.deleteMeasurement(measurement);
              context.pop(); // Close dialog
              context.pop(); // Go back to previous screen
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
