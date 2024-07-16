import 'package:flutter/material.dart';

ThemeData lightThemeData(){
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 51, 51, 51),
    hoverColor: const Color.fromARGB(255, 81, 81, 81),
    scaffoldBackgroundColor: Colors.white
  );
}