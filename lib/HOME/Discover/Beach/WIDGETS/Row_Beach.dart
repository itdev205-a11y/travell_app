import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowBeach extends StatelessWidget {
  const RowBeach({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 220,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: PageView(
          children: const [
            BeachPhoto(
              image: 'assets/images/beach/beachsharam.jpg',
              name: 'Sharm El Sheikh',
              price: '\$120 / Day',
            ),
            BeachPhoto(
              image: 'assets/images/beach/maldiv.jpg',
              name: 'Maldives',
              price: '\$140 / Day',
            ),
          ],
        ),
      ),
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
      child: Stack(
        children: [
          // IMAGE
          Positioned.fill(
            child: Image.asset(
              image,
              fit: BoxFit.cover,
            ),
          ),

          // DARK GRADIENT (PRO LOOK)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.1),
                    Colors.black.withOpacity(0.3),
                    Colors.black.withOpacity(0.7),
                  ],
                ),
              ),
            ),
          ),

          // TEXT CARD
          Positioned(
            left: 16,
            bottom: 20,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
                border: Border.all(
                  color: Colors.white.withOpacity(0.2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // NAME
                  Text(
                    name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // PRICE
                  Text(
                    price,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}