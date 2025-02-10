import 'package:flutter/material.dart';
import 'custom_input_field.dart';
import '../../buttons/yellow_button.dart';
import 'package:go_router/go_router.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          placeholder: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        CustomInputField(
          placeholder: 'Password',
          controller: _passwordController,
          isPassword: true,
        ),
        const SizedBox(height: 24),
        YellowButton(
          text: 'Login',
          onPressed: () {
            context.go('/'); // Navigate to home after login
          },
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            context.go('/forgot-password');
          },
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            context.go('/register');
          },
          child: Text(
            'Don\'t have an account? Register',
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
