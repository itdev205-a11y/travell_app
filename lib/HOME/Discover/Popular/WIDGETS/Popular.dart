import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CityPopular extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String price;

  const CityPopular({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.description,
  });

  @override
  State<CityPopular> createState() => _CityPopularState();
}

class _CityPopularState extends State<CityPopular> {
  final String apikey = "40e0e0793544e21ab040fdcf1ac2df57";

  Map<String, dynamic>? weather;

  Future<void> getWeather() async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather"
        "?q=${widget.name}"
        "&appid=$apikey"
        "&units=metric";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      setState(() {
        weather = json.decode(response.body);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/city-detail',
          extra: {
            'image': widget.image,
            'name': widget.name,
            'description': widget.description,
          },
        );
      },
      child: Container(
        width: 340,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // 🏙 IMAGE
            Container(
              height: 210,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.asset(
                        widget.image,
                        fit: BoxFit.cover,
                      ),
                    ),

                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.75),
                            ],
                          ),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 12,
                      left: 12,
                      right: 12,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            widget.price,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            // 🌦 WEATHER
            Container(
              width: 130,
              height: 210,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 20),

                  Expanded(
                    child: Center(
                      child: weather == null
                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                          : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${weather!["main"]["temp"]}°",
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            weather!["weather"][0]["description"],
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [

          CityPopular(
            price: 'From 355\$',
            image: 'assets/images/city/DUBAI.jpg',
            name: 'Dubai',
            description: 'Dubai city',
          ),

          CityPopular(
            price: 'From 500\$',
            image: 'assets/images/city/moscow.jpg',
            name: 'Moscow',
            description: 'Moscow city',
          ),

          CityPopular(
            price: 'From 450\$',
            image: 'assets/images/city/paris.jpg',
            name: 'Paris',
            description: 'Paris city',
          ),
        ],
      ),
    );
  }
}
