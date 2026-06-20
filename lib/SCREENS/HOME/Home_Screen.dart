import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../PROFILE/WIDGETS/TextHeadScreens .dart';
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
      begin: const Offset(0, 0.05),
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

  Widget _animated(Widget child) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: child,
      ),
    );
  }

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

            _header(),
            SizedBox(height: 12),

             ListtileHomescreen(),
            SizedBox(height: 12),

             Popular(),
            SizedBox(height: 25),

            _sectionTitle('Most Visited'),
             SizedBox(height: 12),

             MostVisited(),
            SizedBox(height: 25),

            _sectionTitle('Best Beaches'),
            SizedBox(height: 12),

            RowBeach(),
          ],
        ),
      ),
    );
  }

  // ---------------- HEADER ----------------

  Widget _header() {
    return _animated(
      const Center(
        child: TextHomeScreen(
          text: 'Travel',
          size: 32,
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