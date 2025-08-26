// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:heart_rate/core/hive/secure_storage.dart';

mixin HistoryManager {
  Future<String> getPath() async {
    final uuid = await SecureStorage().getUUID();
    log('$uuid/chat');
    return '$uuid/chat';
  }
}
