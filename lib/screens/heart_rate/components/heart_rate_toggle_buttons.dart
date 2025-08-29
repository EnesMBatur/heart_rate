import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../locale/lang/locale_keys.g.dart';
import '../viewmodels/heart_rate_view_model.dart';

class HeartRateToggleButtons extends StatelessWidget {
  const HeartRateToggleButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HeartRateViewModel>(
      builder: (context, viewModel, child) {
        return Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  if (!viewModel.showStatistics) {
                    viewModel.toggleView();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    color: viewModel.showStatistics
                        ? const Color(0xFFFF6B6B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: viewModel.showStatistics
                          ? const Color(0xFFFF6B6B)
                          : Colors.grey[300]!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      LocaleKeys.general_statistics.tr(),
                      style: TextStyle(
                        color: viewModel.showStatistics
                            ? Colors.white
                            : Colors.black,
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
                  if (viewModel.showStatistics) {
                    viewModel.toggleView();
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 1.5.h),
                  decoration: BoxDecoration(
                    color: !viewModel.showStatistics
                        ? const Color(0xFFFF6B6B)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: !viewModel.showStatistics
                          ? const Color(0xFFFF6B6B)
                          : Colors.grey[300]!,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '${LocaleKeys.general_history.tr()} (${viewModel.totalRecords})',
                      style: TextStyle(
                        color: !viewModel.showStatistics
                            ? Colors.white
                            : Colors.black,
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
