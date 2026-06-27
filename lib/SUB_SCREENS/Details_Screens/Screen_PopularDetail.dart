import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ScreenCityDetail extends StatelessWidget {
  final String name;
  final String description;
  final String image;
  final Map<String, dynamic>? weather;

  const ScreenCityDetail({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    final temp = weather?["main"]?["temp"]?.round();
    final desc = weather?["weather"]?[0]?["description"];

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          _backgroundImage(),
          _backButton(context),
          _glassPanel(context, temp, desc),
        ],
      ),
    );
  }

  // ================= BACKGROUND =================
  Widget _backgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        image,
        fit: BoxFit.cover,
      ),
    );
  }

  // ================= BACK BUTTON =================
  Widget _backButton(BuildContext context) {
    return Positioned(
      top: 50,
      left: 16,
      child: _glass(
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }

  // ================= GLASS PANEL =================
  Widget _glassPanel(BuildContext context, int? temp, String? desc) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: _glass(
        blur: 20,
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(28),
            ),
            color: Colors.white.withOpacity(0.15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // small handle
              Center(
                child: Container(
                  width: 50,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // title
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              // description
              Text(
                description,
                style: const TextStyle(
                  color: Colors.white70,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 16),

              // weather + price row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _infoBox("${temp ?? '--'}°", "Temp"),
                  _infoBox(desc ?? '-', "Weather"),
                  _infoBox("\$350", "Price"),
                ],
              ),

              const SizedBox(height: 20),

              // button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  onPressed: () {
                    context.push('/ticket', extra: name);
                  },
                  child: const Text("BOOK NOW"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ================= INFO BOX =================
  Widget _infoBox(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white70,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // ================= GLASS EFFECT =================
  Widget _glass({required Widget child, double blur = 10}) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          color: Colors.white.withOpacity(0.1),
          child: child,
        ),
      ),
    );
  }
}