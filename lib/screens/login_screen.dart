import 'package:flutter/material.dart';
import 'package:holiday_trip_app_interface/providers/auth_provider.dart';
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
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
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
                ),
                Text('Keep me logged in')
              ],
            ),
            ElevatedButton(
                onPressed: () async {
                  await context
                      .read<AuthProvider>()
                      .login(_emailController.text, _passwordController.text);
                  if (context.read<AuthProvider>().isLoggedIn) {
                    Navigator.pushReplacementNamed(context, '/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Login failed')),
                    );
                  }
                },
                child: Text('Login'))
          ],
        ),
      ),
    );
  }
}
