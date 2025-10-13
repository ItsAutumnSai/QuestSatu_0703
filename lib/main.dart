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
            Text(
              "Nama: Sultan A. I.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.amber[300],
              ),
            ),
            Text("Kelas: IF-5B", style: TextStyle(fontSize: 15)),
            Text("NIM: 3012310703", style: TextStyle(fontSize: 15)),
            Text("Alamat: Surakarta", style: TextStyle(fontSize: 15)),
            Text("Semester: 5", style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
    );
  }
}
