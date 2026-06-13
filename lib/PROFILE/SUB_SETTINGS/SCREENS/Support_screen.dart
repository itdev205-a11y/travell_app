import 'package:flutter/material.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
        centerTitle: true,
      ),
      body: ListView(
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
            onPressed: () {
              // Open support chat or form
            },
            icon: const Icon(Icons.chat),
            label: const Text('Contact Support'),
          ),
        ],
      ),
    );
  }
}