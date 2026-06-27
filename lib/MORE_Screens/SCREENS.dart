import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../FLIGHT/Fight_Screen.dart';
import '../HOME/Home_Screen.dart';
import '../PROFILE/ProfileScreen.dart';
import '../SERVISE/Service_Screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;

  static const List<Widget> _pages = [
    HomeScreen(),
    ServiceScreen(),
    FlightScreen(destination: ''),
    ProfileScreen(),
  ];

  static const List<IconData> _icons = [
    Icons.home,
    Icons.design_services,
    Icons.flight_takeoff,
    Icons.person,
  ];

  void _changePage(int index) {
    if (index == currentIndex) return;

    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBody: true,

      /// يحافظ على حالة كل صفحة
      body: IndexedStack(
        index: currentIndex,
        children: _pages,
      ),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(18, 0, 18, 18,
        ),

        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius:
            BorderRadius.circular(30),

            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(
                  isDark ? .25 : .08,
                ),
                blurRadius: 25,
                offset: const Offset(0, 8),
              ),
            ],
          ),

          child: CurvedNavigationBar(
            index: currentIndex,

            height: 60,

            backgroundColor:
            Colors.transparent,

            color: isDark ? Colors.grey.shade900 : Colors.white,

            buttonBackgroundColor:
            isDark ? Colors.white : Colors.black,

            animationDuration:
            const Duration(
              milliseconds: 250,
            ),

            items: List.generate(
              _icons.length,
                  (index) => _buildIcon(
                icon: _icons[index],
                selected:
                currentIndex == index,
                isDark: isDark,
              ),
            ),

            onTap: _changePage,
          ),
        ),
      ),
    );
  }

  Widget _buildIcon({
    required IconData icon,
    required bool selected,
    required bool isDark,
  }) {
    return AnimatedScale(
      duration:
      const Duration(
        milliseconds: 250,
      ),

      scale: selected ? 1.15 : 1,

      child: Icon(
        icon,
        size: 28,

        color: selected
            ? (isDark
            ? Colors.black
            : Colors.white)
            : Colors.grey,
      ),
    );
  }
}