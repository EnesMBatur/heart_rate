// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:url_launcher/url_launcher.dart';

mixin LaunchManager {
  Future<void> launchUri(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  void sendEposta(String version) {
    String? encodeQueryParameters(Map<String, String> params) {
      return params.entries
          .map(
            (MapEntry<String, String> e) =>
                '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
          )
          .join('&');
    }

    final emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'info@wiserapps.co',
      query: encodeQueryParameters(<String, String>{
        'subject': Platform.isAndroid
            ? 'Heart Rate Monitor (Android)'
            : 'Heart Rate Monitor (IOS)',
        'body': '\n\nApp Version: $version',
      }),
    );

    launchUrl(emailLaunchUri);
  }
}
