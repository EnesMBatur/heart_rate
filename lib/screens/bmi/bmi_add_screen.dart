import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';
import 'viewmodels/bmi_add_view_model.dart';
import 'viewmodels/bmi_view_model.dart' as bmi_vm;
import '../../models/bmi_record.dart';

class BMIAddScreen extends StatefulWidget {
  final BMIRecord? record;
  const BMIAddScreen({super.key, this.record});

  @override
  State<BMIAddScreen> createState() => _BMIAddScreenState();
}

class _BMIAddScreenState extends State<BMIAddScreen> {
  late BMIAddViewModel _vm;

  @override
  void initState() {
    super.initState();
    _vm = BMIAddViewModel();
    if (widget.record != null) {
      _vm.setEditing(widget.record!);
    }
  }

  @override
  void dispose() {
    _vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _vm,
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
            title: Consumer<BMIAddViewModel>(
              builder: (context, vm, child) {
                return Text(
                  vm.isEditing
                      ? LocaleKeys.actions_edit.tr()
                      : LocaleKeys.actions_add.tr(),
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                );
              },
            ),
            centerTitle: true,
          ),
          body: Consumer<BMIAddViewModel>(
            builder: (context, vm, child) {
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
                            onTap: () => _selectDateTime(context, vm),
                            child: Row(
                              children: [
                                Text(
                                  DateFormat(
                                    'MMM dd, yyyy • h:mm a',
                                  ).format(vm.timestamp),
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

                    // Weight Input
                    _buildWeightInput(vm),

                    SizedBox(height: 2.h),

                    // Height Input
                    _buildHeightInput(vm),

                    SizedBox(height: 2.h),

                    // Note Section
                    _buildNoteSection(vm),

                    SizedBox(height: 2.h),

                    // BMI Category Display
                    _buildBMICategory(vm),

                    SizedBox(height: 1.h),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Consumer<BMIAddViewModel>(
            builder: (context, vm, child) {
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
                          LocaleKeys.actions_cancel.tr(),
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
                        onPressed: () => _saveRecord(context, vm),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B6B),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          vm.isEditing
                              ? LocaleKeys.actions_update.tr()
                              : LocaleKeys.actions_save.tr(),
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

  Future<void> _selectDateTime(BuildContext context, BMIAddViewModel vm) async {
    final date = await showDatePicker(
      context: context,
      initialDate: vm.timestamp,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );

    if (date != null) {
      final time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(vm.timestamp),
        initialEntryMode: TimePickerEntryMode.input,
      );

      if (time != null) {
        final newDateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        vm.setTimestamp(newDateTime);
      }
    }
  }

  Future<void> _saveRecord(BuildContext context, BMIAddViewModel vm) async {
    try {
      final record = vm.buildRecord();
      final mainVm = Provider.of<bmi_vm.BMIViewModel>(context, listen: false);

      // Debug: Print record info
      print(
        'BMI Add Screen - Saving record: BMI=${record.bmi}, Date=${record.timestamp}',
      );
      print('BMI Add Screen - Records before save: ${mainVm.records.length}');

      if (vm.isEditing) {
        await mainVm.update(record);
        print('BMI Add Screen - Updated record');
      } else {
        await mainVm.add(record);
        print('BMI Add Screen - Added new record');
      }

      print('BMI Add Screen - Records after save: ${mainVm.records.length}');
      print(
        'BMI Add Screen - Selected time range: ${mainVm.selectedTimeRange}',
      );

      if (context.mounted) {
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              vm.isEditing
                  ? LocaleKeys.bmi_updated_successfully.tr()
                  : LocaleKeys.bmi_saved_successfully.tr(),
            ),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error saving record: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Widget _buildWeightInput(BMIAddViewModel vm) {
    return Container(
      padding: EdgeInsets.all(2.w),
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
          // Label
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              LocaleKeys.bmi_weight.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          // Picker wheels
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPicker(
                initialValue: vm.weight.floor(),
                minValue: 30,
                maxValue: 200,
                onChanged: (value) {
                  final decimal = ((vm.weight - vm.weight.floor()) * 10)
                      .round();
                  vm.setWeight(value + (decimal / 10.0));
                },
              ),
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
              _buildPicker(
                initialValue: ((vm.weight - vm.weight.floor()) * 10).round(),
                minValue: 0,
                maxValue: 9,
                onChanged: (value) {
                  final main = vm.weight.floor();
                  vm.setWeight(main + (value / 10.0));
                },
              ),
              SizedBox(width: 4.w),
              Text(
                LocaleKeys.units_kg.tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeightInput(BMIAddViewModel vm) {
    return Container(
      padding: EdgeInsets.all(2.w),
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
          // Label
          Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h),
            child: Text(
              LocaleKeys.bmi_height.tr(),
              style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          // Picker wheels
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildPicker(
                initialValue: vm.height.floor(),
                minValue: 140,
                maxValue: 220,
                onChanged: (value) {
                  final decimal = ((vm.height - vm.height.floor()) * 10)
                      .round();
                  vm.setHeight(value + (decimal / 10.0));
                },
              ),
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
              _buildPicker(
                initialValue: ((vm.height - vm.height.floor()) * 10).round(),
                minValue: 0,
                maxValue: 9,
                onChanged: (value) {
                  final main = vm.height.floor();
                  vm.setHeight(main + (value / 10.0));
                },
              ),
              SizedBox(width: 4.w),
              Text(
                LocaleKeys.units_cm.tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600],
                ),
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
    final initialIndex = (initialValue - minValue).clamp(
      0,
      maxValue - minValue,
    );

    return SizedBox(
      width: 25.w,
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
          final selectedValue = minValue + index;
          onChanged(selectedValue);
        },
      ),
    );
  }

  Widget _buildNoteSection(BMIAddViewModel vm) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.note, color: Color(0xFFFF6B6B)),
              SizedBox(width: 2.w),
              Text(
                LocaleKeys.bmi_note.tr(),
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          TextField(
            controller: vm.noteController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: LocaleKeys.blood_sugar_add_note_hint.tr(),
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBMICategory(BMIAddViewModel vm) {
    final bmi = vm.weight / ((vm.height / 100.0) * (vm.height / 100.0));
    final record = BMIRecord(
      id: 'temp',
      weightKg: vm.weight,
      heightCm: vm.height,
      timestamp: DateTime.now(),
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
            '${record.category.localizedName} (${bmi.toStringAsFixed(1)})',
            style: TextStyle(
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 2.h),

          // Category color indicators bar
          Row(
            children: BMICategory.values.map((cat) {
              final isSelected = cat == record.category;
              return Container(
                margin: const EdgeInsets.only(right: 8),
                width: isSelected ? 12.w : 8.w,
                height: 6,
                decoration: BoxDecoration(
                  color: cat.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 2.h),

          // Category descriptions in beautiful card layout
          Column(
            children: BMICategory.values.map((cat) {
              final isSelected = cat == record.category;

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
                child: Row(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        color: cat.color,
                        shape: BoxShape.circle,
                      ),
                    ),
                    SizedBox(width: 3.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cat.localizedName,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                              color: isSelected ? cat.color : Colors.black87,
                            ),
                          ),
                          Text(
                            cat.rangeText,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.grey[600],
                              height: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (isSelected) ...[
                      Icon(Icons.check_circle, color: cat.color, size: 20),
                    ],
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
