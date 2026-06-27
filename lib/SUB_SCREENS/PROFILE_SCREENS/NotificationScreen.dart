import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../PROFILE/Widgets_Profile/Widgets_Profilescreen/TextHeadScreens .dart';





class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  /// 📦 قائمة الإشعارات
  List<Map<String, String>> notifications = [];

  /// 📡 subscription مهم للتحكم في stream
  late final StreamSubscription<RemoteMessage> _sub;

  @override
  void initState() {
    super.initState();
    setupAnimation();
    setupFirebaseNotifications();
  }

  /// 🎬 Animation
  void setupAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  /// 🔔 Firebase_Login Notifications (FIXED)
  void setupFirebaseNotifications() {
    _sub = FirebaseMessaging.onMessage.listen((message) {
      if (!mounted) return;

      setState(() {
        notifications.insert(0, {
          "title": message.notification?.title ?? "Notification",
          "body": message.notification?.body ?? "",
          "time": "Just now",
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _sub.cancel(); // 🔥 مهم جدًا
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title:   const TextHeadScreens(
            text: ' Notification',
            size: 32,
          ),
      ),

      body: FadeTransition(
        opacity: _fade,
        child: SlideTransition(
          position: _slide,

          child: notifications.isEmpty
              ? const Center(
            child: Text(
              "No notifications yet",
              style: TextStyle(color: Colors.grey),
            ),
          )
              : ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: notifications.length,
            itemBuilder: (context, index) {
              final n = notifications[index];

              return NotificationCard(
                icon: Icons.notifications,
                title: n["title"]!,
                subtitle: n["body"]!,
                time: n["time"]!,
                color: Colors.blue,
              );
            },
          ),
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const NotificationCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),

        leading: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: color.withOpacity(0.12),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: color, size: 22),
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),

        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 13,
              height: 1.3,
            ),
          ),
        ),

        trailing: Text(
          time,
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}