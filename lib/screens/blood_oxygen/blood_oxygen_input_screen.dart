import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../models/blood_oxygen_record.dart';
import 'viewmodels/blood_oxygen_view_model.dart';

class BloodOxygenInputScreen extends StatefulWidget {
  const BloodOxygenInputScreen({super.key});

  @override
  State<BloodOxygenInputScreen> createState() => _BloodOxygenInputScreenState();
}

class _BloodOxygenInputScreenState extends State<BloodOxygenInputScreen> {
  int _spO2 = 95; // Default value
  final TextEditingController _noteController = TextEditingController();

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BloodOxygenViewModel(),
      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),
        appBar: AppBar(
          title: const Text(
            'Blood Oxygen (SpO2)',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        body: Consumer<BloodOxygenViewModel>(
          builder: (context, viewModel, child) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  SizedBox(height: 2.h),

                  // Header Info
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
                      children: [
                        Icon(
                          Icons.bloodtype,
                          size: 48,
                          color: BloodOxygenCategory.fromSpO2(_spO2).color,
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          'Blood Oxygen Level',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 1.h),
                        Text(
                          'Normal range: 95-100%',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // SpO2 Picker
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
                      children: [
                        Text(
                          'Select SpO2 Level',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 2.h),

                        // Current value display
                        Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 2.h,
                          ),
                          decoration: BoxDecoration(
                            color: BloodOxygenCategory.fromSpO2(
                              _spO2,
                            ).color.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: BloodOxygenCategory.fromSpO2(_spO2).color,
                              width: 2,
                            ),
                          ),
                          child: Column(
                            children: [
                              Text(
                                '$_spO2%',
                                style: TextStyle(
                                  fontSize: 32.sp,
                                  fontWeight: FontWeight.bold,
                                  color: BloodOxygenCategory.fromSpO2(
                                    _spO2,
                                  ).color,
                                ),
                              ),
                              Text(
                                BloodOxygenCategory.fromSpO2(_spO2).displayName,
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w600,
                                  color: BloodOxygenCategory.fromSpO2(
                                    _spO2,
                                  ).color,
                                ),
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 3.h),

                        // Slider
                        Column(
                          children: [
                            Text(
                              'Adjust SpO2 Level',
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.grey[600],
                              ),
                            ),
                            SizedBox(height: 1.h),
                            Slider(
                              value: _spO2.toDouble(),
                              min: 1,
                              max: 100,
                              divisions: 99,
                              activeColor: BloodOxygenCategory.fromSpO2(
                                _spO2,
                              ).color,
                              inactiveColor: Colors.grey[300],
                              onChanged: (value) {
                                setState(() {
                                  _spO2 = value.round();
                                });
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '1%',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.grey[600],
                                    ),
                                  ),
                                  Text(
                                    '100%',
                                    style: TextStyle(
                                      fontSize: 12.sp,
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
                  ),

                  SizedBox(height: 3.h),

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
                        Text(
                          'Note (Optional)',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[800],
                          ),
                        ),
                        SizedBox(height: 1.h),
                        TextField(
                          controller: _noteController,
                          decoration: InputDecoration(
                            hintText: 'Add any additional notes...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(color: Colors.grey[300]!),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: BorderSide(
                                color: BloodOxygenCategory.fromSpO2(
                                  _spO2,
                                ).color,
                              ),
                            ),
                          ),
                          maxLines: 3,
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 4.h),

                  // Save Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: viewModel.isLoading
                          ? null
                          : () => _saveRecord(viewModel),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: BloodOxygenCategory.fromSpO2(
                          _spO2,
                        ).color,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 2,
                      ),
                      child: viewModel.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : Text(
                              'Save Record',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                    ),
                  ),

                  SizedBox(height: 2.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _saveRecord(BloodOxygenViewModel viewModel) async {
    final record = BloodOxygenRecord.create(
      spO2: _spO2,
      note: _noteController.text.trim().isEmpty
          ? null
          : _noteController.text.trim(),
    );

    await viewModel.add(record);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Blood oxygen record saved ($_spO2%)'),
          backgroundColor: BloodOxygenCategory.fromSpO2(_spO2).color,
        ),
      );
      Navigator.of(context).pop();
    }
  }
}
