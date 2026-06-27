import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostVisited extends StatelessWidget {
  const MostVisited({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 170,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: isDark ? Colors.grey.shade900 : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.25 : 0.08),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _data.length,
        separatorBuilder: (_, __) => const SizedBox(width: 14),
        itemBuilder: (context, index) {
          final item = _data[index];

          return _VisitedItem(
            name: item['name']!,
            image: item['image']!,
            price: item['price']!,
          );
        },
      ),
    );
  }
}

/// 📦 DATA (clean structure)
final List<Map<String, String>> _data = [
  {
    'name': 'Paris',
    'image': 'assets/images/city/paris.jpg',
    'price': '\$233',
  },
  {
    'name': 'Roma',
    'image': 'assets/images/mostvisited/roma.jpg',
    'price': '\$443',
  },
  {
    'name': 'Riyadh',
    'image': 'assets/images/mostvisited/ryiadh.jpg',
    'price': '\$343',
  },
  {
    'name': 'Istanbul',
    'image': 'assets/images/mostvisited/istanbul.jpg',
    'price': '\$343',
  },
];

/// 🟢 ITEM CARD
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
      child: SizedBox(
        width: 85,
        child: Column(
          children: [
            // 🖼 IMAGE
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            // 🏙 NAME
            Text(
              name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 2),

            // 💰 PRICE
            Text(
              price,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}