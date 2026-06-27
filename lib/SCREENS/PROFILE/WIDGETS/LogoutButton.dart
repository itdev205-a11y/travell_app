import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  Future<void> signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    context.pushReplacement('/login');
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.error,
        foregroundColor: colors.onError,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      icon: Icon(Icons.logout, color: colors.onError),

      label: Text(
        'Logout',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: colors.onError,
        ),
      ),

      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: colors.surface,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),

              title: Text(
                'Confirm Logout',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),

              content: Text(
                'Are you sure you want to log out of your account?',
                style: TextStyle(color: colors.onSurfaceVariant),
              ),

              actions: [

                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: colors.primary),
                  ),
                ),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colors.error,
                    foregroundColor: colors.onError,
                  ),

                  onPressed: () async {
                    Navigator.pop(context);
                    await signOut(context);
                  },

                  child: const Text('Logout'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}