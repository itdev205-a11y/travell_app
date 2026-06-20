import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'SCREENS.dart';
import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/HOME/Beach/ScreenBeachDetail.dart';
import 'SCREENS/HOME/MostVisited/MostVisited_DetalScreen.dart';
import 'SCREENS/HOME/Popular/Screen_PopularDetail.dart';
import 'SCREENS/LOGIN/Login_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/Aboutapp_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/NotificationScreen.dart';
import 'SCREENS/PROFILE/SCREENS/Payment_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/PrivacyScreen.dart';
import 'SCREENS/PROFILE/SCREENS/Support_screen.dart';
import 'SCREENS/PROFILE/SCREENS/Theme_Screen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/HOTEL/HotelDetailsScreen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/Restaurants/RestaurantDetailsScreen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/ServiceForTravel_Screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',

  routes: [

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),



    GoRoute(
      path: '/screen',
      pageBuilder: (context, state) {
        return CustomTransitionPage(
          key: state.pageKey,
          child: const Screens(),

          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0, 0.3),
                  end: Offset.zero,
                ).animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                ),
                child: child,
              ),
            );
          },
        );
      },
    ),




    GoRoute(
      path: '/paymentscreen',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const PaymentScreen()),
    ),




    GoRoute(
      path: '/privacyscreen',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const PrivacyScreen()),
    ),

    GoRoute(
      path: '/aboutappscreen',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const AboutappScreen()),
    ),







    GoRoute(
      path: '/theme',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const ThemeScreen()),
    ),





    GoRoute(
      path: '/support',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const SupportScreen()),
    ),

    GoRoute(
      path: '/notifications',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const NotificationScreen()),
    ),

    GoRoute(
      path: '/city-detail',
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return buildTransitionPage(
          state: state,
          child: ScreenCityDetail(
            image: data['image'],
            name: data['name'],
            description: data['description'],
            weather: data['weather'],
          ),
        );
      },
    ),

    GoRoute(
      path: '/beach-detail',
      pageBuilder: (context, state) {
        final data = state.extra as Map<String, dynamic>;

        return buildTransitionPage(
          state: state,
          child: ScreenBeachDetail(
            name: data['name'],
            image: data['image'],
            price: data['price'],
          ),
        );
      },
    ),







    GoRoute(
      path: '/mostvisited',
      pageBuilder: (context, state) {
        final data = (state.extra as Map<String, dynamic>?);

        return buildTransitionPage(
          state: state,
          child: MostvisitedDetailScreen(
            name: data?['name'] ?? '',
            image: data?['image'] ?? '',
            price: data?['price'] ?? '',
          ),
        );
      },
    ),




    GoRoute(
      path: '/ticket',
      pageBuilder: (context, state) {
        final destination = state.extra as String? ?? '';

        return buildTransitionPage(
          state: state,
          child: TicketScreen(destination: destination),
        );
      },
    ),




    GoRoute(
      path: '/restaurant-details',

      pageBuilder:
          (context, state) {
        final restaurant =
        state.extra
        as Map<String, dynamic>;

        return buildTransitionPage(
          state: state,

          child:
          RestaurantDetailsScreen(
            restaurant:
            restaurant,
          ),
        );
      },
    ),




  ],
);

CustomTransitionPage buildTransitionPage({
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}