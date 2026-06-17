import 'package:flutter/material.dart';
import 'WIDGETS/Container_Setting.dart';
import 'WIDGETS/LogoutButton.dart';
import 'WIDGETS/ProfileEmailContainer.dart';
import 'WIDGETS/TextHeadScreens .dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final isDark =
        Theme.of(context).brightness ==
            Brightness.dark;

    return TweenAnimationBuilder(
        tween: Tween(
          begin: 0.0,
          end: 1.0,
        ),

        duration:
        const Duration(
          milliseconds: 1000,
        ),

        builder: (
            context,
            value,
            child,
            ) {
          return Opacity(
            opacity: value,

            child:
            Transform.translate(
              offset: Offset(
                0,
                20 * (1 - value),
              ),

              child: child,
            ),
          );
        },

        child: Container(
          decoration: BoxDecoration(
            color: isDark
                ? colors.surface
                : null,

            gradient: isDark
                ? null
                : LinearGradient(
              colors: [
                Colors.blue.shade50,
                Colors.purple.shade50,
                Colors.pink.shade50,
              ],

              begin:
              Alignment.topLeft,

              end:
              Alignment
                  .bottomRight,
            ),
          ),

          child: const SafeArea(
            child:
            SingleChildScrollView(
              padding:
              EdgeInsets.all(
                16,
              ),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment
                    .start,

                children: [

                  Align(alignment: Alignment.center,child:
                  TextHeadScreens(
                    text: ' Profile',
                    size: 32,
                  ),
                  ),

                  SizedBox(
                    height: 24,
                  ),

                  ProfileInfoContainer(),

                  SizedBox(
                    height: 18,
                  ),

                  ContainerSetting(),

                  SizedBox(
                    height: 28,
                  ),

                  Center(
                    child:
                    LogoutButton(),
                  ),
                ],
              ),
            ),
          ),
        ),

    );
  }
}