import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
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
                  LocaleKeys.general_no_measurements_yet.tr(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 1.h),
                Text(
                  LocaleKeys.bmi_start_adding_records.tr(),
                  textAlign: TextAlign.center,
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
              LocaleKeys.actions_delete.tr(),
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
              title: Text(LocaleKeys.bmi_delete_confirmation.tr()),
              content: Text(
                '${LocaleKeys.bmi_delete_confirmation_message.tr()}\n\n'
                '${LocaleKeys.bmi_weight.tr()}: ${r.weightKg.toStringAsFixed(1)} kg\n'
                '${LocaleKeys.bmi_title.tr()}: ${r.bmi.toStringAsFixed(1)}\n'
                '${LocaleKeys.bmi_category.tr()}: ${r.category.localizedName}',
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text(LocaleKeys.actions_cancel.tr()),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  style: TextButton.styleFrom(foregroundColor: Colors.red),
                  child: Text(LocaleKeys.actions_delete.tr()),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        vm.deleteRecord(r);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(LocaleKeys.bmi_record_deleted.tr()),
            backgroundColor: Colors.red,
          ),
        );
      },
      child: Container(
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
                    '${LocaleKeys.bmi_title.tr()}: ${r.bmi.toStringAsFixed(1)}',
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
                r.category.localizedName,
                style: TextStyle(
                  color: r.category.color,
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
