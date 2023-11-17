import 'package:ecommerce/login.dart';
import 'package:ecommerce/register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Ecommerce'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
=======
    return const MaterialApp(
      home: Scaffold(body: Register()),
>>>>>>> main
    );
  }
}
