import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import 'Beach/WIDGETS/Row_Beach.dart';
import 'MostVisited/MostVisited.dart';
import 'Popular/WIDGETS/Popular.dart';
import 'WIDGETS_HomeScreen/Listtile_HomeScreen.dart';
import 'WIDGETS_HomeScreen/Text_HomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _initAnimations();
    _initNotifications();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, .05),
      end: Offset.zero,
    ).animate(_fade);
  }

  Future<void> _initNotifications() async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (!mounted) return;

      context.push('/notifications');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // ---------------- ANIMATION ----------------

  Widget _animated(Widget child) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: child,
      ),
    );
  }

  // ---------------- PAGE PADDING ----------------

  EdgeInsets _pagePadding(BuildContext context) {
    return EdgeInsets.only(
      left: 12,
      right: 12,
      top: 12,
      bottom: MediaQuery.of(context).padding.bottom + 90,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          padding: _pagePadding(context),
          children: [
            _header(context),

            const SizedBox(height: 16),

            const ListtileHomescreen(),

            const SizedBox(height: 16),

            const Popular(),

            const SizedBox(height: 24),

            _sectionTitle('Most Visited'),

            const SizedBox(height: 12),

            const MostVisited(),

            const SizedBox(height: 24),

            _sectionTitle('Best Beaches'),

            const SizedBox(height: 12),

            const RowBeach(),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _header(BuildContext context) {
    return _animated(
      SizedBox(
        height: 70,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const TextHomeScreen(
              text: 'Travel',
              size: 32,
              letterSpacing: 4,
            ),

            Positioned(
              right: 0,
              child: _notificationIcon(context),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- NOTIFICATION ----------------

  Widget _notificationIcon(
      BuildContext context, {
        bool hasNotifications = true,
      }) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () {
            context.push('/notifications');
          },
          icon: Lottie.asset(
            'assets/animations/not.json',
            width: 50,
            height: 50,
            repeat: true,
          ),
        ),

        if (hasNotifications) _notificationDot(),
      ],
    );
  }

  Widget _notificationDot() {
    return Positioned(
      right: 12,
      top: 12,
      child: Container(
        width: 8,
        height: 8,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  // ---------------- SECTION TITLE ----------------

  Widget _sectionTitle(String title) {
    return _animated(
      Align(
        alignment: Alignment.centerLeft,
        child: TextHomeScreen(
          text: title,
          size: 25,
        ),
      ),
    );
  }
}