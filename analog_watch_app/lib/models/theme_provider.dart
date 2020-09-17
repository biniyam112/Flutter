import 'package:flutter/material.dart';

class ThemeProviderModel extends ChangeNotifier {
  bool _isLightTheme = true;
  void chageTheme() {
    _isLightTheme = !_isLightTheme;
    notifyListeners();
  }

  bool get isLightTheme => _isLightTheme;
}
