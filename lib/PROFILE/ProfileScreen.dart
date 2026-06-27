import 'package:flutter/material.dart';

import 'Widgets_Profile/Widgets_Profilescreen/Container_InfoUser.dart';
import 'Widgets_Profile/Widgets_Profilescreen/Container_Setting.dart';
import 'Widgets_Profile/Widgets_Profilescreen/LogoutButton.dart';
import 'Widgets_Profile/Widgets_Profilescreen/TextHeadScreens .dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? colors.surface : const Color(0xffF7F8FA),
      body: const SafeArea(
        child: Column(
          children: [
            SizedBox(height: 12),

            // TITLE
            TextHeadScreens(
              text: 'Profile',
              size: 32,
            ),

            SizedBox(height: 16),



            Container_InfoUser(),

            SizedBox(height: 16),

            // SETTINGS (flexible area)
            Expanded(
              child: ContainerSetting(),
            ),

            SizedBox(height: 12),

            // LOGOUT (fixed bottom)
            LogoutButton(),

            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}