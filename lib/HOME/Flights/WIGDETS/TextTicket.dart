
import 'package:flutter/cupertino.dart';

class TextTicket extends StatelessWidget {

  final String name ;
  final double size ;

  const TextTicket({super.key,
    required this.name,
    required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(name,

    style: TextStyle(
        fontSize: size,
      fontWeight: FontWeight.bold
    ),
    );
  }
}
