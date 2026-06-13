

import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Choose Payment Method',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            _buildPaymentCard(
              icon: Icons.credit_card,
              title: 'Credit / Debit Card',
              subtitle: 'Pay using Visa or MasterCard',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _buildPaymentCard(
              icon: Icons.account_balance_wallet,
              title: 'Wallet',
              subtitle: 'Pay using your wallet balance',
              onTap: () {},
            ),

            const SizedBox(height: 12),

            _buildPaymentCard(
              icon: Icons.paypal,
              title: 'PayPal',
              subtitle: 'Pay using PayPal account',
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        onTap: onTap,

        leading: Icon(
          icon,
          size: 30,
          color: Colors.blue,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
      ),
    );
  }
}
