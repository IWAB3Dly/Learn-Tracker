import 'package:flutter/material.dart';

ThemeData lightThemeData(){
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color.fromARGB(255, 51, 51, 51),
    hoverColor: const Color.fromARGB(255, 81, 81, 81),
    scaffoldBackgroundColor: Colors.white, 
    colorScheme: ColorScheme(
      
      secondary: const Color.fromARGB(255, 236, 234, 237),
      onError: Colors.grey.shade200,
      onBackground: Colors.grey.shade900,
      error: Colors.grey.shade200,
      onSecondary: Colors.grey.shade900,
      surface: Colors.grey.shade200,
      onSurface: Colors.grey.shade900,
      primary: const Color.fromARGB(255, 51, 51, 51),
      onPrimary: const Color.fromARGB(255, 81, 81, 81),
      brightness: Brightness.light,
      background: const Color.fromARGB(255, 140, 142, 163)
    )
  );
}