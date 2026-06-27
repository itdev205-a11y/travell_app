import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileInfoContainer extends StatelessWidget {
  const ProfileInfoContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;


    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),

        color: isDark
            ? colors.surfaceContainer
            : null,

        gradient: isDark
            ? null
            : LinearGradient(
          colors: [
            Colors.blue.shade50,
            Colors.purple.shade50,
            Colors.pink.shade50,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(
              isDark ? 0.25 : 0.08,
            ),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),

      child: Row(
        children: [

          // ================= AVATAR =================
          CircleAvatar(
            radius: 34,
            backgroundColor: colors.primaryContainer,

            backgroundImage: user?.photoURL != null
                ? NetworkImage(user!.photoURL!)
                : null,

            child: user?.photoURL == null
                ? Icon(
              Icons.person,
              size: 34,
              color: colors.primary,
            )
                : null,
          ),

          const SizedBox(width: 18),

          // ================= INFO =================
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Signed in as",
                  style: TextStyle(
                    color: colors.onSurfaceVariant,
                    fontSize: 13,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  user?.email ?? "No Email",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: colors.onSurface,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                // ================= VERIFIED BADGE =================
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),

                  decoration: BoxDecoration(
                    color: colors.primaryContainer,
                    borderRadius: BorderRadius.circular(50),
                  ),

                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Icon(
                        Icons.verified,
                        size: 16,
                        color: colors.primary,
                      ),

                      const SizedBox(width: 6),

                      Text(
                        "Verified",
                        style: TextStyle(
                          color: colors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}