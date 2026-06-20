import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import 'Provider/AuthProvider.dart';
import 'Widgets/AuthButton.dart';
import 'Widgets/LoginFormContainer.dart';
import 'Widgets/SkipBottun.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> _login() async {
    final auth = context.read<AuthProvider>();

    final error = await auth.login(
      email: emailController.text,
      password: passwordController.text,
    );

    if (!mounted) return;

    if (error == null) {
      context.go('/screen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

  Future<void> _register() async {
    final auth = context.read<AuthProvider>();

    final error = await auth.register(
      email: emailController.text,
      password: passwordController.text,
    );

    if (!mounted) return;

    if (error == null) {
      context.go('/screen');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();

    return Scaffold(
      body: Stack(
        children: [

          // 🌤️ SUMMER BACKGROUND
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF87CEEB), // sky blue
                  Color(0xFFBFE9FF),
                  Color(0xFFFFF3E0), // warm sand
                ],
              ),
            ),
          ),

          // ☀️ glow effect
          Positioned(
            top: -60,
            right: -60,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orangeAccent.withOpacity(0.25),
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [

                  SkipButton(
                    onPressed: () => context.go('/screen'),
                  ),

                  const SizedBox(height: 10),

                  Lottie.asset(
                    'assets/animations/palne.json',
                    height: 220,
                  ),

                  const SizedBox(height: 10),

                  Text(
                    "Welcome Back",
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 25),

                  LoginFormContainer(
                    emailController: emailController,
                    passwordController: passwordController,
                    onForgotPassword: () {},
                  ),

                  const SizedBox(height: 25),

                  AuthButton(
                    text: "Login",
                    loading: auth.isLoading,
                    onPressed: _login,
                  ),

                  const SizedBox(height: 12),

                  AuthButton(
                    text: "Create Account",
                    onPressed: auth.isLoading ? null : _register,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}