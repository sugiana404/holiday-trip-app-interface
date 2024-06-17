import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/providers/auth_provider.dart';
import 'package:holiday_trip_app_interface/screens/home_screen.dart';
import 'package:holiday_trip_app_interface/screens/login_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider()..tryAutoLogin(),
      child: MaterialApp(
        home: Consumer<AuthProvider>(
          builder: (context, auth, _) {
            if (auth.isLoggedIn) {
              return HomeScreen();
            } else {
              return LoginScreen();
            }
          },
        ),
        routes: {
          '/home': (context) => HomeScreen(),
        },
      ),
    );
  }
}
