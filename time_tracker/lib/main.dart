import 'package:flutter/material.dart';
import 'package:time_tracker/pages/home_page.dart';
import 'package:time_tracker/themes/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeData(),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

 
