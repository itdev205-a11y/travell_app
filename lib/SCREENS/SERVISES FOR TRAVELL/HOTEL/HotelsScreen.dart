import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final TextEditingController searchController =
  TextEditingController();

  final List<Hotel> allHotels = [
    Hotel(
      name: "Grand Palace",
      image: "https://picsum.photos/800/500?1",
      description: "Luxury hotel in city center",
      price: 120,
    ),

    Hotel(
      name: "Sea View",
      image: "https://picsum.photos/800/500?2",
      description: "Sea view rooms",
      price: 90,
    ),

    Hotel(
      name: "Mountain Lodge",
      image: "https://picsum.photos/800/500?3",
      description: "Nature stay",
      price: 75,
    ),
  ];

  late List<Hotel> filteredHotels;

  @override
  void initState() {
    super.initState();
    filteredHotels = allHotels;
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void search(String value) {
    setState(() {
      filteredHotels = allHotels
          .where(
            (e) => e.name
            .toLowerCase()
            .contains(
          value.toLowerCase(),
        ),
      )
          .toList();
    });
  }

  void openDetails(
      BuildContext context,
      Hotel hotel,
      ) {
    context.push(
      '/hotel-details',
      extra: hotel.toMap(),
    );
  }

  @override
  Widget build(BuildContext context) {

    final bottomPadding =
        MediaQuery.of(context).padding.bottom + 90;

    return Scaffold(
      backgroundColor:
      Theme.of(context)
          .scaffoldBackgroundColor,

      body: SafeArea(
        bottom: false,

        child: Column(
          children: [

            const SizedBox(
              height: 10,
            ),

            const Padding(
              padding:
              EdgeInsets.symmetric(
                horizontal: 12,
              ),

              child: Align(
                alignment:
                Alignment.centerLeft,

                child: Text(
                  "Find Hotels",

                  style: TextStyle(
                    fontSize: 26,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 12,
            ),

            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 12,
              ),

              child: TextField(
                controller:
                searchController,

                onChanged: search,

                decoration:
                InputDecoration(
                  hintText:
                  "Search...",

                  prefixIcon:
                  const Icon(
                    Icons.search,
                  ),

                  filled: true,

                  fillColor:
                  Theme.of(context)
                      .colorScheme
                      .surface,

                  border:
                  OutlineInputBorder(
                    borderRadius:
                    BorderRadius.circular(
                      14,
                    ),

                    borderSide:
                    BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            Expanded(
              child: GridView.builder(

                padding:
                EdgeInsets.only(
                  left: 12,
                  right: 12,
                  top: 12,

                  /// الحل
                  bottom:
                  bottomPadding,
                ),

                itemCount:
                filteredHotels.length,

                gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  childAspectRatio:
                  .75,

                  crossAxisSpacing:
                  10,

                  mainAxisSpacing:
                  10,
                ),

                itemBuilder:
                    (context, index) {
                  final hotel =
                  filteredHotels[
                  index];

                  return InkWell(
                    borderRadius:
                    BorderRadius.circular(
                      16,
                    ),

                    onTap:
                        () =>
                        openDetails(
                          context,
                          hotel,
                        ),

                    child:
                    Container(
                      decoration:
                      BoxDecoration(
                        color:
                        Theme.of(
                          context,
                        )
                            .colorScheme
                            .surface,

                        borderRadius:
                        BorderRadius.circular(
                          16,
                        ),
                      ),

                      child:
                      Column(
                        crossAxisAlignment:
                        CrossAxisAlignment
                            .start,

                        children: [

                          Expanded(
                            child:
                            ClipRRect(
                              borderRadius:
                              const BorderRadius.vertical(
                                top:
                                Radius.circular(
                                  16,
                                ),
                              ),

                              child:
                              Image.network(
                                hotel
                                    .image,

                                width:
                                double.infinity,

                                fit:
                                BoxFit.cover,
                              ),
                            ),
                          ),

                          Padding(
                            padding:
                            const EdgeInsets.all(
                              10,
                            ),

                            child:
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,

                              children: [

                                Text(
                                  hotel
                                      .name,

                                  maxLines:
                                  1,

                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                ),

                                const SizedBox(
                                  height:
                                  4,
                                ),

                                Text(
                                  hotel
                                      .description,

                                  maxLines:
                                  1,

                                  overflow:
                                  TextOverflow
                                      .ellipsis,
                                ),

                                const SizedBox(
                                  height:
                                  8,
                                ),

                                Text(
                                  "\$${hotel.price}",

                                  style:
                                  const TextStyle(
                                    color:
                                    Colors.green,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Hotel {
  final String name;
  final String image;
  final String description;
  final int price;

  Hotel({
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "description": description,
      "price": price,
    };
  }
}