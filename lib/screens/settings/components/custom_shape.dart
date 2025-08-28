import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomShape extends StatelessWidget {
  const CustomShape({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Device.screenType == ScreenType.tablet ? 100 : 54,
      child: Stack(
        children: [
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              height: Device.screenType == ScreenType.tablet ? 80 : 42,
              color: AppConst.kPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
