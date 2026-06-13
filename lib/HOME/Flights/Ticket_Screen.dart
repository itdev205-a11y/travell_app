import 'package:flutter/material.dart';

import 'WIGDETS/Button_Passenger.dart';
import 'WIGDETS/TextFeild.dart';

class TicketScreen extends StatefulWidget {
  final String destination;
 // final String price;

  const TicketScreen({
    super.key,
    this.destination = '',
   // this.price=''
  });

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    toController.text = widget.destination;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

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

            const SizedBox(height: 16),

            ButtonPassenger(),

            const SizedBox(height: 20),

           // Text(
           //   "Price: ${widget.price}",
           //   style: const TextStyle(
           //     fontSize: 18,
          //      fontWeight: FontWeight.bold,
          //    ),
          //  ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              child: const Text("Search Flights"),
            ),
          ],
        ),
      ),
    );
  }
}