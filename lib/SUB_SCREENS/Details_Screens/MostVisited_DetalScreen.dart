import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostvisitedDetailScreen extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const MostvisitedDetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _background(),
          _gradient(),
          _content(context),
          _bookingBar(context),
        ],
      ),
    );
  }

  // ================= BACKGROUND =================
  Widget _background() {
    return Positioned.fill(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  // dark gradient for readability
  Widget _gradient() {
    return Positioned.fill(
      child: Container(
        height: 400,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black26,
              Colors.black87,
            ],
          ),
        ),
      ),
    );
  }

  // ================= CONTENT =================
  Widget _content(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),

          // back button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: _glass(
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),

          const SizedBox(height: 400),

          // GLASS INFO CONTAINER
          _glass(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Explore breathtaking views, culture and unforgettable experiences.",
                    style: TextStyle(
                      color: Colors.white70,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 20),

                  const Text(
                    "Highlights",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 12),

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _InfoItem(Icons.landscape, "Views"),
                      _InfoItem(Icons.hotel, "Hotels"),
                      _InfoItem(Icons.flight, "Flights"),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 120),
        ],
      ),
    );
  }

  // ================= BOOKING BAR =================
  Widget _bookingBar(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 16,
      right: 16,
      child: _glass(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Price",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 26,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  context.push('/ticket', extra: name);
                },
                child: const Text("BOOK NOW"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= GLASS WIDGET =================
  Widget _glass({required Widget child}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.12),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

// ================= INFO ITEM =================
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoItem(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 22,
          backgroundColor: Colors.white.withOpacity(0.15),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(color: Colors.white70),
        ),
      ],
    );
  }
}