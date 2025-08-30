import 'package:flutter/material.dart';
import 'package:heart_rate/utils/revenue_manager.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

class RevenueCatProvider extends ChangeNotifier with RevenueCatManager {
  RevenueCatProvider() {
    init();
    updatePrices();
    updatePurchaseStatus();
  }

  Entitlement _entitlement = Entitlement.free;

  Package? _packageLifetime;
  Package? _packageWeekly;
  Package? _specialOffer;

  Entitlement get entitlement => _entitlement;

  Package? get packageLifetime => _packageLifetime;
  Package? get packageWeekly => _packageWeekly;
  Package? get specialOffer => _specialOffer;

  Future<void> init() async {
    Purchases.addCustomerInfoUpdateListener((customerInfo) async {
      await updatePurchaseStatus();
    });
  }

  Future<Entitlement> updatePurchaseStatus() async {
    final customerInfo = await Purchases.getCustomerInfo();
    final entitlements = customerInfo.entitlements.active.values.toList();
    _entitlement = entitlements.isEmpty
        ? Entitlement.free
        : Entitlement.premium;
    notifyListeners();
    return _entitlement;
  }

  Future<List<Package>?> updatePrices() async {
    final packages = await fetchOffers();
    if (packages != null) {
      _packageLifetime = packages[0];
      _packageWeekly = packages[1];
      _specialOffer = packages.length > 2 ? packages[2] : null;
    }
    notifyListeners();
    return packages;
  }
}

enum Entitlement { free, premium }
