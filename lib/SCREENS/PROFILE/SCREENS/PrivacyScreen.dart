import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PrivacyScreen extends StatefulWidget {
  const PrivacyScreen({super.key});

  @override
  State<PrivacyScreen> createState() => _PrivacyScreenState();
}

class _PrivacyScreenState extends State<PrivacyScreen>
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
        Theme.of(context).brightness ==
            Brightness.dark;

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
                begin:
                Alignment.topLeft,
                end:
                Alignment.bottomRight,
              ),
            ),

            child: SafeArea(
              child:
              SingleChildScrollView(
                child: Column(
                  children: [

                    /// HEADER
                    ListTile(
                      contentPadding:
                      EdgeInsets.zero,

                      leading:
                      IconButton(
                        onPressed: () {
                          context.pop();
                        },

                        icon: Icon(
                          Icons
                              .arrow_back,
                          color: colors
                              .onSurface,
                        ),
                      ),

                      title: Text(
                        "Privacy Policy",

                        style:
                        TextStyle(
                          fontSize:
                          22,

                          fontWeight:
                          FontWeight
                              .bold,

                          color:
                          colors
                              .onSurface,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    /// ICON
                    Container(
                      height: 110,
                      width: 110,

                      decoration:
                      BoxDecoration(
                        color: colors
                            .primaryContainer,

                        borderRadius:
                        BorderRadius.circular(
                          24,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: colors
                                .shadow
                                .withOpacity(
                              isDark
                                  ? .25
                                  : .08,
                            ),

                            blurRadius:
                            18,

                            offset:
                            const Offset(
                              0,
                              8,
                            ),
                          ),
                        ],
                      ),

                      child: Icon(
                        Icons
                            .lock_outline,

                        size: 52,

                        color: colors
                            .primary,
                      ),
                    ),

                    const SizedBox(
                      height: 22,
                    ),

                    Text(
                      "Your Privacy Matters",

                      textAlign:
                      TextAlign.center,

                      style:
                      TextStyle(
                        fontSize:
                        26,

                        fontWeight:
                        FontWeight
                            .bold,

                        color:
                        colors
                            .onSurface,
                      ),
                    ),

                    const SizedBox(
                      height: 8,
                    ),

                    Text(
                      "We protect your data and keep it secure",

                      textAlign:
                      TextAlign.center,

                      style:
                      TextStyle(
                        color: colors
                            .onSurfaceVariant,
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ),

                    _section(
                      context,
                      icon:
                      Icons.storage,

                      title:
                      "Data Collection",

                      text:
                      "We collect only necessary information to improve your experience in the app.",
                    ),

                    _section(
                      context,
                      icon:
                      Icons.analytics,

                      title:
                      "Data Usage",

                      text:
                      "Your data is used to personalize content, improve services, and enhance performance.",
                    ),

                    _section(
                      context,
                      icon:
                      Icons.security,

                      title:
                      "Data Protection",

                      text:
                      "We use advanced security measures to protect your information.",
                    ),

                    _section(
                      context,
                      icon:
                      Icons.groups,

                      title:
                      "Third Parties",

                      text:
                      "We do not sell or share your personal data with third parties.",
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

  Widget _section(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String text,
      }) {
    final colors =
        Theme.of(context).colorScheme;

    return Container(
      margin:
      const EdgeInsets.only(
        bottom: 14,
      ),

      padding:
      const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color:
        colors.surfaceContainer,

        borderRadius:
        BorderRadius.circular(
          18,
        ),
      ),

      child: Row(
        crossAxisAlignment:
        CrossAxisAlignment.start,

        children: [

          Container(
            padding:
            const EdgeInsets.all(
              10,
            ),

            decoration:
            BoxDecoration(
              color: colors
                  .primaryContainer,

              borderRadius:
              BorderRadius.circular(
                12,
              ),
            ),

            child: Icon(
              icon,
              color:
              colors.primary,
            ),
          ),

          const SizedBox(
            width: 14,
          ),

          Expanded(
            child: Column(
              crossAxisAlignment:
              CrossAxisAlignment
                  .start,

              children: [

                Text(
                  title,

                  style:
                  TextStyle(
                    fontSize:
                    16,

                    fontWeight:
                    FontWeight
                        .bold,

                    color:
                    colors
                        .onSurface,
                  ),
                ),

                const SizedBox(
                  height: 6,
                ),

                Text(
                  text,

                  style:
                  TextStyle(
                    height:
                    1.6,

                    color:
                    colors
                        .onSurfaceVariant,
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