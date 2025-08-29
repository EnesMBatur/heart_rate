import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/screens/settings/components/body.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../locale/lang/locale_keys.g.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const SafeArea(child: Body()),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      backgroundColor: AppConst.kPrimaryColor,
      title: Text(
        LocaleKeys.navigation_settings.tr(),
        style: Theme.of(
          context,
        ).appBarTheme.titleTextStyle!.copyWith(color: Colors.white),
      ),
    );
  }
}
