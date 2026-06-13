import 'package:app_travell/router.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Firebase/firebase_options.dart';
import 'Providers/Provider_ThemeMood.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final provider = ProviderThememood();
  await provider.init(); // 👈 لازم قبل runApp

  runApp(
    ChangeNotifierProvider.value(
      value: provider,
      child: const App(),
    ),
  );
}



class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderThememood>(
      builder: (context, provider, child) {
        return MaterialApp.router(
          routerConfig: router,

          debugShowCheckedModeBanner: false,

          themeMode: provider.themeMode,

          theme: ThemeData(
            brightness: Brightness.light,
            colorSchemeSeed: Colors.blue,
            useMaterial3: true,
          ),

          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorSchemeSeed: Colors.blue,
            useMaterial3: true,
          ),
        );
      },
    );
  }
}