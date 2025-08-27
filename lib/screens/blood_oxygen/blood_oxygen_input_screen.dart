import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import '../../models/blood_oxygen_record.dart';
import 'viewmodels/blood_oxygen_view_model.dart';

class BloodOxygenInputScreen extends StatefulWidget {
  final BloodOxygenRecord? record;

  const BloodOxygenInputScreen({super.key, this.record});

  @override
  State<BloodOxygenInputScreen> createState() => _BloodOxygenInputScreenState();
}

class _BloodOxygenInputScreenState extends State<BloodOxygenInputScreen> {
  int _spO2 = 95; // Default value
  DateTime _selectedDateTime = DateTime.now();
  final TextEditingController _noteController = TextEditingController();
  bool get _isEditing => widget.record != null;

  @override
  void initState() {
    super.initState();
    if (widget.record != null) {
      _spO2 = widget.record!.spO2;
      _selectedDateTime = widget.record!.timestamp;
      _noteController.text = widget.record!.note ?? '';
    }
  }

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: Provider.of<BloodOxygenViewModel>(context, listen: false),
      child: GestureDetector(
        onTap: () {
          // Klavyeyi kapat
          FocusScope.of(context).unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.pop(),
            ),
            title: Text(
              _isEditing ? 'Edit Blood Oxygen' : 'Add Blood Oxygen',
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
          ),
          body: Consumer<BloodOxygenViewModel>(
            builder: (context, viewModel, child) {
              return SingleChildScrollView(
                padding: EdgeInsets.all(4.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date & Time
                    Container(
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () => _selectDateTime(),
                            child: Row(
                              children: [
                                Text(
                                  DateFormat(
                                    'MMM dd, yyyy • h:mm a',
                                  ).format(_selectedDateTime),
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(width: 2.w),
                                const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xFFFF6B6B),
                                  size: 24,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h),

                    // SpO2 Picker
                    _buildSpO2Inputs(),

                    SizedBox(height: 2.h),

                    // Note Section
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.note, color: Color(0xFFFF6B6B)),
                              SizedBox(width: 2.w),
                              Text(
                                'Note',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[600],
                                ),
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
                    ),

                    SizedBox(height: 2.h),

                    // Category indicator
                    _buildCategoryIndicator(),

                    SizedBox(height: 1.h),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Consumer<BloodOxygenViewModel>(
            builder: (context, viewModel, child) {
              return Container(
                padding: EdgeInsets.all(6.w),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey, width: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => context.pop(),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          side: const BorderSide(color: Color(0xFFFF6B6B)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
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
                        onPressed: viewModel.isLoading
                            ? null
                            : () => _saveRecord(viewModel),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B6B),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: viewModel.isLoading
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                _isEditing ? 'Update' : 'Save',
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
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _saveRecord(BloodOxygenViewModel viewModel) async {
    final record = BloodOxygenRecord(
      id: _isEditing
          ? widget.record!.id
          : DateTime.now().millisecondsSinceEpoch.toString(),
      spO2: _spO2,
      timestamp: _selectedDateTime,
      category: BloodOxygenCategory.fromSpO2(_spO2),
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );

    if (_isEditing) {
      await viewModel.update(record);
    } else {
      await viewModel.add(record);
    }

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing
                ? 'Blood oxygen record updated ($_spO2%)'
                : 'Blood oxygen record saved ($_spO2%)',
          ),
          backgroundColor: const Color(0xFFFF6B6B),
        ),
      );
      context.pop();
    }
  }

  Future<void> _selectDateTime() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _selectedDateTime,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(_selectedDateTime),
        initialEntryMode: TimePickerEntryMode.input,
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

  Widget _buildSpO2Inputs() {
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
          // Label
          Text(
            'SpO2',
            style: TextStyle(fontSize: 18.sp, color: Colors.grey[600]),
          ),
          SizedBox(height: 3.h),

          // Picker wheel
          SizedBox(
            width: double.infinity,
            height: 15.h,
            child: ListWheelScrollView.useDelegate(
              itemExtent: 40,
              perspective: 0.005,
              diameterRatio: 1.2,
              physics: const FixedExtentScrollPhysics(
                parent: BouncingScrollPhysics(),
              ),
              controller: FixedExtentScrollController(initialItem: _spO2 - 1),
              useMagnifier: true,
              magnification: 1.08,
              overAndUnderCenterOpacity: 0.6,
              childDelegate: ListWheelChildBuilderDelegate(
                childCount: 100,
                builder: (context, index) {
                  final value = index + 1;
                  final category = BloodOxygenCategory.fromSpO2(value);
                  final isSelected = value == _spO2;
                  return Container(
                    alignment: Alignment.center,
                    child: Text(
                      '$value%',
                      style: TextStyle(
                        fontSize: isSelected ? 24.sp : 18.sp,
                        fontWeight: isSelected
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: isSelected ? category.color : Colors.grey[700],
                      ),
                    ),
                  );
                },
              ),
              onSelectedItemChanged: (index) {
                setState(() {
                  _spO2 = index + 1;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryIndicator() {
    final category = BloodOxygenCategory.fromSpO2(_spO2);

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
            children: BloodOxygenCategory.values.map((cat) {
              final isSelected = cat == category;
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: isSelected ? 30.w : 20.w,
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
          Column(
            children: BloodOxygenCategory.values.map((cat) {
              final isSelected = cat == category;
              return Container(
                margin: EdgeInsets.only(bottom: 1.h),
                padding: EdgeInsets.all(3.w),
                decoration: BoxDecoration(
                  color: isSelected
                      ? cat.color.withValues(alpha: 0.1)
                      : Colors.grey[50],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: isSelected ? cat.color : Colors.grey[200]!,
                    width: isSelected ? 2 : 1,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // First row: Color indicator + Name
                    Row(
                      children: [
                        Container(
                          width: 14,
                          height: 14,
                          decoration: BoxDecoration(
                            color: cat.color,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          cat.displayName,
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: isSelected ? cat.color : Colors.black87,
                          ),
                        ),
                        if (isSelected) ...[
                          const Spacer(),
                          Icon(Icons.check_circle, color: cat.color, size: 20),
                        ],
                      ],
                    ),
                    SizedBox(height: 0.5.h),
                    // Second row: Description
                    Text(
                      _getCategoryDescription(cat),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  String _getCategoryDescription(BloodOxygenCategory category) {
    switch (category) {
      case BloodOxygenCategory.normal:
        return 'Normal oxygen saturation level (95-100%)';
      case BloodOxygenCategory.concerning:
        return 'Below normal, may indicate mild hypoxemia (90-94%)';
      case BloodOxygenCategory.low:
        return 'Low oxygen level, seek medical attention (0-89%)';
    }
  }
}
