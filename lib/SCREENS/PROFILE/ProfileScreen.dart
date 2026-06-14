import 'package:flutter/material.dart';
import 'WIDGETS/Container_Setting.dart';
import 'WIDGETS/ProfileEmailContainer.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TweenAnimationBuilder(


        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 800),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          );
        },

        child: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              children: [

                ProfileInfoContainer(),

                SizedBox(height: 20),
                ContainerSetting(),




              ],
            ),
          ),
        ),
      ),
    );
  }
}

