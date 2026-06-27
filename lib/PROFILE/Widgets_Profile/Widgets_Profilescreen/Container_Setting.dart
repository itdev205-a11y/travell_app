import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerSetting extends StatelessWidget {
  const ContainerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: isDark ? colors.surfaceContainer : Colors.white,
        boxShadow: [
          BoxShadow(
            color: colors.shadow.withOpacity(
              isDark ? 0.2 : 0.06,
            ),
            blurRadius: 14,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(), // مهم
        children: [
          _tile(context, Icons.dark_mode, 'Theme', '/theme'),
          _divider(),
          _tile(context, Icons.notifications, 'Notifications', '/notifications'),
          _divider(),
          _tile(context, Icons.lock, 'Privacy', '/privacyscreen'),
          _divider(),
          _tile(context, Icons.payment, 'Payment', '/paymentscreen'),
          _divider(),
          _tile(context, Icons.support_agent, 'Support', '/support'),
          _divider(),
          _tile(context, Icons.info, 'About', '/aboutappscreen'),
        ],
      ),
    );
  }

  Widget _tile(
      BuildContext context,
      IconData icon,
      String title,
      String route,
      ) {
    final colors = Theme.of(context).colorScheme;

    return ListTile(
      dense: true,
      onTap: () => context.push(route),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: colors.primaryContainer,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: colors.primary, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 14,
        color: colors.onSurfaceVariant,
      ),
    );
  }

  Widget _divider() {
    return const Divider(height: 1);
  }
}