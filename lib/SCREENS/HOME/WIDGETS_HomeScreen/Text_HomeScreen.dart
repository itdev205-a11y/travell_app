import 'package:flutter/material.dart';

class TextHomeScreen extends StatelessWidget {
  final String text;
  final double size;

  const TextHomeScreen({
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.blue,
          Colors.purple,
        ],
      ).createShader(bounds),

      child: Text(
        text,
        style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}