import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/services/auth_service.dart';
import 'package:holiday_trip_app_interface/utils/log_config.dart';

class AuthProvider with ChangeNotifier {
  AuthService _authService = AuthService();
  String? _token;
  bool _isLoggedIn = false;

  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password) async {
    final response = await _authService.login(email, password);
    if (response != null && response.status == "success") {
      _token = response.token;
      _isLoggedIn = true;
      await _authService.saveToken(_token!);
      notifyListeners();
    }
  }

  Future<void> tryAutoLogin() async {
    final token = await _authService.getToken();
    if (token != null) {
      _token = token;
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  Future<void> logout() async {
    await _authService.clearToken();
    _token = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
