import 'package:app_travell/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

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
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  bool visible = false;

  @override
  void initState() {
    super.initState();
    toController.text = widget.destination;

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    if (fromController.text.trim().isEmpty ||
        toController.text.trim().isEmpty ||
        dateController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Center(
          child: Lottie.asset(
            'assets/animations/Sandy Loading.json',
            height: 160,
          ),
        );
      },
    );

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: visible ? 1 : 0,

        child: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // =========================
                // 🔵 SECTION 1: HEADER
                // =========================
                 Center(
                  child:Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.arrow_back),
                      ),

                      const SizedBox(width: 8),

                      const TextHeadScreens(
                        text: 'Search Flight',
                        size: 30,
                      ),
                    ],
                  )
                ),

                const SizedBox(height: 25),

                // =========================
                // 🟢 SECTION 2: FORM
                // =========================
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
                //  readOnly: false,
                ),

                const SizedBox(height: 16),

                TicketTextField(
                  label: 'Travel Date',
                  icon: Icons.calendar_month,
                  controller: dateController,
                  isDateField: true, // 🔥 مهم جدًا
                ),

                const SizedBox(height: 20),

                const ButtonPassenger(),

                const SizedBox(height: 30),

                // =========================
                // 🔴 SECTION 3: BUTTON
                // =========================
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: searchFlights,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      'Search Flights',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}