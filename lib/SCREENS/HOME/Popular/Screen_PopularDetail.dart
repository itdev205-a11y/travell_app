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
      body: Stack(
        children: [

          /// 🌄 Background
          Positioned.fill(
            child: Image.asset(image, fit: BoxFit.cover),
          ),



          /// 🔙 Back
          Positioned(
            top: 50,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.black45,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          /// 🏙️ TITLE + DESCRIPTION (TOP)
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          /// 📦 BIG INFO CARD
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,

            child: ClipRRect(
              borderRadius: BorderRadius.circular(28),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),

                child: Container(
                  padding: const EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(28),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.2),
                    ),
                  ),

                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      /// 🌤️ WEATHER
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,

                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.wb_sunny,
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                "$temp°",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),

                          Text(
                            desc ?? '',
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      /// 💰 PRICE CARD
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(18),
                        ),

                        child: const Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,

                          children: [
                            Text(
                              "Price From",
                              style: TextStyle(
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              "\$350",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 20),

                      /// 🔥 BOOK BUTTON
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(
                              vertical: 14,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(18),
                            ),
                          ),
                          onPressed: () {
                            context.push(
                              '/ticket',
                              extra: {
                                'destination': name,
                              },
                            );
                          },
                          child: const Text(
                            "BOOK NOW",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}