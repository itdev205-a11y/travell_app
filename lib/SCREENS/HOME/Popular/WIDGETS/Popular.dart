import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../Services/Weather Service.dart';




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
  final WeatherService weatherService = WeatherService();

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
            'weather': weather, // 👈 من الـ state مش widget
          },
        );
      },

      child: Container(
        width: 250,
        margin: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 10,
        ),

        child:
            Container(
              height: 210,
              width: 200,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
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



                    /// 🌤️ WEATHER (TOP RIGHT)
                    Positioned(
                      right: 12,
                      bottom: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.45),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: Colors.white.withOpacity(.2),
                          ),
                        ),

                        child: weather == null
                            ? const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                            : Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.wb_sunny,
                              color: Colors.orange,
                              size: 22,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "${weather!["main"]["temp"].round()}°",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 3),
                            SizedBox(
                              width: 70,
                              child: Text(
                                weather!["weather"][0]["description"],
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.white70,
                                  fontSize: 11,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    /// 🏙️ NAME + PRICE
                    Positioned(
                      left: 12,
                      right: 12,
                      bottom: 12,
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
                          const SizedBox(height: 4),
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

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),

        child: Row(
          children: [
            CityPopular(
              price: 'From 355\$',
              image: 'assets/images/city/DUBAI.jpg',
              name: 'Dubai',
              description: 'Luxury city of skyscrapers and desert adventures',
            ),

            CityPopular(
              price: 'From 500\$',
              image: 'assets/images/city/moscow.jpg',
              name: 'Moscow',
              description: 'Historic capital of Russia with rich culture',
            ),

            CityPopular(
              price: 'From 450\$',
              image: 'assets/images/city/paris.jpg',
              name: 'Paris',
              description: 'City of love, fashion and the Eiffel Tower',
            ),

            SizedBox(width: 12),
          ],
        ),
      ),
    );
  }
}