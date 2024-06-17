import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/providers/auth_provider.dart';
import 'package:holiday_trip_app_interface/utils/button_style_constant.dart';
import 'package:holiday_trip_app_interface/utils/color_constant.dart';
import 'package:holiday_trip_app_interface/utils/field_constant.dart';
import 'package:holiday_trip_app_interface/utils/text_styles_constant.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _keepLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 8.0,
                ),
                child: Text(
                  "Holiday Trip",
                  style: TextStylesConstant.logoTextStyle(
                    color: ColorConstant.mainColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: TextField(
                  controller: _emailController,
                  decoration: FieldConstant.normalInputDecoration(
                    labelText: "Email",
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                decoration: FieldConstant.normalInputDecoration(
                  labelText: "Password",
                ),
                obscureText: true,
              ),
              Row(
                children: [
                  Checkbox(
                    value: _keepLoggedIn,
                    onChanged: (bool? value) {
                      setState(
                        () {
                          _keepLoggedIn = value ?? false;
                        },
                      );
                    },
                    activeColor: ColorConstant.mainColor,
                  ),
                  Text(
                    'Keep me logged in',
                    style: TextStylesConstant.labelTextStyle(),
                  )
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  await context.read<AuthProvider>().login(
                        _emailController.text,
                        _passwordController.text,
                        _keepLoggedIn,
                      );

                  if (context.read<AuthProvider>().isLoggedIn) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login failed')),
                    );
                  }
                },
                style: ButtonStyleConstant.elevatedButtonStyle(),
                child: Text(
                  'Login',
                  style: TextStylesConstant.buttonTextStyle(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
