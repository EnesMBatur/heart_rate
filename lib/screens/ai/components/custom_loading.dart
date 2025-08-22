import 'package:flutter/material.dart';
import 'package:glycemic_index/core/enums/lottie_items_enum.dart';
import 'package:lottie/lottie.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: Device.screenType == ScreenType.tablet ? 200 : 120,
        child: Lottie.asset(LottieItemsEnum.loading.lottiePath),
      ),
    );
  }
}
