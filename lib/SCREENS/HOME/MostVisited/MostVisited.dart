import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostVisited extends StatelessWidget {
  const MostVisited({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      height: 160,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),

        // ================= BACKGROUND CONTROL =================
        color: isDark ? colors.surfaceContainer : null,

        gradient: isDark
            ? null
            : LinearGradient(
          colors: [
            Colors.blue.shade50,
            Colors.purple.shade50,
            Colors.pink.shade50,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        // ================= SHADOW =================
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(isDark ? 0.25 : 0.08),
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
    final colors = Theme.of(context).colorScheme;

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
                  color: colors.shadow.withOpacity(0.15),
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
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: colors.onSurface,
            ),
          ),

          const SizedBox(height: 2),

          Text(
            price,
            style: TextStyle(
              fontSize: 12,
              color: colors.onSurfaceVariant,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}