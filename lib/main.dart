import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'LOGIN/Provider_LoginScreen/AuthProvider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'MORE_Screens/firebase_options.dart';
import 'MORE_Screens/router.dart';
import 'PROFILE/Provider_ThemeMood/Provider_ThemeMood.dart';



Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Background message: ${message.notification?.title}');
}



void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // للإشعارات بالخلفية
  FirebaseMessaging.onBackgroundMessage(
    backgroundHandler,
  );

  runApp(
    MultiProvider(
      providers: [

        ChangeNotifierProvider(
          create: (_) => ProviderThememood(),
        ),

        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),

      ],

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
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.light,
            ),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
          ),

          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
            appBarTheme: const AppBarTheme(
              centerTitle: true,
            ),
          ),
        );
      },
    );
  }
}

