import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 650),
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
        title: const Text('Payment'),
        centerTitle: true,
      ),

      body: FadeTransition(
        opacity: _fade,

        child: SlideTransition(
          position: _slide,

          child: Padding(
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
          style: const TextStyle(fontWeight: FontWeight.bold),
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