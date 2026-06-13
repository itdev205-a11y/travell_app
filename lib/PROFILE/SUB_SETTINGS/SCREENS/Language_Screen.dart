import 'package:flutter/material.dart';
import '../WIDGETS_SETTINGS/Text_Setting.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedValue = 'English';

  final List<String> languages = const [
    'English',
    'Arabic',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextSetting(
          text: 'Language',
          size: 25,
        ),
        centerTitle: true,
      ),

      body: Padding(
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
                  text: 'Choose Language',
                  size: 24,
                ),

                const SizedBox(height: 10),

                ListTile(
                  contentPadding: EdgeInsets.zero,

                  leading: const Icon(
                    Icons.language,
                    size: 28,
                  ),

                  title: const TextSetting(
                    text: 'Language',
                    size: 20,
                  ),

                  trailing: DropdownButton<String>(
                    value: selectedValue,
                    isDense: true,

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
                      }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}