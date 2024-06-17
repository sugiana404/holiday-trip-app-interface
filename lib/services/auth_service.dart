import 'dart:convert';

import 'package:holiday_trip_app_interface/models/login_response.dart';
import 'package:holiday_trip_app_interface/utils/log_config.dart';
import 'package:holiday_trip_app_interface/utils/url_constant.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final String apiUrl = "${UrlConstant.loginUrl}";

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
    }
  }

  Future<void> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> clearToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
  }
}
