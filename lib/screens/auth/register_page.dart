import 'package:flutter/material.dart';
import '../../components/forms/auth/register.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  static const String route = '/register';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 40),
            Text(
              'Create Account 🚀',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E3A8A),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Please fill in the details to register',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 32),
            RegisterForm(),
          ],
        ),
      ),
    );
  }
}
