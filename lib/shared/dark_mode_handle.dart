import 'package:flutter/material.dart';

class DarkModeHandler extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode {
    return _isDarkMode;
  }

  void switchDarkMode() {
    _isDarkMode = !_isDarkMode;

    notifyListeners();
  }
}
