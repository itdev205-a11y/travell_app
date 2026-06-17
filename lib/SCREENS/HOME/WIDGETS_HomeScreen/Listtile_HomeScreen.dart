import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListtileHomescreen extends StatefulWidget {
  const ListtileHomescreen({super.key});

  @override
  State<ListtileHomescreen> createState() => _ListtileHomescreenState();
}

class _ListtileHomescreenState extends State<ListtileHomescreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(_controller);

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(_controller);

    _controller.forward();
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
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),

          title: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ).createShader(bounds),

            child: const Text(
              'FIND YOUR TOUR',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          subtitle: const Text(
            'Discover destinations and offers',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),

          trailing:  Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications_none),
                color: Colors.black87,
                onPressed: () {
                  context.push('/notifications');
                },
              ),

              // نقطة إشعار صغيرة (badge)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}