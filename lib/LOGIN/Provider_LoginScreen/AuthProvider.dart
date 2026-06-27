import 'package:flutter/material.dart';

import '../Firebase_Login/auth_service_login_sign.dart';




class AuthProvider with ChangeNotifier {

  final AuthService _auth = AuthService();

  bool isLoading = false;

  Future<String?> login({
    required String email,
    required String password,
  }) async {

    try {
      isLoading = true;
      notifyListeners();

      await _auth.login(
        email: email.trim(),
        password: password,
      );

      return null;

    } catch (e) {
      return e.toString();

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<String?> register({
    required String email,
    required String password,
  }) async {

    try {
      isLoading = true;
      notifyListeners();

      await _auth.register(
        email: email.trim(),
        password: password,
      );

      return null;

    } catch (e) {
      return e.toString();

    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}