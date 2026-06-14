import 'package:flutter/material.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: LinearGradient(
          colors: [
            Colors.blue.withOpacity(0.12),
            Colors.purple.withOpacity(0.08),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: Colors.blue.withOpacity(0.2),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: const Row(
        children: [
          /// AVATAR
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(
              "https://i.pravatar.cc/300",
            ),
          ),

          SizedBox(width: 12),

          /// NAME + EMAIL
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Mohamed Ali",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  "mohamed@gmail.com",
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          /// VERIFIED ICON
          Icon(
            Icons.verified,
            color: Colors.blue,
            size: 20,
          ),
        ],
      ),
    );
  }
}