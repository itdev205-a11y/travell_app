import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../PROFILE/Provider_ThemeMood/Provider_ThemeMood.dart';



class ThemeScreen extends StatefulWidget {
  const ThemeScreen({super.key});

  @override
  State<ThemeScreen> createState() => _ThemeScreenState();
}

class _ThemeScreenState extends State<ThemeScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Theme'),
      ),

      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,
          child: const _ThemeContent(),
        ),
      ),
    );
  }
}

class _ThemeContent extends StatelessWidget {
  const _ThemeContent();

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ProviderThememood>();

    final isDark = Theme.of(context).brightness == Brightness.dark;
    final colors = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.all(16),

      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),

          // ================= LIGHT / DARK CONTROL =================
          color: isDark ? colors.surfaceContainer : null,

          gradient: isDark
              ? null
              : LinearGradient(
            colors: [
              Colors.blue.shade50,
              Colors.purple.shade50,
              Colors.pink.shade50,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),

          boxShadow: [
            BoxShadow(
              color: colors.shadow.withOpacity(isDark ? 0.25 : 0.08),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              Text(
                'Appearance Settings',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: colors.onSurface,
                ),
              ),

              const SizedBox(height: 6),

              Text(
                'Choose how the app looks for you',
                style: TextStyle(
                  fontSize: 13,
                  color: colors.onSurfaceVariant,
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                contentPadding: EdgeInsets.zero,

                leading: Icon(
                  isDark ? Icons.dark_mode : Icons.light_mode,
                  color: colors.primary,
                ),

                title: Text(
                  'Theme Mode',
                  style: TextStyle(color: colors.onSurface),
                ),

                subtitle: Text(
                  isDark ? 'Dark Mode Active' : 'Light Mode Active',
                  style: TextStyle(color: colors.onSurfaceVariant),
                ),

                trailing: Switch(
                  value: isDark,
                  onChanged: themeProvider.toggleTheme,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}