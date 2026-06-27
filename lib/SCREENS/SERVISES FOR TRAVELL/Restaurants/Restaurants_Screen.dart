import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../HOTEL/WIDGETS_HotelsScreen/Text_HotelsScreen.dart';
import '../ServiceForTravel_Screen.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children:  [

          Align(alignment: Alignment.topLeft,child:
          TextServisesScreen(
            text: ' Find Restaurant',
            size: 32,
          ),
          ),



          _SearchBar(),
          Expanded(child: _RestaurantsList()),
        ],
      ),
    );
  }
}

/// ================= TITLE =================
class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: TextHotelsScreen(
          text: "Find Restaurant",
          size: 28,
        ),
      ),
    );
  }
}

/// ================= SEARCH =================
class _SearchBar extends StatelessWidget {
  const _SearchBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

/// ================= LIST =================
class _RestaurantsList extends StatelessWidget {
  const _RestaurantsList();

  static const List<Map<String, dynamic>> data = [
    {
      "name": "Al Sham",
      "type": "Grills",
      "rating": 4.8,
      "image":
      "https://images.unsplash.com/photo-1517248135467-4c7edcad34c4",
    },

    {
      "name": "Pizza Hut",
      "type": "Pizza",
      "rating": 4.5,
      "image":
      "https://images.unsplash.com/photo-1513104890138-7c749659a591",
    },

    {
      "name": "Burger House",
      "type": "Burgers",
      "rating": 4.7,
      "image":
      "https://images.unsplash.com/photo-1568901346375-23c9450c58cd",
    },

    {
      "name": "Tokyo Sushi",
      "type": "Sushi",
      "rating": 4.9,
      "image":
      "https://images.unsplash.com/photo-1579871494447-9811cf80d66c",
    },

    {
      "name": "Pasta Italia",
      "type": "Italian",
      "rating": 4.6,
      "image":
      "https://images.unsplash.com/photo-1621996346565-e3dbc646d9a9",
    },

    {
      "name": "Steak Corner",
      "type": "Steak",
      "rating": 4.8,
      "image":
      "https://images.unsplash.com/photo-1544025162-d76694265947",
    },

    {
      "name": "Sea Food Palace",
      "type": "Seafood",
      "rating": 4.7,
      "image":
      "https://images.unsplash.com/photo-1559847844-5315695dadae",
    },

    {
      "name": "Taco Fiesta",
      "type": "Mexican",
      "rating": 4.4,
      "image":
      "https://images.unsplash.com/photo-1552332386-f8dd00dc2f85",
    },

    {
      "name": "Arabian Taste",
      "type": "Arabic",
      "rating": 4.9,
      "image":
      "https://images.unsplash.com/photo-1544025162-d76694265947",
    },

    {
      "name": "Healthy Bowl",
      "type": "Healthy Food",
      "rating": 4.6,
      "image":
      "https://images.unsplash.com/photo-1546069901-ba9599a7e63c",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: data.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        final item = data[index];

        return _RestaurantCard(
          restaurant: item,
          onTap: () {
            context.push('/restaurant_details', extra: item);
          },
        );
      },
    );
  }
}

/// ================= CARD =================
class _RestaurantCard extends StatelessWidget {
  final Map<String, dynamic> restaurant;
  final VoidCallback onTap;

  const _RestaurantCard({
    required this.restaurant,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// IMAGE
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(18),
              ),
              child: Image.network(
                restaurant["image"],
                height: 170,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NAME + RATING
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          restaurant["name"],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text("⭐ ${restaurant["rating"]}"),
                    ],
                  ),

                  const SizedBox(height: 6),

                  /// TYPE
                  Text(
                    restaurant["type"],
                    style: const TextStyle(color: Colors.grey),
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