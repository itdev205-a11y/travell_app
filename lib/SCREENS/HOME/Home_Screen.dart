import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../PROFILE/WIDGETS/TextHeadScreens .dart';
import 'Beach/WIDGETS/Row_Beach.dart';
import 'MostVisited/MostVisited.dart';
import 'Popular/WIDGETS/Popular.dart';
import 'WIDGETS_HomeScreen/Listtile_HomeScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
    initNotification();
  }

  Future<void> initNotification() async {
    final messaging = FirebaseMessaging.instance;

    await messaging.requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (!mounted) return;

      context.push('/notifications');
    });
  }

  @override
  Widget build(BuildContext context) {

    final bottomSpace =
        MediaQuery.of(context).padding.bottom + 90;

    return Scaffold(
      body: SafeArea(
        bottom: false,

        child: ListView(
          padding: EdgeInsets.only(
            left: 12,
            right: 12,
            top: 12,

            /// الحل الحقيقي
            bottom: bottomSpace,
          ),

          children: const [

            Align(
              alignment: Alignment.center,
              child: TextHeadScreens(
                text: ' Travel',
                size: 32,
              ),
            ),

            SizedBox(height: 10),

            ListtileHomescreen(),

            SizedBox(height: 10),

            Popular(),

            SizedBox(height: 25),

            Align(
              alignment: Alignment.topLeft,
              child: TextHeadScreens(
                text:
                ' Most Visited Destinations',
                size: 25,
              ),
            ),

            SizedBox(height: 12),

            MostVisited(),

            SizedBox(height: 25),

            Align(
              alignment: Alignment.topLeft,
              child: TextHeadScreens(
                text:
                ' Best Beaches Near You',
                size: 25,
              ),
            ),

            SizedBox(height: 12),

            RowBeach(),

          ],
        ),
      ),
    );
  }
}