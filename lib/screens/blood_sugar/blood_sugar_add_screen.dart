import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import '../../models/blood_sugar_measurement.dart';
import 'viewmodels/blood_sugar_add_view_model.dart';

class BloodSugarAddScreen extends StatefulWidget {
  final BloodSugarMeasurement? measurement;

  const BloodSugarAddScreen({super.key, this.measurement});

  @override
  State<BloodSugarAddScreen> createState() => _BloodSugarAddScreenState();
}

class _BloodSugarAddScreenState extends State<BloodSugarAddScreen> {
  late BloodSugarAddViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BloodSugarAddViewModel();
    if (widget.measurement != null) {
      _viewModel.setEditingMeasurement(widget.measurement!);
    }
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
          title: Consumer<BloodSugarAddViewModel>(
            builder: (context, viewModel, child) {
              return Text(
                viewModel.isEditing ? 'Edit' : 'Add',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              );
            },
          ),
          centerTitle: true,
        ),
        body: Consumer<BloodSugarAddViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date and Time Selector
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => _selectDateTime(context, viewModel),
                          child: Row(
                            children: [
                              Text(
                                DateFormat(
                                  'MMM dd, yyyy • h:mm a',
                                ).format(viewModel.selectedDateTime),
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              SizedBox(width: 2.w),
                              Icon(
                                Icons.keyboard_arrow_down,
                                color: const Color(0xFFFF6B6B),
                                size: 24,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 2.h),

                  // Unit Toggle
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => viewModel.setUnit('mg/dL'),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            decoration: BoxDecoration(
                              color: viewModel.selectedUnit == 'mg/dL'
                                  ? const Color(0xFFFF6B6B)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'mg/dL',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: viewModel.selectedUnit == 'mg/dL'
                                      ? Colors.white
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => viewModel.setUnit('mmol/L'),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                            decoration: BoxDecoration(
                              color: viewModel.selectedUnit == 'mmol/L'
                                  ? const Color(0xFFFF6B6B)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'mmol/L',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: viewModel.selectedUnit == 'mmol/L'
                                      ? Colors.white
                                      : Colors.grey[600],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 2.h),

                  // Blood Sugar Value Input
                  _buildBloodSugarInputs(viewModel),

                  SizedBox(height: 2.h),

                  // State Selection
                  _buildSectionTitle('State'),
                  SizedBox(height: 1.h),
                  GestureDetector(
                    onTap: () => _showStateSelection(context, viewModel),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModel.selectedState.displayName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // Gender Selection
                  _buildSectionTitle('Gender'),
                  SizedBox(height: 1.h),
                  GestureDetector(
                    onTap: () => _showGenderSelection(context, viewModel),
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            viewModel.selectedGender,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.grey[600],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // Age Selection
                  _buildSectionTitle('Age'),
                  SizedBox(height: 1.h),
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          viewModel.selectedAge.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () =>
                                  viewModel.setAge(viewModel.selectedAge - 1),
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () =>
                                  viewModel.setAge(viewModel.selectedAge + 1),
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // Note Section
                  _buildSectionTitle('Note'),
                  SizedBox(height: 1.h),
                  Container(
                    padding: EdgeInsets.all(4.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: TextField(
                      controller: viewModel.noteController,
                      maxLines: 3,
                      decoration: InputDecoration(
                        hintText: 'Add your note here ...',
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[400]),
                      ),
                      style: TextStyle(fontSize: 14.sp),
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // Blood Sugar Category Info
                  _buildCategoryInfo(),

                  SizedBox(height: 5.h),

                  // Save and Cancel Buttons
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => context.pop(),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            side: const BorderSide(color: Color(0xFFFF6B6B)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFFFF6B6B),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () => _saveMeasurement(context, viewModel),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF6B6B),
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 3.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Row(
      children: [
        Icon(
          Icons.fiber_manual_record,
          color: const Color(0xFFFF6B6B),
          size: 12,
        ),
        SizedBox(width: 2.w),
        Text(
          title,
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryInfo() {
    return Container(
      padding: EdgeInsets.all(4.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF4ECDC4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Low',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '< 72',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF45B7D1),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Normal',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '72 - 99',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF9500),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pre-diabetes',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '99 - 126',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B6B),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(width: 3.w),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Diabetes',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '> 126',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDateTime(
    BuildContext context,
    BloodSugarAddViewModel viewModel,
  ) async {
    final date = await showDatePicker(
      context: context,
      initialDate: viewModel.selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(viewModel.selectedDateTime),
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        viewModel.setDateTime(newDateTime);
      }
    }
  }

  void _showStateSelection(
    BuildContext context,
    BloodSugarAddViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'State',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Wrap(
                    spacing: 2.w,
                    runSpacing: 1.h,
                    children: BloodSugarState.values.map((state) {
                      final isSelected = viewModel.selectedState == state;
                      return GestureDetector(
                        onTap: () {
                          viewModel.setState(state);
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 4.w,
                            vertical: 1.h,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFFF6B6B)
                                : Colors.grey[100],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            state.displayName,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: isSelected
                                  ? Colors.white
                                  : Colors.grey[700],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showGenderSelection(
    BuildContext context,
    BloodSugarAddViewModel viewModel,
  ) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    'Gender',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.setGender('Male');
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            decoration: BoxDecoration(
                              color: viewModel.selectedGender == 'Male'
                                  ? const Color(0xFFFF6B6B)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: viewModel.selectedGender == 'Male'
                                      ? Colors.white
                                      : Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            viewModel.setGender('Female');
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            decoration: BoxDecoration(
                              color: viewModel.selectedGender == 'Female'
                                  ? const Color(0xFFFF6B6B)
                                  : Colors.grey[100],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: viewModel.selectedGender == 'Female'
                                      ? Colors.white
                                      : Colors.grey[700],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _saveMeasurement(
    BuildContext context,
    BloodSugarAddViewModel viewModel,
  ) async {
    try {
      await viewModel.saveMeasurement();
      if (context.mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              viewModel.isEditing
                  ? 'Measurement updated successfully'
                  : 'Measurement saved successfully',
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving measurement: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildBloodSugarInputs(BloodSugarAddViewModel viewModel) {
    return Container(
      padding: EdgeInsets.all(2.w),
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
        children: [
          // // Labels
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [_buildLabel('Main'), _buildLabel('Decimal')],
          // ),

          // Picker wheels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBloodSugarPicker(isMainValue: true, viewModel: viewModel),
              Container(
                alignment: Alignment.center,
                child: Text(
                  '.',
                  style: TextStyle(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFFF6B6B),
                  ),
                ),
              ),
              _buildBloodSugarPicker(isMainValue: false, viewModel: viewModel),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBloodSugarPicker({
    required bool isMainValue,
    required BloodSugarAddViewModel viewModel,
  }) {
    // Get current values
    final currentValue = viewModel.bloodSugarValue;
    final mainValue = currentValue.floor();
    final decimalValue = ((currentValue - mainValue) * 10).round();

    // Set min/max based on unit and value type
    final int minValue;
    final int maxValue;
    final int initialValue;

    if (isMainValue) {
      if (viewModel.selectedUnit == 'mg/dL') {
        minValue = 50;
        maxValue = 400;
      } else {
        minValue = 3;
        maxValue = 22;
      }
      initialValue = mainValue;
    } else {
      minValue = 0;
      maxValue = 9;
      initialValue = decimalValue;
    }

    final initialIndex = (initialValue - minValue).clamp(
      0,
      maxValue - minValue,
    );

    return SizedBox(
      width: 35.w,
      height: 15.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        controller: FixedExtentScrollController(initialItem: initialIndex),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final value = minValue + index;

            // Check if this value is currently selected
            bool isSelected;
            if (isMainValue) {
              isSelected = value == mainValue;
            } else {
              isSelected = value == decimalValue;
            }

            return Container(
              alignment: Alignment.center,
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: isSelected ? 24.sp : 18.sp,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  color: isSelected
                      ? const Color(0xFFFF6B6B)
                      : Colors.grey[600],
                ),
              ),
            );
          },
          childCount: maxValue - minValue + 1,
        ),
        onSelectedItemChanged: (index) {
          final selectedValue = minValue + index;

          if (isMainValue) {
            // Update main value, keep decimal part
            final currentDecimal = ((currentValue - currentValue.floor()) * 10)
                .round();
            final newValue = selectedValue + (currentDecimal / 10.0);
            viewModel.setBloodSugarValue(newValue);
          } else {
            // Update decimal value, keep main part
            final currentMain = currentValue.floor();
            final newValue = currentMain + (selectedValue / 10.0);
            viewModel.setBloodSugarValue(newValue);
          }
          setState(() {});
        },
      ),
    );
  }
}
