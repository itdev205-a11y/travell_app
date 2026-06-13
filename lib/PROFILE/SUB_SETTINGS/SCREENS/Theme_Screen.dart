import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../Providers/Provider_ThemeMood.dart';
import '../WIDGETS_SETTINGS/Text_Setting.dart';

class ThemeScreen extends StatelessWidget {
  const ThemeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ProviderThememood>();
    final isDark = themeProvider.isDarkMood;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const TextSetting(
          text: 'Theme',
          size: 26,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          elevation: 6,
          shadowColor: Colors.black.withOpacity(0.1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextSetting(
                  text: 'Appearance Settings',
                  size: 22,
                ),

                const SizedBox(height: 6),

                Text(
                  'Choose how the app looks for you',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.grey.withOpacity(0.08),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,

                    leading: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: isDark
                            ? Colors.black12
                            : Colors.blue.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isDark ? Icons.dark_mode : Icons.light_mode,
                        color: isDark ? Colors.amber : Colors.blue,
                      ),
                    ),

                    title: const TextSetting(
                      text: 'Theme Mode',
                      size: 18,
                    ),

                    subtitle: Text(
                      isDark ? 'Dark Mode Active' : 'Light Mode Active',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),

                    trailing: Switch(
                      value: isDark,
                      onChanged: themeProvider.changeTheme,
                      activeColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}