import 'package:flutter/material.dart';
import 'Beach/WIDGETS/Row_Beach.dart';
import 'MostVisited/MostVisited.dart';
import 'Popular/WIDGETS/Popular.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              _TextDiscover(' Poplur ', 25),

              const SizedBox(height: 10),

              const Popular(),

              const SizedBox(height: 20),

              _TextDiscover(' Most Visited Destinations', 25),
              const SizedBox(height: 20),

              MostVisited(),

              const SizedBox(height: 20),
              _TextDiscover(' Best Beaches Near You', 25),
              const SizedBox(height: 20),
              const RowBeach(),






            ],
          ),
        ),
      ),
    );
  }
}

Widget _TextDiscover(String text, double size) {
  return Text(
    text,
    style: TextStyle(
      fontSize: size,
      fontWeight: FontWeight.bold,
    ),
  );
}


