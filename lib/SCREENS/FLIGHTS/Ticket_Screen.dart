import 'package:flutter/material.dart';

import 'WIGDETS/Button_Passenger.dart';
import 'WIGDETS/TextFeild.dart';

class TicketScreen extends StatefulWidget {
  final String destination;

  const TicketScreen({
    super.key,
    this.destination = '',
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
  void dispose() {
    fromController.dispose();
    toController.dispose();
    dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// ✨ APP BAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: const Text(
          "Search Flights",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: const Icon(Icons.flight_takeoff),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.search),
          ),
        ],
      ),

      body: TweenAnimationBuilder(


        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 800),
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 20 * (1 - value)),
              child: child,
            ),
          );
        },

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              const SizedBox(height: 20),

              const ButtonPassenger(),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("Search Flights"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}