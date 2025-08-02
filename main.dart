import 'package:flutter/material.dart';
import 'homescreen.dart';

void main() {
  runApp(const IndonesiaBerbudayaApp());
}

class IndonesiaBerbudayaApp extends StatelessWidget {
  const IndonesiaBerbudayaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indonesia Berbudaya',
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins', // Anda bisa menambahkan font custom
      ),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}