import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const RestaurantDetailsScreen({
    super.key,
    required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FA),
      body: CustomScrollView(
        slivers: [
          _Header(restaurant: restaurant),
          SliverToBoxAdapter(
            child: _Content(restaurant: restaurant),
          ),
        ],
      ),
    );
  }
}

/// ================= HEADER =================
class _Header extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const _Header({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      pinned: true,
      backgroundColor: Colors.white,
      leading: const _BackButton(),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          restaurant["image"] ?? "",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

/// ================= BACK BUTTON =================
class _BackButton extends StatelessWidget {
  const _BackButton();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: CircleAvatar(
        backgroundColor: Colors.black45,
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}

/// ================= CONTENT =================
class _Content extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  const _Content({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  restaurant["name"] ?? "",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black
                  ),
                ),
              ),
              _Rating(value: restaurant["rating"]),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.red),
              const SizedBox(width: 6),
              Text(restaurant["location"] ?? "Unknown",

              style: TextStyle(
                color: Colors.black
              ),
              ),

            ],
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              _InfoBox(
                icon: Icons.restaurant,
                text: restaurant["type"] ?? "",
              ),
              const SizedBox(width: 10),
              const _InfoBox(
                icon: Icons.access_time,
                text: "10:00 - 23:00",
              ),
            ],
          ),

          const SizedBox(height: 25),

          const Text(
            "About",
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              color: Colors.black

            ),
          ),

          const SizedBox(height: 8),

          Text(
            restaurant["description"] ?? "",
            style: const TextStyle(
              color: Colors.black,
              height: 1.5,
            ),
          ),

          const SizedBox(height: 30),

          const Text(
            "Services_ConvertCurrency",
            style: TextStyle(fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),

          const Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _Service(Icons.wifi, "WiFi"),
              _Service(Icons.delivery_dining, "Delivery"),
              _Service(Icons.family_restroom, "Family"),
              _Service(Icons.local_parking, "Parking"),
            ],
          ),

          const SizedBox(height: 30),

          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Book a Table"),
            ),
          ),
        ],
      ),
    );
  }
}

/// ================= RATING =================
class _Rating extends StatelessWidget {
  final dynamic value;

  const _Rating({this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.star, color: Colors.orange, size: 16),
          const SizedBox(width: 4),
          Text("${value ?? 0}"),
        ],
      ),
    );
  }
}

/// ================= INFO BOX =================
class _InfoBox extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoBox({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 5),
            Text(text,
            style:TextStyle(
              color: Colors.black
            )

              ,),
          ],
        ),
      ),
    );
  }
}

/// ================= SERVICE =================
class _Service extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Service(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.blue),
          const SizedBox(height: 5),
          Text(text,

          style: TextStyle(
            color: Colors.black
          ),
          ),
        ],
      ),
    );
  }
}