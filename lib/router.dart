import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'Navigator/SCREENS.dart';
import 'LOGIN/Login_Screen/Login_Screen.dart';
import 'PROFILE/SUB_PAYMENTINFO/Payment_Screen.dart';
import 'PROFILE/SUB_SETTINGS/SCREENS/Language_Screen.dart';
import 'PROFILE/SUB_SETTINGS/SCREENS/Support_screen.dart';
import 'PROFILE/SUB_SETTINGS/SCREENS/Theme_Screen.dart';
import 'HOME/notifications/Notification.dart';
import 'HOME/Discover/Beach/ScreenBeachDetail.dart';
import 'HOME/Discover/MostVisited/MostVisited_DetalScreen.dart';
import 'HOME/Discover/Popular/Screen_PopularDetail.dart';
import 'HOME/Flights/Ticket_Screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/login',

  routes: [

    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),

    GoRoute(
      path: '/screen',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const Screens()),
    ),

    GoRoute(
      path: '/paymentscreen',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const PaymentScreen()),
    ),

    GoRoute(
      path: '/language',
      pageBuilder: (context, state) =>
          buildTransitionPage(state: state, child: const LanguageScreen()),
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
        final data = state.extra as Map<String, dynamic>;

        return buildTransitionPage(
          state: state,
          child: TicketScreen(
            destination: data['destination'],
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