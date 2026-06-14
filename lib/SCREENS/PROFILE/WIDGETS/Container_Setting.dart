import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ContainerSetting extends StatelessWidget {
  const ContainerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        elevation: 4,
        shadowColor: Colors.black.withOpacity(0.08),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 14,
            vertical: 16,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              /// TITLE
              const TextSetting(
                text: 'Settings',
                size: 22,
              ),

              const SizedBox(height: 12),

              _settingTile(
                context: context,
                icon: Icons.language,
                title: 'Language',
                onTap: () => context.push('/language'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.dark_mode,
                title: 'Theme',
                onTap: () => context.push('/theme'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.notifications,
                title: 'Notifications',
                onTap: () => context.push('/notifications'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.lock,
                title: 'Privacy',
                onTap: () => context.push('/privacyscreen'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.payment,
                title: 'Payment',
                onTap: () => context.push('/paymentscreen'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.support_agent,
                title: 'Contact Support',
                onTap: () => context.push('/support'),
              ),

              const Divider(height: 1),

              _settingTile(
                context: context,
                icon: Icons.info,
                title: 'About App',
                onTap: () => context.push('/aboutappscreen'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      dense: true,
      visualDensity: const VisualDensity(vertical: -1),

      onTap: onTap,

      leading: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(
          icon,
          size: 22,
          color: Colors.blue,
        ),
      ),

      title: TextSetting(
        text: title,
        size: 16,
      ),

      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
    );
  }
}


class TextSetting extends StatelessWidget {

  final String text ;
  final double size ;

  const TextSetting({super.key,
    required this.text,
    required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,

      style: TextStyle(
          fontSize: size,
          fontWeight: FontWeight.bold
      ),

    );
  }
}