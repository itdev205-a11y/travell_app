import 'package:flutter/material.dart';

import 'SUB_PAYMENTINFO/WIDGETS_PAYMENT/Container_PaymentInfo.dart';
import 'SUB_SETTINGS/WIDGETS_SETTINGS/Container_Setting.dart';
import 'SUB_SETTINGS/WIDGETS_SETTINGS/Text_Setting.dart';



class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(height: 20),

              // User Info
              TextSetting(text: 'Ali', size: 25),
              SizedBox(height: 5),
              TextSetting(text: '@GMAIL.COM', size: 16),

              SizedBox(height: 20),

              // Sections
              ContainerPaymentInfo(),
              SizedBox(height: 10),

              ContainerSetting(),

              SizedBox(height: 20),


            ],
          ),
        ),
      ),
    );
  }
}