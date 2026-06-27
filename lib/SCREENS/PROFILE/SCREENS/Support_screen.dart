import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    )..forward();

    _fade = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );

    _slide = Tween(
      begin: const Offset(0, .12),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final isDark =
        Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: FadeTransition(
        opacity: _fade,

        child: SlideTransition(
          position: _slide,

          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
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
            ),

            child: SafeArea(
              child: ListView(
                padding: const EdgeInsets.all(18),

                children: [
                  /// HEADER
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => context.pop(),
                        icon: Icon(
                          Icons.arrow_back_ios,
                          color: colors.onSurface,
                        ),
                      ),

                      Expanded(
                        child: Text(
                          "Support",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: colors.onSurface,
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),

                  const SizedBox(height: 25),

                  /// TOP CARD
                  Container(
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: isDark
                          ? colors.surfaceContainer
                          : colors.surface,

                      borderRadius:
                      BorderRadius.circular(22),

                      boxShadow: [
                        BoxShadow(
                          color:
                          colors.shadow.withOpacity(
                            .08,
                          ),
                          blurRadius: 12,
                        ),
                      ],
                    ),

                    child: Column(
                      children: [
                        Container(
                          padding:
                          const EdgeInsets.all(20),

                          decoration: BoxDecoration(
                            color:
                            colors.primaryContainer,

                            shape: BoxShape.circle,
                          ),

                          child: Icon(
                            Icons.support_agent,
                            size: 48,
                            color: colors.primary,
                          ),
                        ),

                        const SizedBox(height: 18),

                        Text(
                          'How can we help you?',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                            FontWeight.bold,
                            color:
                            colors.onSurface,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Our support team is available for you',
                          textAlign:
                          TextAlign.center,
                          style: TextStyle(
                            color: colors
                                .onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  _supportCard(
                    context,
                    icon: Icons.email,
                    color: Colors.blue,
                    title: 'Email Support',
                    subtitle:
                    'support@apptravel.com',
                  ),

                  const SizedBox(height: 14),

                  _supportCard(
                    context,
                    icon: Icons.phone,
                    color: Colors.green,
                    title: 'Call Us',
                    subtitle:
                    '+49 123 456 789',
                  ),

                  const SizedBox(height: 24),

                  Container(
                    decoration: BoxDecoration(
                      color:
                      colors.surfaceContainer,

                      borderRadius:
                      BorderRadius.circular(
                          18),
                    ),

                    child: ExpansionTile(
                      leading: Icon(
                        Icons.help_outline,
                        color: colors.primary,
                      ),

                      title: Text(
                        "Frequently Asked Questions",
                        style: TextStyle(
                          color:
                          colors.onSurface,
                        ),
                      ),

                      children: const [
                        ListTile(
                          title: Text(
                            'How do I book a ticket?',
                          ),
                          subtitle: Text(
                            'Go to ticket screen and search flights.',
                          ),
                        ),

                        ListTile(
                          title: Text(
                            'How can I cancel booking?',
                          ),
                          subtitle: Text(
                            'Open bookings and cancel.',
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 28),

                  FilledButton.icon(
                    style:
                    FilledButton.styleFrom(
                      padding:
                      const EdgeInsets.symmetric(
                        vertical: 18,
                      ),
                    ),

                    onPressed: () {},

                    icon: const Icon(Icons.chat),

                    label: const Text(
                      'Contact Support',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _supportCard(
      BuildContext context, {
        required IconData icon,
        required Color color,
        required String title,
        required String subtitle,
      }) {
    final colors =
        Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colors.surfaceContainer,

        borderRadius:
        BorderRadius.circular(18),

        boxShadow: [
          BoxShadow(
            color:
            colors.shadow.withOpacity(.06),
            blurRadius: 10,
          ),
        ],
      ),

      child: ListTile(
        contentPadding:
        const EdgeInsets.all(14),

        leading: CircleAvatar(
          backgroundColor:
          color.withOpacity(.15),

          child: Icon(
            icon,
            color: color,
          ),
        ),

        title: Text(
          title,
          style: TextStyle(
            color: colors.onSurface,
            fontWeight:
            FontWeight.bold,
          ),
        ),

        subtitle: Text(
          subtitle,
          style: TextStyle(
            color:
            colors.onSurfaceVariant,
          ),
        ),

        trailing: Icon(
          Icons.arrow_forward_ios,
          color:
          colors.onSurfaceVariant,
          size: 16,
        ),
      ),
    );
  }
}