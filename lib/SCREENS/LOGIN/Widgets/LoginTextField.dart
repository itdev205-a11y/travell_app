import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final bool isPassword;
  final IconData icon;

  const LoginTextField({
    super.key,
    required this.label,
    required this.controller,
    this.isPassword = false,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      style: const TextStyle(color: Colors.black87),

      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.blueAccent),

        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),

        filled: true,
        fillColor: Colors.white,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),

        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Colors.blueAccent),
        ),
      ),
    );
  }
}