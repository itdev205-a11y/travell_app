import 'package:flutter/material.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Hotels",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [

          _TextDiscover('⭐ Top Rated HOTELS', 25),
          const SizedBox(height: 20),

          _animatedHotelCard(
            delay: 100,
            image: "https://images.unsplash.com/photo-1542314831-068cd1dbfeeb",
            name: "Grand Palace Hotel",
            location: "Paris, France",
            price: "\$120 / night",
            rating: "4.8",
          ),

          _animatedHotelCard(
            delay: 250,
            image: "https://images.unsplash.com/photo-1566073771259-6a8506099945",
            name: "Sea View Resort",
            location: "Maldives",
            price: "\$200 / night",
            rating: "4.9",
          ),

          _animatedHotelCard(
            delay: 400,
            image: "https://images.unsplash.com/photo-1501117716987-c8e1ecb2108f",
            name: "Mountain Lodge",
            location: "Switzerland",
            price: "\$150 / night",
            rating: "4.7",
          ),
        ],
      ),
    );
  }

  /// 🎬 ANIMATION WRAPPER
  Widget _animatedHotelCard({
    required int delay,
    required String image,
    required String name,
    required String location,
    required String price,
    required String rating,
  }) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: 500 + delay),
      curve: Curves.easeOut,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 25 * (1 - value)),
            child: child,
          ),
        );
      },
      child: _hotelCard(
        image: image,
        name: name,
        location: location,
        price: price,
        rating: rating,
      ),
    );
  }

  /// 🏨 HOTEL CARD UI
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
                    const Icon(Icons.location_on,
                        size: 16, color: Colors.grey),
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
                        const Icon(Icons.star,
                            color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
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

  /// TEXT HEADER
  Widget _TextDiscover(String text, double size) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}