import 'dart:convert';

import 'package:holiday_trip_app_interface/models/login_response.dart';
import 'package:holiday_trip_app_interface/utils/log_config.dart';
import 'package:holiday_trip_app_interface/utils/url_constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TokenData {
  final String? jwtToken;
  final int? expiresAt;

  TokenData({this.jwtToken, this.expiresAt});
}

class AccountData {
  final String? email;
  final String? password;

  AccountData({this.email, this.password});
}

class AuthService {
  final String apiUrl = UrlConstant.loginUrl;

  Future<LoginResponse?> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
          <String, String>{
            'email': email,
            'password': password,
          },
        ),
      );

      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        return LoginResponse.fromJson(jsonResponse);
      } else {
        LogConfig.logError("Login failed", jsonResponse);
        return null;
      }
    } catch (error) {
      LogConfig.logger.e("Exception during login: $error");
      return null;
    }
  }

  Future<void> saveToken(String token, int expiresAt) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setInt('expiresAt', expiresAt);
    await getToken();
  }

  Future<void> saveAcc(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var emailData = await prefs.setString('email', email);
    var passwordData = await prefs.setString('password', password);
    LogConfig.logger.w("$emailData, $passwordData");
    await getAcc();
  }

  Future<AccountData?> getAcc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    LogConfig.logger.i("Get ACC data");
    var email = prefs.getString('email');
    var password = prefs.getString('password');
    if (email == null || password == null) {
      LogConfig.logger.i("Null data");
      return null;
    }
    LogConfig.logger.e(email);
    LogConfig.logger.i("$email\n $password");
    return AccountData(email: email, password: password);
  }

  Future<TokenData?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    var expiresAt = prefs.getInt('expiresAt');
    if (token == null || expiresAt == null) {
      return null;
    }
    LogConfig.logger.i("$token\n $expiresAt");
    return TokenData(expiresAt: expiresAt, jwtToken: token);
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
