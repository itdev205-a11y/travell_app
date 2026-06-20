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
      body: Column(
        children: [
          // ================= TOP IMAGE =================
          Stack(
            children: [
              Image.asset(
                image,
                height: 350,
                width: double.infinity,
                fit: BoxFit.cover,
              ),

              // BACK BUTTON
              Positioned(
                top: 40,
                left: 10,
                child: CircleAvatar(
                  backgroundColor: Colors.black54,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // ================= NAME + DESCRIPTION =================
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  description,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // ================= WEATHER =================
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blue.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$temp°",
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  desc ?? '',
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // ================= PRICE =================
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Price From"),
                Text(
                  "\$350",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),

          const Spacer(),

          // ================= BOOK BUTTON =================
          Padding(
            padding: const EdgeInsets.all(16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
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
            ),
          ),
        ],
      ),
    );
  }
}