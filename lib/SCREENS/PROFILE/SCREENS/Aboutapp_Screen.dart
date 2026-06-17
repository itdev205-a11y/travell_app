import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AboutappScreen extends StatefulWidget {
  const AboutappScreen({super.key});

  @override
  State<AboutappScreen> createState() => _AboutappScreenState();
}

class _AboutappScreenState extends State<AboutappScreen>
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
      begin: const Offset(0, .15),
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
            height: double.infinity,
            padding: const EdgeInsets.all(16),

            decoration: BoxDecoration(
              color: isDark
                  ? colors.surface
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
            ),

            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [

                    /// HEADER
                    ListTile(
                      contentPadding: EdgeInsets.zero,

                      leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: colors.onSurface,
                        ),
                      ),

                      title: Text(
                        "About App",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// APP ICON
                    Container(
                      height: 110,
                      width: 110,

                      decoration: BoxDecoration(
                        color: colors.primaryContainer,
                        borderRadius:
                        BorderRadius.circular(26),

                        boxShadow: [
                          BoxShadow(
                            color: colors.shadow
                                .withOpacity(
                              isDark
                                  ? .25
                                  : .08,
                            ),
                            blurRadius: 16,
                            offset:
                            const Offset(0, 8),
                          ),
                        ],
                      ),

                      child: Icon(
                        Icons.flight_takeoff,
                        size: 54,
                        color: colors.primary,
                      ),
                    ),

                    const SizedBox(height: 22),

                    Text(
                      "Travel App",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight:
                        FontWeight.bold,
                        color:
                        colors.onSurface,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// VERSION
                    Container(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),

                      decoration: BoxDecoration(
                        color:
                        colors.surfaceContainer,

                        borderRadius:
                        BorderRadius.circular(
                          30,
                        ),
                      ),

                      child: Row(
                        mainAxisSize:
                        MainAxisSize.min,

                        children: [
                          Text(
                            "Version 1.0.0",
                            style: TextStyle(
                              color: colors
                                  .onSurfaceVariant,
                            ),
                          ),

                          const SizedBox(
                            width: 8,
                          ),

                          InkWell(
                            onTap: () {
                              Clipboard.setData(
                                const ClipboardData(
                                  text: "1.0.0",
                                ),
                              );

                              ScaffoldMessenger.of(
                                context,
                              ).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Version copied",
                                  ),
                                ),
                              );
                            },

                            child: Icon(
                              Icons.copy,
                              size: 18,
                              color: colors
                                  .primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    /// DESCRIPTION
                    _card(
                      context,
                      child: Text(
                        "Travel App helps you explore destinations, book flights, hotels, and manage trips easily.",
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.7,
                          color: colors
                              .onSurfaceVariant,
                        ),
                      ),
                    ),

                    const SizedBox(height: 22),

                    _infoTile(
                      context,
                      Icons.code,
                      "Developed with Flutter",
                    ),

                    _infoTile(
                      context,
                      Icons.security,
                      "Secure & Reliable",
                    ),

                    _infoTile(
                      context,
                      Icons.update,
                      "Regular Updates",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _card(
      BuildContext context, {
        required Widget child,
      }) {
    final colors =
        Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,

      padding:
      const EdgeInsets.all(18),

      decoration: BoxDecoration(
        color: colors.surfaceContainer,

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: child,
    );
  }

  Widget _infoTile(
      BuildContext context,
      IconData icon,
      String text,
      ) {
    final colors =
        Theme.of(context).colorScheme;

    return Container(
      margin:
      const EdgeInsets.only(bottom: 12),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: colors.surfaceContainer,

        borderRadius:
        BorderRadius.circular(18),
      ),

      child: Row(
        children: [
          Container(
            padding:
            const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color:
              colors.primaryContainer,

              borderRadius:
              BorderRadius.circular(
                12,
              ),
            ),

            child: Icon(
              icon,
              color: colors.primary,
            ),
          ),

          const SizedBox(width: 14),

          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight:
                FontWeight.w600,
                color:
                colors.onSurface,
              ),
            ),
          ),
        ],
      ),
    );
  }
}