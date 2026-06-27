import 'package:flutter/material.dart';
import 'LoginTextField.dart';

class LoginFormContainer extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback? onForgotPassword;

  const LoginFormContainer({
    super.key,
    required this.emailController,
    required this.passwordController,
    this.onForgotPassword,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.75),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: Colors.white.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        children: [
          LoginTextField(
            label: "Email",
            icon: Icons.email,
            controller: emailController,
          ),

          const SizedBox(height: 12),

          LoginTextField(
            label: "Password",
            icon: Icons.lock,
            controller: passwordController,
            isPassword: true,
          ),

          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: onForgotPassword,
              child: const Text(
                "Forgot Password?",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}