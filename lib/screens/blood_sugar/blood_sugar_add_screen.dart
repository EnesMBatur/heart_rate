// lib/features/blood_sugar/add/blood_sugar_add_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:intl/intl.dart';

import '../../models/blood_sugar_measurement.dart';
import 'viewmodels/blood_sugar_add_view_model.dart';
import 'viewmodels/blood_sugar_view_model.dart';

class BloodSugarAddScreen extends StatefulWidget {
  final BloodSugarMeasurement? measurement;

  const BloodSugarAddScreen({super.key, this.measurement});

  @override
  State<BloodSugarAddScreen> createState() => _BloodSugarAddScreenState();
}

class _BloodSugarAddScreenState extends State<BloodSugarAddScreen> {
  late BloodSugarAddViewModel _viewModel;

  // Kalıcı wheel controller'ları
  late FixedExtentScrollController _mainCtrl;
  late FixedExtentScrollController _decCtrl;

  String _lastUnit = 'mg/dL';

  @override
  void initState() {
    super.initState();
    _viewModel = BloodSugarAddViewModel();
    if (widget.measurement != null) {
      _viewModel.setEditingMeasurement(widget.measurement!);
    }

    // Başlangıç indexlerini hesapla ve controller'ları oluştur
    final initialMainIndex = _computeMainIndex(_viewModel);
    final initialDecIndex = _computeDecimalIndex(_viewModel);

    _mainCtrl = FixedExtentScrollController(initialItem: initialMainIndex);
    _decCtrl = FixedExtentScrollController(initialItem: initialDecIndex);

    _lastUnit = _viewModel.selectedUnit;
  }

  @override
  void dispose() {
    _mainCtrl.dispose();
    _decCtrl.dispose();
    _viewModel.dispose();
    super.dispose();
  }

  // Mevcut VM değerlerinden wheel indexlerini üret
  int _computeMainIndex(BloodSugarAddViewModel vm) {
    final totalTenths = (vm.bloodSugarValue * 10).round();
    final mainValue = totalTenths ~/ 10;

    final min = vm.selectedUnit == 'mg/dL' ? 50 : 3;
    final max = vm.selectedUnit == 'mg/dL' ? 400 : 22;

    return (mainValue.clamp(min, max) - min);
  }

  int _computeDecimalIndex(BloodSugarAddViewModel vm) {
    final totalTenths = (vm.bloodSugarValue * 10).round();
    return totalTenths % 10;
  }

  // Birim değişince wheel'ları doğru item'a taşı
  void _syncControllersToModel(BloodSugarAddViewModel vm, {bool jump = true}) {
    final targetMain = _computeMainIndex(vm);
    final targetDec = _computeDecimalIndex(vm);

    if (jump) {
      _mainCtrl.jumpToItem(targetMain);
      _decCtrl.jumpToItem(targetDec);
    } else {
      _mainCtrl.animateToItem(
        targetMain,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
      _decCtrl.animateToItem(
        targetDec,
        duration: const Duration(milliseconds: 150),
        curve: Curves.easeOut,
      );
    }
  }

  // Geçerli birim için min/max
  (int min, int max) _minMaxForUnit(String unit) {
    if (unit == 'mg/dL') return (50, 400);
    return (3, 22);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _viewModel,
      child: GestureDetector(
        onTap: () {
          // Klavyeyi kapat
          FocusScope.of(context).unfocus();
        },
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
              // Birim değiştiyse wheel'ları modelle senkronla
              if (_lastUnit != viewModel.selectedUnit) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  _syncControllersToModel(viewModel, jump: true);
                });
                _lastUnit = viewModel.selectedUnit;
              }

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

                    // Value Pickers (hızlı ve akıcı)
                    _buildBloodSugarInputs(viewModel),

                    SizedBox(height: 2.h),

                    // State
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
                              const Icon(
                                Icons.psychology,
                                color: Color(0xFFFF6B6B),
                              ),
                              SizedBox(width: 2.w),
                              Text(
                                'State',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          GestureDetector(
                            onTap: () =>
                                _showStateSelection(context, viewModel),
                            child: Container(
                              padding: EdgeInsets.all(3.w),
                              decoration: BoxDecoration(
                                color: Colors.grey[50],
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(color: Colors.grey[300]!),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                        ],
                      ),
                    ),

                    SizedBox(height: 2.h),

                    // Note
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
                            controller: viewModel.noteController,
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

                    // SizedBox(height: 2.h),

                    // // Ranges
                    // _buildCategoryInfo(),
                    SizedBox(height: 1.h),
                  ],
                ),
              );
            },
          ),
          bottomNavigationBar: Consumer<BloodSugarAddViewModel>(
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
                        onPressed: () => _saveMeasurement(context, viewModel),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B6B),
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          viewModel.isEditing ? 'Update' : 'Save',
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
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => Container(
        width: double.infinity,
        height: 320,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Expanded(
              child: Padding(
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
                    Expanded(
                      child: SingleChildScrollView(
                        child: Wrap(
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
                                    fontSize: 16.sp,
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
                      ),
                    ),
                    SizedBox(height: 2.h),
                  ],
                ),
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
      // Convert mmol/L to mg/dL for storage if needed
      double valueInMgDl = viewModel.selectedUnit == 'mmol/L'
          ? viewModel.bloodSugarValue / 0.0555
          : viewModel.bloodSugarValue;

      final measurement = BloodSugarMeasurement(
        id: viewModel.isEditing
            ? viewModel.editingId!
            : DateTime.now().millisecondsSinceEpoch.toString(),
        value: double.parse(valueInMgDl.toStringAsFixed(1)),
        state: viewModel.selectedState,
        timestamp: viewModel.selectedDateTime,
        note: viewModel.noteController.text.isNotEmpty
            ? viewModel.noteController.text
            : null,
      );

      // Get the main BloodSugarViewModel from the provider
      final mainViewModel = Provider.of<BloodSugarViewModel>(
        context,
        listen: false,
      );

      if (viewModel.isEditing) {
        await mainViewModel.updateMeasurement(measurement);
      } else {
        await mainViewModel.addMeasurement(measurement);
      }

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildWheel(
                isMainValue: true,
                viewModel: viewModel,
                controller: _mainCtrl,
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
              _buildWheel(
                isMainValue: false,
                viewModel: viewModel,
                controller: _decCtrl,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildWheel({
    required bool isMainValue,
    required BloodSugarAddViewModel viewModel,
    required FixedExtentScrollController controller,
  }) {
    // Görüntü amacıyla 1 ondalığa göre ayrıştır
    final totalTenths = (viewModel.bloodSugarValue * 10).round();
    final mainValue = totalTenths ~/ 10;
    final decimalValue = totalTenths % 10;

    // Min / max
    final (minValue, maxValue) = isMainValue
        ? _minMaxForUnit(viewModel.selectedUnit)
        : (0, 9);

    final initialValue = isMainValue
        ? mainValue.clamp(minValue, maxValue)
        : decimalValue;

    return SizedBox(
      width: 35.w,
      height: 15.h,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 40,
        perspective: 0.005,
        diameterRatio: 1.2,
        // 🔥 hızlı ve akıcı fling
        physics: const FixedExtentScrollPhysics(
          parent: BouncingScrollPhysics(),
        ),
        controller: controller,
        useMagnifier: true,
        magnification: 1.08,
        overAndUnderCenterOpacity: 0.6,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: maxValue - minValue + 1,
          builder: (context, index) {
            final value = minValue + index;
            // (Seçili item vurgusunu istersen koruyabilirsin; burada sade tuttuk)
            return Container(
              alignment: Alignment.center,
              child: Text(
                value.toString(),
                style: TextStyle(
                  fontSize: value == initialValue ? 24.sp : 18.sp,
                  fontWeight: value == initialValue
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: value == initialValue
                      ? const Color(0xFFFF6B6B)
                      : Colors.grey[700],
                ),
              ),
            );
          },
        ),
        onSelectedItemChanged: (index) {
          final selectedValue = minValue + index;

          // Diğer kısmı controller'dan al (senkron ve hızlı)
          if (isMainValue) {
            final otherIndex = _decCtrl.selectedItem; // 0..9
            final newValue = selectedValue + (otherIndex / 10.0);
            viewModel.setBloodSugarValue(newValue);
          } else {
            final (mainMin, _) = _minMaxForUnit(viewModel.selectedUnit);
            final otherIndex = _mainCtrl.selectedItem; // 0..range
            final currentMain = mainMin + otherIndex;
            final newValue = currentMain + (selectedValue / 10.0);
            viewModel.setBloodSugarValue(newValue);
          }
          // Not: Burada controller'ları yeniden konumlandırmıyoruz; kullanıcı sürüklüyor.
        },
      ),
    );
  }
}
