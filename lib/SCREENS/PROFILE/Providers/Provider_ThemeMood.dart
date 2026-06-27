import 'package:flutter/material.dart';

class ProviderThememood with ChangeNotifier {
  bool _isDarkMood = false;

  bool get isDarkMood => _isDarkMood;

  void toggleTheme(bool value) {
    _isDarkMood = value;
    notifyListeners();
  }

  ThemeMode get themeMode =>
      _isDarkMood ? ThemeMode.dark : ThemeMode.light;
}