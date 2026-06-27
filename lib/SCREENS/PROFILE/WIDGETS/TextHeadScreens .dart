import 'package:flutter/material.dart';

class TextHeadScreens extends StatelessWidget {
  final String text;
  final double size;

  const TextHeadScreens ( {
    super.key,
    required this.text,
    required this.size,
  });

  @override
  Widget build(
      BuildContext context,
      ) {
    final colors =
        Theme.of(context).colorScheme;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return ShaderMask(
      shaderCallback:
          (bounds) =>
          LinearGradient(
            colors: isDark
                ? [
              colors.primary,
              colors.secondary,
            ]
                : [
              Colors.blue,
              Colors.purple,
              Colors.pink,
            ],
          ).createShader(
            bounds,
          ),

      child: Text(
        text,

        style: TextStyle(
          fontSize: size,

          fontWeight:
          FontWeight.bold,

          color:
          Colors.white,
        ),
      ),
    );
  }
}