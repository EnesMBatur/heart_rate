import 'package:flutter/material.dart';

class GlycemicIndicator extends StatelessWidget {
  const GlycemicIndicator({
    super.key,
    required this.context,
    required this.value,
    required this.label,
    required this.color,
    required this.size,
  });

  final BuildContext context;
  final String value;
  final String label;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    //TODO: Revenuecat Integration
    // final entitlement = Provider.of<RevenueCatProvider>(context).entitlement;
    // return entitlement == Entitlement.free &&
    //         label == LocaleKeys.calendar_GL.tr()
    // ? GestureDetector(
    //     onTap: () async => await context.push(AppRouter.paywall),
    //     child: Column(
    //       children: [
    //         Container(
    //           width: size,
    //           height: size,
    //           decoration: BoxDecoration(
    //             shape: BoxShape.circle,
    //             color: color.withValues(alpha: .2),
    //             border: Border.all(color: color, width: 2),
    //           ),
    //           child: Center(
    //             child: Center(
    //               child: Padding(
    //                 padding: const EdgeInsets.all(12),
    //                 child: SvgPicture.asset(SvgGeneralEnum.lock.svgPath),
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(height: 4),
    //         Text(
    //           label,
    //           style: Theme.of(context).textTheme.bodySmall?.copyWith(
    //             color: Colors.grey[600],
    //             fontWeight: FontWeight.w500,
    //           ),
    //         ),
    //       ],
    //     ),
    //   )
    // :
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: .2),
            border: Border.all(color: color, width: 2),
          ),
          child: Center(
            child: Text(
              value,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
                fontSize: value.length > 3 ? 16 : 18,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
