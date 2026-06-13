
import 'package:flutter/material.dart';

class TextSetting extends StatelessWidget {

  final String text ;
  final double size ;

  const TextSetting({super.key,
    required this.text,
    required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,

      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold
      ),

    );
  }
}
