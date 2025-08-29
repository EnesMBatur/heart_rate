import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';
import '../../models/blood_pressure_measurement.dart';
import 'viewmodels/blood_pressure_view_model.dart';

class AddBloodPressureScreen extends StatefulWidget {
  final BloodPressureMeasurement? measurement; // Edit modunda kullanılacak

  const AddBloodPressureScreen({super.key, this.measurement});

  @override
  State<AddBloodPressureScreen> createState() => _AddBloodPressureScreenState();
}

class _AddBloodPressureScreenState extends State<AddBloodPressureScreen> {
  late final TextEditingController _systolicController;
  late final TextEditingController _diastolicController;
  late final TextEditingController _pulseController;
  late final TextEditingController _noteController;
  late DateTime _selectedDateTime;

  bool get isEditMode => widget.measurement != null;

  @override
  void initState() {
    super.initState();

    // Edit modunda ise mevcut değerleri kullan, değilse default değerleri kullan
    if (isEditMode) {
      final measurement = widget.measurement!;
      _systolicController = TextEditingController(
        text: measurement.systolic.toString(),
      );
      _diastolicController = TextEditingController(
        text: measurement.diastolic.toString(),
      );
      _pulseController = TextEditingController(
        text: measurement.pulse.toString(),
      );
      _noteController = TextEditingController(text: measurement.note ?? '');
      _selectedDateTime = measurement.timestamp;
    } else {
      _systolicController = TextEditingController(text: '115');
      _diastolicController = TextEditingController(text: '75');
      _pulseController = TextEditingController(text: '75');
      _noteController = TextEditingController();
      _selectedDateTime = DateTime.now();
    }
  }

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
    return GestureDetector(
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
            isEditMode
                ? LocaleKeys.actions_edit.tr()
                : LocaleKeys.actions_add.tr(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(4.w),
          child: Column(
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
              // Blood pressure input section
              _buildBloodPressureInputs(),

              SizedBox(height: 2.h),

              // Note section
              _buildNoteSection(),

              SizedBox(height: 2.h),

              // Category indicator
              _buildCategoryIndicator(),

              SizedBox(height: 2.h),
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
                    LocaleKeys.actions_cancel.tr(),
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
                    isEditMode
                        ? LocaleKeys.actions_update.tr()
                        : LocaleKeys.actions_save.tr(),
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
              _buildLabel(LocaleKeys.blood_pressure_systolic.tr()),
              _buildLabel(LocaleKeys.blood_pressure_diastolic.tr()),
              _buildLabel(LocaleKeys.blood_pressure_pulse.tr()),
            ],
          ),
          SizedBox(height: 3.h),

          // Picker wheels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildPicker(
                initialValue: int.tryParse(_systolicController.text) ?? 115,
                minValue: 0,
                maxValue: 200,
                onChanged: (value) {
                  _systolicController.text = value.toString();
                },
              ),
              _buildPicker(
                initialValue: int.tryParse(_diastolicController.text) ?? 75,
                minValue: 0,
                maxValue: 120,
                onChanged: (value) {
                  _diastolicController.text = value.toString();
                },
              ),
              _buildPicker(
                initialValue: int.tryParse(_pulseController.text) ?? 75,
                minValue: 0,
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
            final currentSystolic =
                int.tryParse(_systolicController.text) ?? 115;
            final currentDiastolic =
                int.tryParse(_diastolicController.text) ?? 75;
            final currentPulse = int.tryParse(_pulseController.text) ?? 75;

            // Determine which picker this is and check if it's selected
            bool isSelected = false;
            if (maxValue == 200 && minValue == 0) {
              // This is systolic or pulse picker
              if (maxValue == 200 && value == currentSystolic) {
                isSelected = true; // Systolic
              } else if (value == currentPulse && minValue == 0) {
                isSelected = true; // Pulse (if it also has max 200)
              }
            } else if (maxValue == 120) {
              // This is diastolic picker
              isSelected = value == currentDiastolic;
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
                LocaleKeys.blood_pressure_note.tr(),
                style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
              ),
            ],
          ),
          SizedBox(height: 2.h),
          TextField(
            controller: _noteController,
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
                width: isSelected ? 16.w : 10.w,
                height: 6,
                decoration: BoxDecoration(
                  color: cat.color,
                  borderRadius: BorderRadius.circular(3),
                ),
              );
            }).toList(),
          ),

          SizedBox(height: 2.h),

          // Category descriptions in a beautiful card layout
          Column(
            children: BloodPressureCategory.values.map((cat) {
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
                      cat.description,
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

  void _saveMeasurement() {
    final systolic = int.tryParse(_systolicController.text);
    final diastolic = int.tryParse(_diastolicController.text);
    final pulse = int.tryParse(_pulseController.text);

    if (systolic == null || diastolic == null || pulse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            LocaleKeys.blood_pressure_please_enter_valid_numbers.tr(),
          ),
        ),
      );
      return;
    }

    final measurement = BloodPressureMeasurement(
      id: isEditMode
          ? widget.measurement!.id
          : null, // Edit modunda mevcut ID'yi koru
      systolic: systolic,
      diastolic: diastolic,
      pulse: pulse,
      timestamp: _selectedDateTime,
      state: isEditMode ? widget.measurement!.state : 'Normal',
      gender: isEditMode ? widget.measurement!.gender : 'Unknown',
      age: isEditMode ? widget.measurement!.age : 25,
      note: _noteController.text.isNotEmpty ? _noteController.text : null,
      category: BloodPressureMeasurement.calculateCategory(systolic, diastolic),
    );

    // Save through Provider
    final viewModel = Provider.of<BloodPressureViewModel>(
      context,
      listen: false,
    );

    if (isEditMode) {
      // Edit modunda güncelle
      viewModel
          .updateMeasurement(measurement)
          .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  LocaleKeys.blood_pressure_updated_successfully.tr(),
                ),
              ),
            );
            context.pop();
          })
          .catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${LocaleKeys.blood_pressure_error_updating.tr()}: $error',
                ),
              ),
            );
          });
    } else {
      // Add modunda yeni kayıt ekle
      viewModel
          .addMeasurement(measurement)
          .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  LocaleKeys.blood_pressure_saved_successfully.tr(),
                ),
              ),
            );
            context.pop();
          })
          .catchError((error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  '${LocaleKeys.blood_pressure_error_saving.tr()}: $error',
                ),
              ),
            );
          });
    }
  }
}
