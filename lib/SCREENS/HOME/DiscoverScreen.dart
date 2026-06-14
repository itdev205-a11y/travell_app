import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'Beach/WIDGETS/Row_Beach.dart';
import 'MostVisited/MostVisited.dart';
import 'Popular/WIDGETS/Popular.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,

        /// 🌈 TITLE (Travel Gradient)
        title: ShaderMask(
          shaderCallback: (bounds) => const LinearGradient(
            colors: [
              Colors.blue,
              Colors.purple,
            ],
          ).createShader(bounds),

          child: const Text(
            "Travel",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing:4.8,
            ),
          ),
        ),

        /// 🔔 NOTIFICATIONS
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),

            child: Badge(
              label: const Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Colors.red,
              smallSize: 8,

              child: IconButton(

                icon: const Icon(
                  Icons.notifications_none,
                  color: Colors.black87,
                  size: 28,
                ),

                onPressed: () {
                  context.push('/notifications');
                },
              ),
            ),
          ),
        ],
      ),

      body:  TweenAnimationBuilder(


        tween: Tween<double>(begin: 0, end: 1),
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




        child: SingleChildScrollView(
            padding: const EdgeInsets.all(12),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ⭐ POPULAR
                _textDiscover('Popular', 25),
                const SizedBox(height: 10),
                const Popular(),

                const SizedBox(height: 25),

                /// 📍 MOST VISITED
                _textDiscover('Most Visited Destinations', 25),
                const SizedBox(height: 12),
                MostVisited(),

                const SizedBox(height: 25),

                /// 🏖 BEACHES
                _textDiscover('Best Beaches Near You', 25),
                const SizedBox(height: 12),
                const RowBeach(),

                const SizedBox(height: 20),
              ],
            ),
          ),
      ),

    );
  }

  Widget _textDiscover(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}