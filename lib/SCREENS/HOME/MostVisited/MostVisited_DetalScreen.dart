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

class _MostvisitedDetailScreenState
    extends State<MostvisitedDetailScreen> {
  double _topPadding = 70;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() => _topPadding = 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F6FA),
      body: Stack(
        children: [
          _buildContent(),
          _buildBookingBar(),
        ],
      ),
    );
  }

  // 🟦 MAIN CONTENT
  Widget _buildContent() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader(),
          _buildInfoCard(),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  // 🌄 HEADER IMAGE
  Widget _buildHeader() {
    return SizedBox(
      height: 480,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(widget.image, fit: BoxFit.cover),

          // gradient overlay
          Container(
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

          // back button
          Positioned(
            top: 40,
            left: 16,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),

          // title
          Positioned(
            bottom: 40,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 6),
                const Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    SizedBox(width: 5),
                    Text(
                      "4.9 (1200 Reviews)",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  // 📦 INFO CARD
  Widget _buildInfoCard() {
    return AnimatedPadding(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: _topPadding,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: _cardDecoration(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("About Destination",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                )),

            const SizedBox(height: 10),

            Text(
              "Explore ${widget.name} and enjoy beautiful landscapes and unforgettable experiences.",
              style: const TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 20),

            const Text("Highlights",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                )),

            const SizedBox(height: 15),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _InfoItem(Icons.landscape, "Views"),
                _InfoItem(Icons.hotel, "Hotels"),
                _InfoItem(Icons.flight, "Flights"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 💳 BOOKING BAR
  Widget _buildBookingBar() {
    return Positioned(
      bottom: 15,
      left: 16,
      right: 16,
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: _cardDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price",
                    style: TextStyle(color: Colors.grey)),
                Text(
                  widget.price,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              onPressed: () {
                context.push('/ticket', extra: widget.name);
              },
              child: const Text(
                "BOOK NOW",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🎨 CARD STYLE (clean reuse)
  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.12),
          blurRadius: 18,
        )
      ],
    );
  }
}

// 🎯 INFO ITEM
class _InfoItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const _InfoItem(this.icon, this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: Colors.blue.shade50,
          child: Icon(icon, color: Colors.blue),
        ),
        const SizedBox(height: 6),
        Text(label),
      ],
    );
  }
}