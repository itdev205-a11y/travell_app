import 'package:flutter/material.dart';
import '../WIDGETS/Container_Setting.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen>
    with SingleTickerProviderStateMixin {

  String selectedValue = 'English';

  final List<String> languages = const [
    'English',
    'Arabic',
  ];

  late AnimationController _controller;
  late Animation<double> _fade;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _fade = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextSetting(
          text: 'Language',
          size: 24,
        ),
        centerTitle: true,
        elevation: 0,
      ),

      body: FadeTransition(
        opacity: _fade,

        child: SlideTransition(
          position: _slide,

          child: Padding(
            padding: const EdgeInsets.all(16),

            child: Card(
              elevation: 4,
              shadowColor: Colors.black.withOpacity(0.1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    /// TITLE
                    const TextSetting(
                      text: 'Choose Language',
                      size: 22,
                    ),

                    const SizedBox(height: 16),

                    ListTile(
                      contentPadding: EdgeInsets.zero,

                      leading: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.language,
                          color: Colors.blue,
                          size: 26,
                        ),
                      ),

                      title: const TextSetting(
                        text: 'App Language',
                        size: 18,
                      ),

                      subtitle: const Text(
                        "Select your preferred language",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),

                      trailing: DropdownButton<String>(
                        value: selectedValue,
                        underline: const SizedBox(),
                        items: languages.map((lang) {
                          return DropdownMenuItem(
                            value: lang,
                            child: Text(lang),
                          );
                        }).toList(),
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              selectedValue = value;
                            });
                          }
                        },
                      ),
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
}