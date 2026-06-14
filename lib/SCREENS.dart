import 'package:app_travell/SCREENS/HOME/DiscoverScreen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/Hotels/HotelsScreen.dart';
import 'SCREENS/PROFILE/ProfileScreen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  int currentIndex = 0;

  final List<Widget> pages = const [
    DiscoverScreen(),
    HotelsScreen(),
    TicketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,

      /// BODY
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),

        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.2, 0),
                end: Offset.zero,
              ).animate(
                CurvedAnimation(
                  parent: animation,
                  curve: Curves.easeInOut,
                ),
              ),
              child: child,
            ),
          );
        },

        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: pages[currentIndex],
        ),
      ),

      /// BOTTOM NAV
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black12,
              offset: Offset(0, -5),
            ),
          ],
        ),

        child: CurvedNavigationBar(
          index: currentIndex,
          height: 60,

          backgroundColor: Colors.transparent,
          color: Colors.blue,
          buttonBackgroundColor: Colors.amber,

          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),

          items: const [

            Icon(Icons.home, size: 28, color: Colors.white),

            Icon(Icons.hotel, size: 28, color: Colors.white),

            Icon(Icons.airplane_ticket, size: 28, color: Colors.white),

            Icon(Icons.person, size: 28, color: Colors.white),
          ],

          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}