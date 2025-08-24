import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../models/blood_oxygen_record.dart';
import '../viewmodels/blood_oxygen_view_model.dart';

class BloodOxygenHistory extends StatelessWidget {
  const BloodOxygenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<BloodOxygenViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.records.isEmpty) {
          return Center(
            child: Column(
              children: [
                SizedBox(height: 10.h),
                Icon(
                  Icons.bloodtype_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
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
                  'Tap the + button to add your first measurement',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[500]),
                ),
              ],
            ),
          );
        }

        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: viewModel.records.length,
          separatorBuilder: (context, index) => SizedBox(height: 2.h),
          itemBuilder: (context, index) {
            final record = viewModel.records[index];
            return _buildHistoryItem(context, record, viewModel);
          },
        );
      },
    );
  }

  Widget _buildHistoryItem(
    BuildContext context,
    BloodOxygenRecord record,
    BloodOxygenViewModel viewModel,
  ) {
    final dateFormatter = DateFormat('MMM dd, yyyy');
    final timeFormatter = DateFormat('h:mm a');

    return Dismissible(
      key: Key(record.id),
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
              title: const Text('Delete Measurement'),
              content: Text(
                'Are you sure you want to delete this blood oxygen measurement?\n\n${record.spO2}% - ${dateFormatter.format(record.timestamp)}',
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
        viewModel.deleteRecord(record);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Measurement deleted'),
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Undo',
              textColor: Colors.white,
              onPressed: () {
                viewModel.add(record);
              },
            ),
          ),
        );
      },
      child: GestureDetector(
        onTap: () {
          // Edit modunda açmak için record'ı parametre olarak geçir
          context.push('/blood-oxygen/input', extra: record);
        },
        onLongPress: () {
          _showOptionsBottomSheet(context, record, viewModel);
        },
        child: Container(
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
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Blood oxygen value
                    Text(
                      '${record.spO2}%',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    Text(
                      'SpO2',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // Category badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: record.category.color,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        record.category.displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),

                    // Date and time
                    Text(
                      '${dateFormatter.format(record.timestamp)} • ${timeFormatter.format(record.timestamp)}',
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey[500],
                      ),
                    ),

                    // Note if available
                    if (record.note != null) ...[
                      SizedBox(height: 0.5.h),
                      Text(
                        record.note!,
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

              // Arrow icon
              Icon(Icons.arrow_forward_ios, size: 24, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }

  void _showOptionsBottomSheet(
    BuildContext context,
    BloodOxygenRecord record,
    BloodOxygenViewModel viewModel,
  ) {
    final dateFormatter = DateFormat('MMM dd, yyyy');

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 12),
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(4.w),
              child: Column(
                children: [
                  Text(
                    '${record.spO2}%',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    dateFormatter.format(record.timestamp),
                    style: TextStyle(fontSize: 14.sp, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            context.push('/blood-oxygen/input', extra: record);
                          },
                          icon: const Icon(Icons.edit_outlined),
                          label: const Text('Edit'),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                            _deleteRecord(context, record, viewModel);
                          },
                          icon: const Icon(Icons.delete_outline),
                          label: const Text('Delete'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 1.5.h),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _deleteRecord(
    BuildContext context,
    BloodOxygenRecord record,
    BloodOxygenViewModel viewModel,
  ) {
    final dateFormatter = DateFormat('MMM dd, yyyy');

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Measurement'),
          content: Text(
            'Are you sure you want to delete this blood oxygen measurement?\n\n${record.spO2}% - ${dateFormatter.format(record.timestamp)}',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                viewModel.deleteRecord(record);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text('Measurement deleted'),
                    backgroundColor: Colors.red,
                    action: SnackBarAction(
                      label: 'Undo',
                      textColor: Colors.white,
                      onPressed: () {
                        viewModel.add(record);
                      },
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
