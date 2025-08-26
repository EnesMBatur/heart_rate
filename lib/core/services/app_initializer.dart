import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:heart_rate/core/constants/duration_items.dart';
import 'package:heart_rate/core/hive/initialize.dart';
import 'package:heart_rate/core/hive/secure_storage.dart';
import 'package:heart_rate/services/firebase_options.dart';

class AppInitializer {
  /// Uygulamanın başlangıç süreçlerini yönetir
  static Future<void> initialize() async {
    // Flutter binding'leri başlat
    WidgetsFlutterBinding.ensureInitialized();

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await hiveInitialize();
    final storageManager = SecureStorage();
    await storageManager.setupInitialUUID();
    await storageManager.setupInitialID();
    // Native splash kontrolü için preserve et
    FlutterNativeSplash.preserve(
      widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
    );

    // Localization'ı başlat
    await EasyLocalization.ensureInitialized();

    // Cihaz yönelimlerini ayarla
    await _setPreferredOrientations();

    // Native splash'i belirli süre sonra kaldır
    _scheduleNativeSplashRemoval();
  }

  /// Desteklenen cihaz yönelimlerini ayarlar
  static Future<void> _setPreferredOrientations() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /// Native splash'in kaldırılmasını zamanlar
  static void _scheduleNativeSplashRemoval() {
    Future.delayed(DurationItems.durationNormal(), () {
      FlutterNativeSplash.remove();
    });
  }
}
