import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerSetting extends StatelessWidget {
  const ContainerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;



    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
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
                Theme.of(context).brightness == Brightness.dark ? 0.25 : 0.08,
              ),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),

        child: Column(
          children: [

            _tile(context, Icons.dark_mode, 'Theme', '/theme'),
            _divider(context),

            _tile(context, Icons.notifications, 'Notifications', '/notifications'),
            _divider(context),

            _tile(context, Icons.lock, 'Privacy', '/privacyscreen'),
            _divider(context),

            _tile(context, Icons.payment, 'Payment', '/paymentscreen'),
            _divider(context),

            _tile(context, Icons.support_agent, 'Support', '/support'),
            _divider(context),

            _tile(context, Icons.info, 'About', '/aboutappscreen'),
          ],
        ),
      ),
    );
  }

  // ================= TILE =================
  Widget _tile(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      onTap: () => context.push(route),

      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          icon,
          color: colors.primary,
        ),
      ),

      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: colors.onSurface,
        ),
      ),

      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: colors.onSurfaceVariant,
      ),
    );
  }

  // ================= DIVIDER =================
  Widget _divider(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Divider(
      height: 1,
      color: colors.outlineVariant,
    );
  }
}