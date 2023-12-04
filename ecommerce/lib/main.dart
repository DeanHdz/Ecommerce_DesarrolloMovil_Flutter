import 'package:ecommerce/models/shop.dart';
import 'package:ecommerce/screens/login_screen.dart';
import 'package:ecommerce/screens/page_control.dart';
import 'package:ecommerce/screens/register_screen.dart';
import 'package:ecommerce/themes/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Importaciones de firebase
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Shop(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      theme: lightMode,
      routes: 
      {
        '/login': (context) => const LoginPage(),
        '/pageControl': (context) => const PageControl(),
        '/register': (context) => const RegisterPage(),
      }
    );
  }
}
