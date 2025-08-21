import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../viewmodels/bmi_view_model.dart';

class BMIToggleButtons extends StatelessWidget {
  const BMIToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIViewModel>(
      builder: (context, vm, child) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!vm.showStatistics) vm.toggleView();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    color: vm.showStatistics
                        ? const Color(0xFFFF6B6B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: vm.showStatistics
                          ? const Color(0xFFFF6B6B)
                          : Colors.grey[300]!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Statistics',
                      style: TextStyle(
                        color: vm.showStatistics ? Colors.white : Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
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
                  if (vm.showStatistics) vm.toggleView();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    color: !vm.showStatistics
                        ? const Color(0xFFFF6B6B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: !vm.showStatistics
                          ? const Color(0xFFFF6B6B)
                          : Colors.grey[300]!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'History (${vm.totalRecords})',
                      style: TextStyle(
                        color: !vm.showStatistics ? Colors.white : Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
