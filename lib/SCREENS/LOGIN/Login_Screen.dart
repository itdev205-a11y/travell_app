import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Firebase/auth_service_login_sign.dart';
import 'Widgets/FeildText_Gmail.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final AuthService auth = AuthService();

  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    setState(() => isLoading = true);

    try {
      await auth.login(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;
      context.go('/screen');
    } catch (e) {
      _showError(e.toString());
    }

    if (mounted) setState(() => isLoading = false);
  }

  Future<void> _register() async {
    setState(() => isLoading = true);

    try {
      await auth.register(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      if (!mounted) return;
      context.go('/screen');
    } catch (e) {
      _showError(e.toString());
    }

    if (mounted) setState(() => isLoading = false);
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/logo/photologin.jpg"),
            fit: BoxFit.cover,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [

                  // ================= SKIP =================
                  Align(
                    alignment: Alignment.topRight,
                    child: TextButton(
                      onPressed: () => context.go('/screen'),
                      child: const Text(
                        'SKIP',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),

                  const SizedBox(height: 40),

                  // ================= LOGIN CARD =================
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.25),
                      borderRadius: BorderRadius.circular(20),
                    ),

                    child: Column(
                      children: [

                        LoginTextField(
                          label: "Email",
                          controller: emailController,
                        ),

                        const SizedBox(height: 12),

                        LoginTextField(
                          label: "Password",
                          controller: passwordController,
                          isPassword: true,
                        ),

                        const SizedBox(height: 10),

                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Forgot Password?',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  // ================= LOGIN =================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _login,
                      child: isLoading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      )
                          : const Text("Login"),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // ================= REGISTER =================
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _register,
                      child: const Text("Create Account"),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}