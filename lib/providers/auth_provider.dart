import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/services/auth_service.dart';
import 'package:holiday_trip_app_interface/utils/log_config.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();
  String? _token;
  int? _expiresAt;
  bool _isLoggedIn = false;

  String? get token => _token;
  bool get isLoggedIn => _isLoggedIn;

  Future<void> login(String email, String password, bool keepLoggedIn) async {
    final response = await _authService.login(email, password);
    if (response != null && response.status == "success") {
      LogConfig.logger.i("login..");
      _token = response.token;
      _expiresAt = response.expiresAt;
      _isLoggedIn = true;
      if (keepLoggedIn) {
        LogConfig.logger.i("Saved login status");
        await _authService.saveToken(_token!, _expiresAt!);
        await _authService.saveAcc(email, password);
      } else {
        LogConfig.logger.i("Don't save login status");
      }
      notifyListeners();
    }
  }

  Future<void> tryAutoLogin() async {
    final tokenData = await _authService.getToken();
    final currentTime = DateTime.now().millisecondsSinceEpoch;
    LogConfig.logger
        .i("currentTime: $currentTime\nexpiresTime: ${tokenData?.expiresAt}");
    if (tokenData?.jwtToken != null && tokenData?.expiresAt != null) {
      if (tokenData!.expiresAt! < currentTime) {
        final accData = await _authService.getAcc();
        if (accData?.email != null && accData?.password != null) {
          login(accData!.email!, accData.password!, true);
        }
      } else if (tokenData.expiresAt! > currentTime) {
        LogConfig.logger.i("Auto login");
        _token = tokenData.jwtToken;
        _expiresAt = tokenData.expiresAt;
        _isLoggedIn = true;
        notifyListeners();
      }
    } else {
      LogConfig.logger.i("Manual login");
    }
  }

  Future<void> logout() async {
    await _authService.clearToken();
    _token = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}
