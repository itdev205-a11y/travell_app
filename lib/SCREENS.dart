import 'package:app_travell/SCREENS/HOME/Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/PROFILE/ProfileScreen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/ServiceForTravel_Screen.dart';

class Screens extends StatefulWidget {
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {

  // 👇 رقم الصفحة الحالية (0 = Home)
  int currentIndex = 0;

  // 👇 قائمة الصفحات التي يتم التنقل بينها
  final pages = const [
    HomeScreen(),
    ServiceForTravelScreen(),
    TicketScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {

    // 👇 ألوان الثيم الحالي (Light/Dark)
    final colors = Theme.of(context).colorScheme;

    // 👇 هل الوضع Dark أم لا
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(

      // 👇 يسمح للمحتوى أن يظهر خلف الـ Bottom Bar
      extendBody: true,

      // 👇 عرض الصفحة الحالية مع أنيميشن تغيير
      body: AnimatedSwitcher(

        // 👇 مدة الانتقال بين الصفحات
        duration: const Duration(milliseconds: 350),

        // 👇 شكل الانتقال بين الصفحات (Fade + Slide)
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation, // 👈 تدرج شفاف


            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(.1, 1), // 👈 يبدأ من اليمين قليلًا
                end: Offset.zero, // 👈 ثم يرجع لمكانه الطبيعي
              ).animate(animation),

              child: child,
            ),
          );
        },

        // 👇 تغيير الصفحة حسب index مع Key لإجبار إعادة البناء
        child: KeyedSubtree(
          key: ValueKey(currentIndex),
          child: pages[currentIndex],
        ),
      ),

      // =========================
      // 📱 Bottom Navigation Bar
      // =========================
      bottomNavigationBar: Container(

        // 👇 مسافة من الأطراف (شكل Floating)
        margin: const EdgeInsets.fromLTRB(18, 0, 18, 18),

        decoration: BoxDecoration(

          // 👇 حواف دائرية
          borderRadius: BorderRadius.circular(30),

          // 👇 لون الخلفية
          color: Colors.blue,

          // 👇 ظل يعطي عمق
          boxShadow: [
            BoxShadow(
              color: colors.shadow.withOpacity(
                isDark ? .25 : .08,
              ),
              blurRadius: 22,
              offset: const Offset(0, 10),
            ),
          ],
        ),

        // 👇 قص المحتوى ليبقى داخل الحواف
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),

          child: CurvedNavigationBar(

            // 👇 الصفحة الحالية
            index: currentIndex,

            // 👇 ارتفاع البار
            height: 50,

            // 👇 خلفية شفافة
            backgroundColor: Colors.transparent,

            // 👇 لون شريط التنقل
            color: isDark
                ? colors.surfaceContainerHighest
                : colors.surface,

            // 👇 لون الزر النشط
            buttonBackgroundColor: colors.primary,

            // 👇 مدة حركة الأيقونات
            animationDuration: const Duration(milliseconds: 300),

            // 👇 نوع الحركة (سلسة واحترافية)
            animationCurve: Curves.fastOutSlowIn,

            // 👇 الأيقونات داخل البار
            items: [
              _navIcon(Icons.home_rounded, 0, colors),
              _navIcon(Icons.grid_view_rounded, 1, colors),
              _navIcon(Icons.airplane_ticket_rounded, 2, colors),
              _navIcon(Icons.person_rounded, 3, colors),
            ],

            // 👇 عند الضغط على أي أيقونة
            onTap: (index) {
              setState(() {
                currentIndex = index; // 👈 تغيير الصفحة
              });
            },
          ),
        ),
      ),
    );
  }

  // =========================
  // 🎯 تصميم الأيقونة
  // =========================
  Widget _navIcon(IconData icon, int index, ColorScheme colors) {

    // 👇 هل هذه الأيقونة هي المختارة؟
    final selected = currentIndex == index;

    return AnimatedScale(

      // 👇 تكبير الأيقونة إذا كانت نشطة
      scale: selected ? 1.3 : 1,

      // 👇 مدة التكبير
      duration: const Duration(milliseconds: 150),

      child: Icon(

        icon,

        size: 25,

        // 👇 تغيير اللون حسب الحالة
        color: selected
            ? colors.onPrimary
            : colors.onSurfaceVariant,
      ),
    );
  }
}