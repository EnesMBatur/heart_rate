import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:heart_rate/core/enums/lottie_items_enum.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    required this.height,
    required this.width,
    super.key,
    this.boxFit = BoxFit.scaleDown,
  });

  final String imageUrl;
  final double height;
  final double width;
  final BoxFit boxFit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) =>
          Center(child: Lottie.asset(LottieItemsEnum.loadingImage.lottiePath)),
      errorWidget: (context, url, error) =>
          const Center(child: Icon(LineIcons.exclamationCircle)),
      height: height,
      width: width,
      fit: boxFit,
    );
  }
}
