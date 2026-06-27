import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../Servise_Weather/Weather Service.dart';


class Popular extends StatelessWidget {
  const Popular({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        itemCount: cities.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          final city = cities[index];

          return CityPopular(
            image: city['image']!,
            name: city['name']!,
            description: city['description']!,
            price: city['price']!,
          );
        },
      ),
    );
  }
}

/// 🌍 DATA (inside same page)
final List<Map<String, String>> cities = [
  {
    'image': 'assets/images/city/DUBAI.jpg',
    'name': 'Dubai',
    'description': 'Luxury city of skyscrapers and desert adventures',
    'price': 'From 355\$',
  },
  {
    'image': 'assets/images/city/moscow.jpg',
    'name': 'Moscow',
    'description': 'Historic capital of Russia with rich culture',
    'price': 'From 500\$',
  },
  {
    'image': 'assets/images/city/paris.jpg',
    'name': 'Paris',
    'description': 'City of love, fashion and the Eiffel Tower',
    'price': 'From 450\$',
  },
];

/// 🏙️ CITY CARD
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
  Map<String, dynamic>? weather;

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  Future<void> getWeather() async {
    final result = await WeatherService.getWeather(widget.name);

    if (mounted) {
      setState(() {
        weather = result;
      });
    }
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
            'weather': weather,
          },
        );
      },
      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            children: [
              /// 🖼 IMAGE
              Positioned.fill(
                child: Image.asset(
                  widget.image,
                  fit: BoxFit.cover,
                ),
              ),

              /// 🌑 DARK GRADIENT
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.3),
                      ],
                    ),
                  ),
                ),
              ),

              /// 🌤 WEATHER
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: weather == null
                      ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: Colors.white,
                    ),
                  )
                      : Column(
                    children: [
                      const Icon(
                        Icons.wb_sunny,
                        color: Colors.orange,
                        size: 20,
                      ),
                      Text(
                        "${weather!["main"]["temp"].round()}°",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// 🏙 INFO
              Positioned(
                left: 10,
                bottom: 10,
                right: 10,
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
    );
  }
}