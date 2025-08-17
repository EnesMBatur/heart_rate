import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../models/blood_pressure_measurement.dart';
import 'viewmodels/blood_pressure_view_model.dart';

class AddBloodPressureScreen extends StatefulWidget {
  const AddBloodPressureScreen({super.key});

  @override
  State<AddBloodPressureScreen> createState() => _AddBloodPressureScreenState();
}

class _AddBloodPressureScreenState extends State<AddBloodPressureScreen> {
  final TextEditingController _systolicController = TextEditingController(
    text: '106',
  );
  final TextEditingController _diastolicController = TextEditingController(
    text: '74',
  );
  final TextEditingController _pulseController = TextEditingController(
    text: '75',
  );
  final TextEditingController _noteController = TextEditingController();

  DateTime _selectedDateTime = DateTime.now();

  @override
  void dispose() {
    _systolicController.dispose();
    _diastolicController.dispose();
    _pulseController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          'Add New Record',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: _selectDateTime,
            child: Row(
              children: [
                Text(
                  DateFormat('MMM dd • h:mm a').format(_selectedDateTime),
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                ),
                const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                SizedBox(width: 3.w),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(6.w),
        child: Column(
          children: [
            // Blood pressure input section
            _buildBloodPressureInputs(),

            SizedBox(height: 4.h),

            // Note section
            _buildNoteSection(),

            SizedBox(height: 4.h),

            // Category indicator
            _buildCategoryIndicator(),

            SizedBox(height: 8.h),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(6.w),
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey, width: 0.2)),
        ),
        child: Row(
          children: [
            Expanded(
              child: OutlinedButton(
                onPressed: () => context.pop(),
                style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: ElevatedButton(
                onPressed: _saveMeasurement,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF6B6B),
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  'Save',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBloodPressureInputs() {
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
        children: [
          // Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildLabel('Systolic'),
              _buildLabel('Diastolic'),
              _buildLabel('Pulse'),
            ],
          ),
          SizedBox(height: 3.h),

          // Picker wheels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPicker(
                initialValue: int.tryParse(_systolicController.text) ?? 120,
                minValue: 80,
                maxValue: 200,
                onChanged: (value) {
                  _systolicController.text = value.toString();
                },
              ),
              _buildPicker(
                initialValue: int.tryParse(_diastolicController.text) ?? 80,
                minValue: 40,
                maxValue: 120,
                onChanged: (value) {
                  _diastolicController.text = value.toString();
                },
              ),
              _buildPicker(
                initialValue: int.tryParse(_pulseController.text) ?? 75,
                minValue: 40,
                maxValue: 200,
                onChanged: (value) {
                  _pulseController.text = value.toString();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPicker({
    required int initialValue,
    required int minValue,
    required int maxValue,
    required ValueChanged<int> onChanged,
  }) {
    return SizedBox(
      width: 25.w,
      height: 15.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final value = minValue + index;
            final isSelected = value == initialValue;

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
          final value = minValue + index;
          onChanged(value);
          setState(() {});
        },
      ),
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

  Widget _buildNoteSection() {
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
          TextField(
            controller: _noteController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Add your note here ...',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIndicator() {
    final systolic = int.tryParse(_systolicController.text) ?? 0;
    final diastolic = int.tryParse(_diastolicController.text) ?? 0;
    final category = BloodPressureMeasurement.calculateCategory(
      systolic,
      diastolic,
    );

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
            category.displayName,
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
              final isSelected = cat == category;
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

  void _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
      );

      if (time != null) {
        setState(() {
          _selectedDateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );
        });
      }
    }
  }

  void _saveMeasurement() {
    final systolic = int.tryParse(_systolicController.text);
    final diastolic = int.tryParse(_diastolicController.text);
    final pulse = int.tryParse(_pulseController.text);

    if (systolic == null || diastolic == null || pulse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter valid numbers')),
      );
      return;
    }

    final measurement = BloodPressureMeasurement(
      systolic: systolic,
      diastolic: diastolic,
      pulse: pulse,
      timestamp: _selectedDateTime,
      state: 'Normal',
      gender: 'Unknown',
      age: 25,
      note: _noteController.text.isNotEmpty ? _noteController.text : null,
      category: BloodPressureMeasurement.calculateCategory(systolic, diastolic),
    );

    // Save through Provider
    final viewModel = Provider.of<BloodPressureViewModel>(
      context,
      listen: false,
    );
    viewModel
        .addMeasurement(measurement)
        .then((_) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Blood pressure saved successfully!')),
          );
          context.pop();
        })
        .catchError((error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving measurement: $error')),
          );
        });
  }
}
