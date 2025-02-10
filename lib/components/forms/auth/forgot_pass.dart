import 'package:flutter/material.dart';
import 'custom_input_field.dart';
import '../../buttons/yellow_button.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Enter your email address to reset your password',
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        CustomInputField(
          placeholder: 'Email',
          controller: _emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 24),
        YellowButton(
          text: 'Reset Password',
          onPressed: () {
            context.go('/login'); // Navigate back to login after reset
          },
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () {
            context.go('/login');
          },
          child: Text(
            'Back to Login',
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
