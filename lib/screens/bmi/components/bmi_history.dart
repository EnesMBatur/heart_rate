import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/bmi_record.dart';
import '../viewmodels/bmi_view_model.dart';

class BMIHistory extends StatelessWidget {
  const BMIHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BMIViewModel>(
      builder: (context, vm, child) {
        if (vm.records.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Icon(Icons.timeline, size: 64, color: Colors.grey[400]),
                SizedBox(height: 2.h),
                Text(
                  'No measurements yet',
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  'Start by adding your first BMI record',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                ),
                SizedBox(height: 10.h),
              ],
            ),
          );
        }

        return Column(
          children: vm.records.map((r) => _tile(context, vm, r)).toList(),
        );
      },
    );
  }

  Widget _tile(BuildContext context, BMIViewModel vm, BMIRecord r) {
    return Container(
      margin: EdgeInsets.only(bottom: 1.5.h),
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
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${r.weightKg.toStringAsFixed(1)} kg',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 0.5.h),
                Text(
                  'BMI: ${r.bmi.toStringAsFixed(1)}',
                  style: TextStyle(fontSize: 16.sp, color: Colors.grey[600]),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.6.h),
            decoration: BoxDecoration(
              color: r.category.color.withOpacity(0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              r.category.displayName,
              style: TextStyle(
                color: r.category.color,
                fontWeight: FontWeight.w600,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
