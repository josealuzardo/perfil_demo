import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color.fromARGB(255, 255, 196, 0),
      brightness: Brightness.dark,
      primary: Color(0xFFFFB900), // Amarillo vibrante
      onPrimary: Color(0xFF060606),
      secondary: Color(0xFFFFB900), // Gris claro
      onSecondary: Color(0xFF060606),
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
