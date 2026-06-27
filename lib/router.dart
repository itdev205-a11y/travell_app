import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'SCREENS.dart';
import 'SCREENS/LOGIN/Login_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/Aboutapp_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/NotificationScreen.dart';
import 'SCREENS/PROFILE/SCREENS/Payment_Screen.dart';
import 'SCREENS/PROFILE/SCREENS/PrivacyScreen.dart';
import 'SCREENS/PROFILE/SCREENS/Support_screen.dart';
import 'SCREENS/PROFILE/SCREENS/Theme_Screen.dart';
import 'SCREENS/HOME/Beach/ScreenBeachDetail.dart';
import 'SCREENS/HOME/MostVisited/MostVisited_DetalScreen.dart';
import 'SCREENS/FLIGHTS/Ticket_Screen.dart';
import 'SCREENS/SERVISES FOR TRAVELL/HOTEL/WIDGETS_DetailsHotelsScreen/HotelInfoSection.dart';
import 'SCREENS/SERVISES FOR TRAVELL/Restaurants/RestaurantDetailsScreen.dart';

class AppRoutes {
  static const login = '/login';
  static const home = '/screen';
  static const payment = '/paymentscreen';
  static const privacy = '/privacyscreen';
  static const about = '/aboutappscreen';
  static const theme = '/theme';
  static const support = '/support';
  static const notifications = '/notifications';
  static const beach = '/beach-detail';
  static const mostVisited = '/mostvisited';
  static const ticket = '/ticket';
  static const restaurant = '/restaurant_details';
  static const hotel = '/hotel_details' ;
}

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.login,

  routes: [

    _route(
      path: AppRoutes.login,
      child: const LoginScreen(),
    ),

    _route(
      path: AppRoutes.home,
      child: const Screens(),
      slide: true,
    ),

    _route(
      path: AppRoutes.payment,
      child: const PaymentScreen(),
    ),

    _route(
      path: AppRoutes.privacy,
      child: const PrivacyScreen(),
    ),

    _route(
      path: AppRoutes.about,
      child: const AboutAppScreen(),
    ),

    _route(
      path: AppRoutes.theme,
      child: const ThemeScreen(),
    ),

    _route(
      path: AppRoutes.support,
      child: const SupportScreen(),
    ),

    _route(
      path: AppRoutes.notifications,
      child: const NotificationScreen(),
    ),

    GoRoute(
      path: AppRoutes.beach,

      pageBuilder: (context, state) {
        final data =
        state.extra as Map<String, dynamic>;

        return _page(
          state,
          ScreenBeachDetail(
            name: data['name'],
            image: data['image'],
            price: data['price'],
          ),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.mostVisited,

      pageBuilder: (context, state) {
        final data =
        state.extra as Map<String, dynamic>;

        return _page(
          state,
          MostvisitedDetailScreen(
            name: data['name'],
            image: data['image'],
            price: data['price'],
          ),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.ticket,

      pageBuilder: (context, state) {
        return _page(
          state,
          TicketScreen(
            destination:
            state.extra as String,
          ),
        );
      },
    ),

    GoRoute(
      path: AppRoutes.restaurant,

      pageBuilder: (context, state) {
        return _page(
          state,
          RestaurantDetailsScreen(
            restaurant:
            state.extra as Map<String, dynamic>,
          ),
        );
      },
    ),


    GoRoute(
      path: AppRoutes.hotel,

      pageBuilder: (context, state) {
        return _page(
          state,
          HotelDetailScreen  (
            hotel:
            state.extra as Map<String, dynamic>,
          ),
        );
      },
    ),


  ],
);

GoRoute _route({
  required String path,
  required Widget child,
  bool slide = false,
}) {
  return GoRoute(
    path: path,

    pageBuilder: (context, state) =>
    slide
        ? _slidePage(state, child)
        : _page(state, child),
  );
}

CustomTransitionPage _page(
    GoRouterState state,
    Widget child,
    ) {
  return CustomTransitionPage(
    key: state.pageKey,

    child: child,

    transitionDuration:
    const Duration(milliseconds: 300),

    transitionsBuilder:
        (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,
        child: child,
      );
    },
  );
}

CustomTransitionPage _slidePage(
    GoRouterState state,
    Widget child,
    ) {
  return CustomTransitionPage(
    key: state.pageKey,

    child: child,

    transitionsBuilder:
        (context, animation, _, child) {
      return FadeTransition(
        opacity: animation,

        child: SlideTransition(
          position:
          Tween(
            begin: const Offset(0, .3),
            end: Offset.zero,
          ).animate(animation),

          child: child,
        ),
      );
    },
  );
}