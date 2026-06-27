import 'package:flutter/material.dart';

class HotelDetailScreen extends StatelessWidget {
  final Map<String, dynamic> hotel;

  const HotelDetailScreen({
    super.key,
    required this.hotel,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          /// Content
          CustomScrollView(
            slivers: [

              /// Header Image
              SliverAppBar(
                expandedHeight: 320,
                pinned: true,
                backgroundColor: Colors.white,

                flexibleSpace: FlexibleSpaceBar(
                  background: Stack(
                    fit: StackFit.expand,
                    children: [

                      Image.network(
                        hotel["image"] ?? "",
                        fit: BoxFit.cover,
                      ),

                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Colors.black.withOpacity(.5),
                              Colors.transparent,
                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        left: 20,
                        bottom: 20,
                        child: Text(
                          hotel["name"],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Details
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(20),

                  child: Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      Row(
                        children: [

                          const Icon(
                            Icons.location_on,
                            color: Colors.red,
                          ),

                          const SizedBox(width: 8),

                          Text(
                            hotel["location"]
                                ?? "Unknown Location",
                          ),
                        ],
                      ),

                      const SizedBox(height: 18),

                      Row(
                        children: [

                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),

                          const SizedBox(width: 6),

                          Text(
                            "${hotel["rating"] ?? 4.8}",
                            style:
                            const TextStyle(
                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Text(
                        "\$${hotel["price"]} / night",
                        style:
                        const TextStyle(
                          fontSize: 26,
                          color: Colors.green,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 30),

                      const Text(
                        "About",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        hotel["description"] ??
                            "Luxury stay with premium services.",
                        style:
                        const TextStyle(
                          height: 1.7,
                          color:
                          Colors.black54,
                        ),
                      ),

                      const SizedBox(
                        height: 120,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          /// Book Button
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,

            child: SafeArea(
              child: SizedBox(
                height: 58,

                child: ElevatedButton(
                  style:
                  ElevatedButton.styleFrom(
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                        18,
                      ),
                    ),
                  ),

                  onPressed: () {},

                  child: const Text(
                    "Book Now",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}