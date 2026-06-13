import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Text_Payment.dart';

class ContainerPaymentInfo extends StatelessWidget {
  const ContainerPaymentInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextPayment(
                text: "payment_info",
                size: 25,
              ),

              const SizedBox(height: 10),

              ListTile(
                title: const TextPayment(
                  text: 'payment_methods',
                  size: 18,
                ),
                leading: const Icon(
                  Icons.payment,
                  color: Colors.blue,
                  size: 28,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: Colors.grey,
                ),
                onTap: () {
                 context.push('/paymentscreen');


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}