import 'package:heart_rate/core/hive/secure_storage.dart';

mixin IdManager {
  Future<String> getBasePath() async {
    final uuid = await getUuid();
    final messageId = await getMessageId();
    final basePath = '$uuid/chat/$messageId';
    return basePath;
  }

  Future<String> getUuid() async {
    final value = await SecureStorage().getUUID();
    return value ?? '';
  }

  Future<String> getMessageId() async {
    final value = await SecureStorage().getMessageID();
    return value ?? '';
  }
}
