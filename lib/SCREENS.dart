import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:app_travell/SCREENS/HOME/Home_Screen.dart';
import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/PROFILE/ProfileScreen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/ServiceForTravel_Screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;

  /// 📌 الصفحات
  final pages = const [
    HomeScreen(),
    ServiceForTravelScreen(),
    TicketScreen(destination: ''),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,

      /// 📌 الصفحة الحالية
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),

        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(.1, 1),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            ),
          );
        },

        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: pages[currentIndex],
        ),
      ),

      /// 📌 Bottom Navigation
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.blue,
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withOpacity(isDark ? .25 : .08),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: CurvedNavigationBar(
            index: currentIndex,
            height: 50,
            backgroundColor: Colors.transparent,
            color: isDark
                ? colors.surfaceContainerHighest
                : colors.surface,
            buttonBackgroundColor: colors.primary,
            animationDuration: const Duration(milliseconds: 300),
            animationCurve: Curves.fastOutSlowIn,

            items: [
              _navIcon(Icons.home_rounded, 0, colors),
              _navIcon(Icons.grid_view_rounded, 1, colors),
              _navIcon(Icons.airplane_ticket_rounded, 2, colors),
              _navIcon(Icons.person_rounded, 3, colors),
            ],

            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }

  /// 🎯 Nav Icon
  Widget _navIcon(IconData icon, int index, ColorScheme colors) {
    final selected = currentIndex == index;

    return AnimatedScale(
      scale: selected ? 1.3 : 1,
      duration: const Duration(milliseconds: 150),
      child: Icon(
        icon,
        size: 25,
        color: selected
            ? colors.onPrimary
            : colors.onSurfaceVariant,
      ),
    );
  }
}