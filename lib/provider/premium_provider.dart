import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PremiumNotifier extends ChangeNotifier {
  int _indexSelected = 0;
  bool _isLoading = true;

  int get indexSelected => _indexSelected;
  bool get isLoading => _isLoading;

  void setPage(int selectedPage) {
    _indexSelected = selectedPage;
    notifyListeners();
  }

  void setLoading({required bool isLoading}) {
    _isLoading = isLoading;
    notifyListeners();
  }
}

final premiumProvider = ChangeNotifierProvider<PremiumNotifier>((ref) {
  return PremiumNotifier();
});
