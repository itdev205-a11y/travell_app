import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowBeach extends StatelessWidget {
  const RowBeach({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> beaches = [
      {
        'image': 'assets/images/beach/beachsharam.jpg',
        'name': 'Sharm El Sheikh',
        'price': '\$120 / Day',
      },
      {
        'image': 'assets/images/beach/maldiv.jpg',
        'name': 'Maldives',
        'price': '\$140 / Day',
      },
      {
        'image': 'assets/images/beach/beachsharam.jpg',
        'name': 'Bali',
        'price': '\$110 / Day',
      },
      {
        'image': 'assets/images/beach/maldiv.jpg',
        'name': 'Phuket',
        'price': '\$130 / Day',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: beaches.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.78,
      ),
      itemBuilder: (context, index) {
        final beach = beaches[index];

        return BeachPhoto(
          image: beach['image']!,
          name: beach['name']!,
          price: beach['price']!,
        );
      },
    );
  }
}

class BeachPhoto extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const BeachPhoto({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/beach-detail',
          extra: {
            'name': name,
            'image': image,
            'price': price,
          },
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            /// IMAGE
            Positioned.fill(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
              ),
            ),

            /// GRADIENT
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.8),
                    ],
                  ),
                ),
              ),
            ),

            /// CONTENT
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.10),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.2),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}