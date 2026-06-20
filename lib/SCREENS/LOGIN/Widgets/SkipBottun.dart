

import 'package:flutter/material.dart';

class SkipButton extends StatelessWidget {

  final VoidCallback onPressed;

  const SkipButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Align(

      alignment:
      Alignment.topRight,

      child: TextButton(

        onPressed:
        onPressed,

        child:
        const Text(
          'SKIP',

          style:
          TextStyle(
            color:
            Colors.white,
          ),
        ),
      ),
    );
  }
}