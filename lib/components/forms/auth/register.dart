import 'package:flutter/material.dart';
import 'custom_input_field.dart';
import '../../buttons/yellow_button.dart';
import 'package:go_router/go_router.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CustomInputField(
          placeholder: 'Full Name',
          controller: _nameController,
          keyboardType: TextInputType.name,
        ),
        const SizedBox(height: 16),
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
        const SizedBox(height: 16),
        CustomInputField(
          placeholder: 'Confirm Password',
          controller: _confirmPasswordController,
          isPassword: true,
        ),
        const SizedBox(height: 24),
        YellowButton(
          text: 'Register',
          onPressed: () {
            context.go('/'); // Navigate to home after registration
          },
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            context.go('/login');
          },
          child: Text(
            'Already have an account? Login',
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
