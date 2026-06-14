import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostVisited extends StatelessWidget {
  const MostVisited({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: const SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _VisitedItem(
              name: 'Paris',
              image: 'assets/images/city/paris.jpg',
              price: '\$233',
            ),
            SizedBox(width: 18),
            _VisitedItem(
              name: 'Roma',
              image: 'assets/images/mostvisited/roma.jpg',
              price: '\$443',
            ),
            SizedBox(width: 18),
            _VisitedItem(
              name: 'Riyadh',
              image: 'assets/images/mostvisited/ryiadh.jpg',
              price: '\$343',
            ),
            SizedBox(width: 18),
            _VisitedItem(
              name: 'Istanbul',
              image: 'assets/images/mostvisited/istanbul.jpg',
              price: '\$343',
            ),
          ],
        ),
      ),
    );
  }
}

class _VisitedItem extends StatelessWidget {
  final String name;
  final String image;
  final String price;

  const _VisitedItem({
    required this.name,
    required this.image,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(
          '/mostvisited',
          extra: {
            'name': name,
            'image': image,
            'price': price,
          },
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 42,
              backgroundImage: AssetImage(image),
            ),
          ),

          const SizedBox(height: 8),

          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}