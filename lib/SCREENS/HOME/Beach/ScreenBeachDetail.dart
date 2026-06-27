import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenBeachDetail extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const ScreenBeachDetail({
    super.key,
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          _content(context),
        ],
      ),
    );
  }

  /// 🖼 BACKGROUND
  Widget _background() {
    return Positioned.fill(
      child: Stack(
        children: [
          Image.asset(image, fit: BoxFit.cover,
          height: double.infinity
          ),

          // overlay أذكى من اللون الصلب
          Container(

            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black87,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// 📦 CONTENT
  Widget _content(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          _topBar(context),
          const Spacer(),
          _bottomCard(context),
        ],
      ),
    );
  }

  /// 🔙 TOP BAR
  Widget _topBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.topLeft,
        child: CircleAvatar(
          backgroundColor: Colors.black54,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }

  /// 📦 BOTTOM CARD
  Widget _bottomCard(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TITLE
          Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          /// DESCRIPTION (مختصر ومهم)
          const Text(
            "Relax on beautiful beaches with clear water and amazing sunsets.",
            style: TextStyle(
              color: Colors.white70,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 16),

          /// INFO ROW
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _InfoItem(Icons.wb_sunny, "Sunny"),
              _InfoItem(Icons.water, "Sea"),
              _InfoItem(Icons.star, "4.8"),
            ],
          ),

          const SizedBox(height: 20),

          /// PRICE + BUTTON
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                price,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                onPressed: () {
                  context.push('/ticket', extra: name);
                },
                child: const Text(
                  "BOOK NOW",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 📌 INFO ITEM
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoItem(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.amber, size: 18),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}