import 'package:flutter/material.dart';

class TextPayment extends StatelessWidget {

  final String text ;
  final double size ;

  const TextPayment({super.key,
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
