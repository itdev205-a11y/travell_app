import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          AnimatedSwitcher(
            duration: Duration(seconds: 300),

            child: TextButton(
              onPressed: () {
                context.push('/screen');
              },
              child: const Text('SKIP'),
            ),
          ),

        ],

      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

          ],
        ),
      ),
    );
  }
}