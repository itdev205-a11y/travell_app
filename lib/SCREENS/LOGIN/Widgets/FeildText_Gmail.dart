import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;

  const LoginTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,

      style: const TextStyle(
        color: Colors.white, // 👈 لون النص داخل الحقل
      ),

      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white, // 👈 لون label
        ),

        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white54),
        ),

        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}