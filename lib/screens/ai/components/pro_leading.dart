// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:go_router/go_router.dart';
// import 'package:heart_rate/core/constants/constants.dart';
// import 'package:heart_rate/core/enums/svg_general_enum.dart';
// import 'package:heart_rate/router/app_router.dart';
// import 'package:provider/provider.dart';

// class ProLeading extends StatelessWidget {
//   const ProLeading({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Consumer<RevenueCatProvider>(
//       builder: (context, revenueCatProvider, child) {
//         final entitlement = revenueCatProvider.entitlement;
//         if (entitlement == Entitlement.free) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 8, bottom: 10, left: 16),
//             child: ElevatedButton(
//               onPressed: () async => await context.push(AppRouter.paywall),
//               style: ElevatedButton.styleFrom(
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(AppConst.kDefaultPadding),
//                 ),
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: AppConst.kDefaultPadding,
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   SvgPicture.asset(
//                     SvgGeneralEnum.gem.svgPath,
//                     height: 24,
//                     width: 24,
//                   ),
//                   const SizedBox(width: 6),
//                   Text(
//                     'PRO',
//                     style: Theme.of(context).textTheme.bodyLarge!.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: Theme.of(context).primaryColorLight,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         } else {
//           return const SizedBox.shrink();
//         }
//       },
//     );
//   }
// }
