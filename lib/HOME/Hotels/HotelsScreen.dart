

import 'package:flutter/material.dart';

class HotelsScreen extends StatelessWidget {
  const HotelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [

        _TextDiscover('⭐ Top Rated Hotels', 25),
        const SizedBox(height: 20),

        // 🏨 Hotel Card 1
        _hotelCard(
          image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
          name: "Grand Palace Hotel",
          location: "Paris, France",
          price: "\$120 / night",
          rating: "4.8",
        ),

        _hotelCard(
          image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
          name: "Sea View Resort",
          location: "Maldives",
          price: "\$200 / night",
          rating: "4.9",
        ),

        _hotelCard(
          image: "https://images.unsplash.com/photo-1501117716987-c8e1ecb2108f",
          name: "Mountain Lodge",
          location: "Switzerland",
          price: "\$150 / night",
          rating: "4.7",
        ),
      ],
    );
  }

  Widget _hotelCard({
    required String image,
    required String name,
    required String location,
    required String price,
    required String rating,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(15),
            ),
            child: Image.network(
              image,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 5),

                Row(
                  children: [
                    const Icon(Icons.location_on, size: 16, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(location),
                  ],
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        Text(rating),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _TextDiscover(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}