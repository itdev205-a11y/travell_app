import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProviderThememood with ChangeNotifier {
  bool isDarkMood = false;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    isDarkMood = prefs.getBool('darkMood') ?? false;
    notifyListeners();
  }

  Future<void> changeTheme(bool value) async {
    isDarkMood = value;
    notifyListeners();

    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkMood', isDarkMood);
  }

  ThemeMode get themeMode =>
      isDarkMood ? ThemeMode.dark : ThemeMode.light;
}