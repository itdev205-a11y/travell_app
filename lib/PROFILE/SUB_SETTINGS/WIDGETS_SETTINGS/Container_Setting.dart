import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'Text_Setting.dart';

class ContainerSetting extends StatelessWidget {
  const ContainerSetting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TextSetting(
                text: 'Settings',
                size: 25,
              ),

              const SizedBox(height: 10),

              _settingTile(
                context: context,
                icon: Icons.language,
                title: 'Language',
                onTap: () {
                  context.push('/language');
                },
              ),

              const Divider(
                indent: 10,
                endIndent: 10,
              ),

              _settingTile(
                context: context,
                icon: Icons.dark_mode,
                title: 'Theme',
                onTap: () {
                  context.push('/theme');
                },
              ),

              const Divider(
                indent: 10,
                endIndent: 10,
              ),

              _settingTile(
                context: context,
                icon: Icons.support_agent,
                title: 'Contact Support',
                onTap: () {
                  context.push('/support');
                },
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
      contentPadding: EdgeInsets.zero,
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: Colors.blue,
      ),
      title: TextSetting(
        text: title,
        size: 18,
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 18,
        color: Colors.grey,
      ),
    );
  }
}