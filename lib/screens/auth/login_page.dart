import 'package:flutter/material.dart';
import '../../components/forms/auth/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              'Welcome Back! 👋',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please sign in to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
