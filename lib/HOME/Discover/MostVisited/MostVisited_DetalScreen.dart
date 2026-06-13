import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MostvisitedDetailScreen extends StatefulWidget {
  final String image;
  final String name;
  final String price;

  const MostvisitedDetailScreen({
    super.key,
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  State<MostvisitedDetailScreen> createState() =>
      _MostvisitedDetailScreenState();
}

/// 🎨 TEXT STYLES (داخل نفس الصفحة)
class T {
  static const titleLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static const sectionTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const subTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static const bodyGrey = TextStyle(
    color: Colors.grey,
    fontSize: 16,
    height: 1.5,
  );

  static const price = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
  );

  static const labelGrey = TextStyle(
    color: Colors.grey,
  );
}

class _MostvisitedDetailScreenState
    extends State<MostvisitedDetailScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),

      body: Stack(
        children: [

          SingleChildScrollView(
            child: Column(
              children: [

                /// IMAGE
                Stack(
                  children: [

                    Container(
                      height: 520,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    Container(
                      height: 520,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black87,
                          ],
                        ),
                      ),
                    ),

                    Positioned(
                      top: 45,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(Icons.arrow_back),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),

                    Positioned(
                      bottom: 45,
                      left: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.name, style: T.titleLarge),
                          const SizedBox(height: 8),
                          const Row(
                            children: [
                              Icon(Icons.star,
                                  color: Colors.amber, size: 22),
                              SizedBox(width: 5),
                              Text(
                                "4.9 (1200 Reviews)",
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),

                /// INFO CARD
                Container(
                  margin: const EdgeInsets.all(18),
                  padding: const EdgeInsets.all(22),
                  transform: Matrix4.translationValues(0, -35, 0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.15),
                        blurRadius: 20,
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      const Text("About Destination",
                          style: T.sectionTitle),

                      const SizedBox(height: 12),

                      Text(
                        "Explore ${widget.name} and enjoy amazing views, beautiful places and unforgettable moments.",
                        style: T.bodyGrey,
                      ),

                      const SizedBox(height: 25),

                      const Text("Highlights",
                          style: T.subTitle),

                      const SizedBox(height: 15),

                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _InfoIcon(Icons.landscape, "Views"),
                          _InfoIcon(Icons.hotel, "Hotels"),
                          _InfoIcon(Icons.flight, "Flights"),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),

          /// BOOKING BAR
          Positioned(
            bottom: 20,
            left: 18,
            right: 18,
            child: Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.2),
                    blurRadius: 15,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Price", style: T.labelGrey),
                      Text(widget.price, style: T.price),
                    ],
                  ),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      context.push(
                        '/ticket',
                        extra: {
                          'destination': widget.name,
                          'price': widget.price,
                        },
                      );
                    },
                    child: const Text(
                      "BOOK NOW",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

/// ICON WIDGET
class _InfoIcon extends StatelessWidget {
  final IconData icon;
  final String text;

  const _InfoIcon(this.icon, this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 27,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}

