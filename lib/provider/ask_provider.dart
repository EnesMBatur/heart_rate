// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AskNotifier extends ChangeNotifier {
  bool _isTyping = false;
  bool _animationIsPlaying = false;
  bool _isAnimation = false;
  bool _isLike = false;
  bool _isDislike = false;
  String? _refreshMessage;

  List<String> _animatedMessages = [];

  bool get isTyping => _isTyping;
  bool get isLike => _isLike;
  bool get isDislike => _isDislike;
  bool get animationIsPlaying => _animationIsPlaying;
  bool get isAnimation => _isAnimation;

  String? get refreshMessage => _refreshMessage;
  List<String> get animatedMessages => _animatedMessages;

  void setTyping() {
    _isTyping = !_isTyping;
    notifyListeners();
  }

  void setLike() {
    _isLike = !_isLike;
    notifyListeners();
  }

  void setDislike() {
    _isDislike = !_isDislike;
    notifyListeners();
  }

  void setCustomLike({required bool value}) {
    _isLike = value;
    notifyListeners();
  }

  void setCustomDislike({required bool value}) {
    _isDislike = value;
    notifyListeners();
  }

  void setRefreshMessage(String msg) {
    _refreshMessage = msg;
    notifyListeners();
  }

  void setAnimationPlay({required bool value}) {
    _animationIsPlaying = value;
    notifyListeners();
  }

  void setIsAnimation({required bool value}) {
    _isAnimation = value;
    notifyListeners();
  }

  void setAnimatedMessages(String message) {
    if (!_animatedMessages.contains(message)) {
      _animatedMessages.add(message);
      notifyListeners();
    }
  }
}

final askProvider = ChangeNotifierProvider<AskNotifier>((ref) {
  return AskNotifier();
});
