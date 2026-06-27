

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/HOME/Home_Screen.dart';
import 'SCREENS/PROFILE/ProfileScreen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/ServiceForTravel_Screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  /// 📌 رقم الصفحة الحالية
  int currentIndex = 0;

  /// 📌 كل الصفحات داخل التطبيق
  final List<Widget> pages = const [

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

      /// ================= PAGE VIEW =================
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),

        /// يعطي animation عند تغيير الصفحة
        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: pages[currentIndex],
        ),
      ),

      /// ================= BOTTOM NAV BAR =================
      bottomNavigationBar: Container(
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),
        height: 200,

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),

          /// ظل خفيف احترافي
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(isDark ? 0.3 : 0.1),
              blurRadius: 40,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: CurvedNavigationBar(
            /// 📌 الصفحة الحالية
            index: currentIndex,

            height: 55,

            /// خلفية خلف الـ navbar
            backgroundColor: Colors.transparent,

            /// لون الشريط نفسه
            color: isDark ? Colors.grey.shade900 : Colors.white,

            /// لون الزر المتحرك (active)
            buttonBackgroundColor: Colors.white,

            animationDuration: const Duration(milliseconds: 300),

            /// ================= ICONS =================
            items: [
              _icon(Icons.home, 0),
              _icon(Icons.design_services_sharp, 1),
              _icon(Icons.flight_takeoff, 2),
              _icon(Icons.person, 3),
            ],

            /// عند الضغط على أي أيقونة
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

  /// ================= ICON BUILDER =================
  Widget _icon(IconData icon, int index) {
    final selected = currentIndex == index;

    return Icon(
      icon,

      /// تكبير الأيقونة النشطة فقط
      size: selected ? 34 : 26,

      /// لون الأيقونة
      color: selected ? Colors.black : Colors.grey,
    );
  }
}