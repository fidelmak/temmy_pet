import 'package:flutter/material.dart';
import 'package:temmy_pet/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temmy Pet App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFa5bdbd)),
      ),
      home: const SplashScreen(),
    );
  }
}
