import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
      ),

      body: FadeTransition(
        opacity: _fade,

        child: SlideTransition(
          position: _slide,

          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [

              const Card(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Icon(
                        Icons.support_agent,
                        size: 60,
                        color: Colors.blue,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'How can we help you?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              ListTile(
                leading: const Icon(Icons.email, color: Colors.blue),
                title: const Text('Email Support'),
                subtitle: const Text('support@apptravel.com'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {},
              ),

              const Divider(),

              ListTile(
                leading: const Icon(Icons.phone, color: Colors.green),
                title: const Text('Call Us'),
                subtitle: const Text('+49 123 456 789'),
                trailing: const Icon(Icons.arrow_forward_ios, size: 18),
                onTap: () {},
              ),

              const Divider(),

              const ExpansionTile(
                leading: Icon(Icons.help_outline),
                title: Text('Frequently Asked Questions'),
                children: [
                  ListTile(
                    title: Text('How do I book a ticket?'),
                    subtitle: Text(
                      'Go to the ticket screen, choose your destination and search for flights.',
                    ),
                  ),
                  ListTile(
                    title: Text('How can I cancel a booking?'),
                    subtitle: Text(
                      'Open your bookings and select the reservation you want to cancel.',
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.chat),
                label: const Text('Contact Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}