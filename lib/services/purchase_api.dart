import 'dart:io';

// import 'package:flutter/services.dart';
import 'package:flutter/services.dart';
import 'package:heart_rate/core/constants/constants.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class PurchaseApi {
  static Future<void> init() async {
    await Purchases.setLogLevel(LogLevel.debug);
    PurchasesConfiguration configuration;
    configuration = PurchasesConfiguration(
      Platform.isAndroid ? AppConst.googleApiKey : AppConst.appleApiKey,
    );
    await Purchases.configure(configuration);
    await Purchases.enableAdServicesAttributionTokenCollection();
  }

  static Future<List<Offering>> fetchOffers() async {
    try {
      final offerings = await Purchases.getOfferings();
      final current = offerings.current;
      return current == null ? [] : [current];
    } on PlatformException {
      return [];
    }
  }

  static Future<bool> purchasePackage(Package package) async {
    try {
      await Purchases.purchasePackage(package);
      return true;
    } catch (e) {
      return false;
    }
  }

  static Future<CustomerInfo?> restorePurchases() async {
    try {
      return await Purchases.restorePurchases();
    } catch (e) {
      return null;
    }
  }
}
