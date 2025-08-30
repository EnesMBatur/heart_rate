import 'package:heart_rate/services/purchase_api.dart' show PurchaseApi;
import 'package:purchases_flutter/models/package_wrapper.dart';

mixin RevenueCatManager {
  // Future<void> presentPaywallIfNeeded() async {
  //   final paywallResult = await RevenueCatUI.presentPaywallIfNeeded("premium");
  //   log('Paywall result: $paywallResult');
  // }

  Future<List<Package>?> fetchOffers() async {
    final offerings = await PurchaseApi.fetchOffers();
    if (offerings.isNotEmpty) {
      final packages = offerings
          .map((offer) => offer.availablePackages)
          .expand((pair) => pair)
          .toList();
      return packages;
    }
    return null;
  }
}
