import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../models/blood_oxygen_record.dart';
import '../viewmodels/blood_oxygen_view_model.dart';
import 'package:intl/intl.dart';

class BloodOxygenHistory extends StatelessWidget {
  const BloodOxygenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodOxygenViewModel>(
      builder: (context, vm, child) {
        if (vm.records.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Icon(Icons.bloodtype, size: 64, color: Colors.grey[400]),
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
                  'Tap the + button to add your first blood oxygen record',
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

  Widget _tile(
    BuildContext context,
    BloodOxygenViewModel vm,
    BloodOxygenRecord r,
  ) {
    return Dismissible(
      key: Key(r.timestamp.millisecondsSinceEpoch.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 4.w),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.delete_outline, color: Colors.white, size: 32),
            SizedBox(height: 0.5.h),
            Text(
              'Delete',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
      confirmDismiss: (direction) async {
        return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Delete Blood Oxygen Record'),
              content: Text(
                'Are you sure you want to delete this blood oxygen record?\n\n'
                'SpO2: ${r.spO2}%\n'
                'Category: ${r.category.displayName}\n'
                'Date: ${DateFormat('MMM dd, yyyy HH:mm').format(r.timestamp)}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: const Text('Delete'),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        vm.deleteRecord(r);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Blood oxygen record deleted'),
            backgroundColor: Colors.red,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 1.5.h),
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
            Container(
              width: 12.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: r.category.color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.bloodtype, color: r.category.color, size: 24),
            ),
            SizedBox(width: 4.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${r.spO2}%',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 2.w),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 2.w,
                          vertical: 0.3.h,
                        ),
                        decoration: BoxDecoration(
                          color: r.category.color.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          r.category.displayName,
                          style: TextStyle(
                            color: r.category.color,
                            fontWeight: FontWeight.w600,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 0.5.h),
                  Text(
                    DateFormat('MMM dd, yyyy • HH:mm').format(r.timestamp),
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  if (r.note != null) ...[
                    SizedBox(height: 0.5.h),
                    Text(
                      r.note!,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.grey[500],
                        fontStyle: FontStyle.italic,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
