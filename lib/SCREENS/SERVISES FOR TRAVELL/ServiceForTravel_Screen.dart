import 'package:flutter/material.dart';

import '../PROFILE/WIDGETS/TextHeadScreens .dart';
import 'HOTEL/Currency/CurrencyScreen.dart';
import 'HOTEL/HotelsScreen.dart';
import 'Restaurants/Restaurants_Screen.dart';

class ServiceForTravelScreen extends StatelessWidget {
  const ServiceForTravelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
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

      child: DefaultTabController(
        length: 3,

        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: colors.surface,
            centerTitle: true,
            toolbarHeight: 75,

            title: const Padding(
              padding: EdgeInsets.only(top: 6),
              child: TextHeadScreens(
                text: 'Services For Travel',
                size: 32,
              ),
            ),

            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(72),

              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 6, 16, 14),

                child: Container(
                  height: 52,
                  decoration: BoxDecoration(
                    color: isDark
                        ? colors.surfaceContainer
                        : Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorSize: TabBarIndicatorSize.tab,

                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          colors.primary,
                          colors.secondary,
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: colors.shadow.withOpacity(0.15),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),

                    labelColor: colors.onPrimary,
                    unselectedLabelColor: colors.onSurfaceVariant,

                    tabs: const [
                      Tab(
                        height: 52,
                        text: "Restaurant",
                      ),
                      Tab(
                        height: 52,
                        text: "Hotels",
                      ),
                      Tab(
                        height: 52,
                        text: "Currency",
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          body: const TabBarView(
            physics: BouncingScrollPhysics(),
            children: [
              RestaurantsScreen(),
              HotelsScreen(),
              CurrencyScreen(),
            ],
          ),
        ),
      ),
    );
  }
}