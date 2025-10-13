import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuestSatu_0703',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        //gunakan center widget sehingga child widget secara horizontal ditengah
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, //vertical centering
          children: [
            Text("Nama: Sultan A. I."),
            Text("Kelas: IF-5B"),
            Text("Alamat: Solo"),
            Text("No. Telp: 082233445566"),
            Text("Email: abc@gmail.com"),
          ],
        ),
      ),
    );
  }
}
