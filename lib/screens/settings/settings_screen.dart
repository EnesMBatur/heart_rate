import 'package:flutter/material.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:heart_rate/screens/settings/components/body.dart';

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
        'Settings',
        style: Theme.of(
          context,
        ).appBarTheme.titleTextStyle!.copyWith(color: Colors.white),
      ),
    );
  }
}
