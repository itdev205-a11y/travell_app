import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
    _startAnimation();
  }

  void _startAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _slide = Tween(
      begin: const Offset(0, .15),
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
        child: _content(),
      ),
    );
  }

  // ---------------- CONTENT ----------------

  Widget _content() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: _titleSection(),
          ),

          const SizedBox(width: 12),

          _filterButton(),
        ],
      ),
    );
  }

  // ---------------- TITLE ----------------

  Widget _titleSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _GradientTitle(),

        SizedBox(height: 4),

        Text(
          'Discover destinations and offers',
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  // ---------------- FILTER ----------------

  Widget _filterButton() {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.tune),
      ),
    );
  }
}

// ---------------- GRADIENT TITLE ----------------

class _GradientTitle extends StatelessWidget {
  const _GradientTitle();

  @override
  Widget build(BuildContext context) {
    return Text(
      'Find Your Tour',
      style: GoogleFonts.aBeeZee(
        fontSize: 26,
        fontWeight: FontWeight.bold,
        foreground: Paint()
          ..shader = const LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ).createShader(
            const Rect.fromLTWH(0, 0, 220, 70),
          ),
      ),
    );
  }
}