import 'package:flutter/material.dart';
import 'package:project_pertama/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Bola',
      home: LoginScreen(),
    );
  }
}
