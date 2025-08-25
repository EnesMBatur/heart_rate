import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uuid/uuid.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<int> readSecureData(String key) async {
    final value = await storage.read(key: key) ?? '0';
    final intValue = int.parse(value);
    return intValue;
  }

  Future<void> writeSecureData(String key, String value) async {
    await storage.write(key: key, value: value);
  }

  Future<void> deleteSecureData(String key) async {
    await storage.delete(key: key);
  }

  Future<void> controlandIncreaseSecureData(String key) async {
    final value = await storage.read(key: key) ?? '0';
    var intValue = int.parse(value);
    intValue++;
    await storage.write(key: key, value: intValue.toString());
  }

  Future<void> setupInitialUUID() async {
    final currentValue = await storage.read(key: 'uuid');
    if (currentValue == null) {
      final uuid = const Uuid().v4();
      await storage.write(key: 'uuid', value: uuid);
    }
  }

  Future<void> setupInitialID() async {
    final currentValue = await storage.read(key: 'messageId') ?? '0';
    var intValue = int.parse(currentValue);
    intValue++;
    await storage.write(key: 'messageId', value: intValue.toString());
  }

  Future<String?> getUUID() async {
    return storage.read(key: 'uuid');
  }

  Future<String?> getMessageID() async {
    return storage.read(key: 'messageId');
  }
}
