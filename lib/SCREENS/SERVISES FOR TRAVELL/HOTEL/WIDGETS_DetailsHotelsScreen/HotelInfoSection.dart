

import 'package:flutter/material.dart';

class HotelInfoSection extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelInfoSection({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            hotel["name"] ?? "",
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          Text(
            hotel["location"] ?? "",
            style: const TextStyle(color: Colors.grey),
          ),

          const SizedBox(height: 15),

          Text(
            "Price: ${hotel["price"] ?? ""} / night",
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber),
              const SizedBox(width: 5),
              Text("${hotel["rating"]}"),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "About this hotel",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          const Text(
            "This hotel offers luxury rooms, sea view, free WiFi and premium service. Perfect for vacation and relaxation.",
            style: TextStyle(color: Colors.grey, height: 1.5),
          ),
        ],
      ),
    );
  }
}