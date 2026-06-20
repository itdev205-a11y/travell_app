import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

import 'Text_HomeScreen.dart';

class ListtileHomescreen extends StatefulWidget {
  const ListtileHomescreen({super.key});

  @override
  State<ListtileHomescreen> createState() => _ListtileHomescreenState();
}

class _ListtileHomescreenState extends State<ListtileHomescreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _fade;
  late final Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();
    _initAnimations();
  }

  void _initAnimations() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(_fade);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fade,
      child: SlideTransition(
        position: _slide,
        child: _content(context),
      ),
    );
  }

  // ---------------- UI ROOT ----------------

  Widget _content(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _titleSection(),
          _notificationIcon(context),
        ],
      ),
    );
  }

  // ---------------- TITLE ----------------

  Widget _titleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _gradientTitle(),
        const SizedBox(height: 4),
        const Text(
          'Discover destinations and offers',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _gradientTitle() {
    return Text(
      'Find Your Tour',
      style: GoogleFonts.aBeeZee(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [Colors.blue, Colors.purple],
          ).createShader(
            const Rect.fromLTWH(0, 0, 200, 70),
          ),
      ),
    );
  }

  // ---------------- NOTIFICATION ----------------

  Widget _notificationIcon(BuildContext context, {bool hasNotifications = true}) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        IconButton(
          onPressed: () => context.push('/notifications'),
          icon: Lottie.asset(
            'assets/animations/not.json',
            width: 60,
            height: 60,
            repeat: true, // ثابت (أفضل UX من ربطه بالحالة مباشرة)
          ),
        ),

        if (hasNotifications) _notificationDot(),
      ],
    );
  }

  Widget _notificationDot() {
    return Positioned(
      right: 6,
      top: 6,
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
}