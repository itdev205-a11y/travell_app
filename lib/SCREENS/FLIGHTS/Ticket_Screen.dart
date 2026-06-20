import 'package:flutter/material.dart';

import '../PROFILE/WIDGETS/TextHeadScreens .dart';
import 'WIGDETS/Button_Passenger.dart';
import 'WIGDETS/TextFeild.dart';

class TicketScreen extends StatefulWidget {
  final String destination;

  const TicketScreen({
    super.key,
    required this.destination,
  });

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final fromController = TextEditingController();
  final toController = TextEditingController();
  final dateController = TextEditingController();

  bool visible = false;

  @override
  void initState() {
    super.initState();

    toController.text = widget.destination;

    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() => visible = true);
    });
  }

  @override
  void dispose() {
    fromController.dispose();
    toController.dispose();
    dateController.dispose();
    super.dispose();
  }

  void searchFlights() {
    if (fromController.text.isEmpty ||
        toController.text.isEmpty ||
        dateController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all fields")),
      );
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Searching Flights...")),
    );
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(


      appBar: AppBar(),

      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: visible ? 1 : 0,
        child: AnimatedSlide(
          duration: const Duration(milliseconds: 500),
          offset: visible ? Offset.zero : const Offset(0, 0.1),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextHeadScreens(text: 'Search Flight', size: 34),

                  const SizedBox(height: 20),

                  TicketTextField(
                    label: 'From',
                    icon: Icons.flight_takeoff,
                    controller: fromController,
                  ),

                  const SizedBox(height: 16),

                  TicketTextField(
                    label: 'To',
                    icon: Icons.flight_land,
                    controller: toController,
                  ),

                  const SizedBox(height: 16),

                  TicketTextField(
                    label: 'Travel Date',
                    icon: Icons.calendar_month,
                    controller: dateController,
                  ),

                  const SizedBox(height: 20),

                  const ButtonPassenger(),

                  const SizedBox(height: 25),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: searchFlights,
                      child: const Text("Search Flights"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}