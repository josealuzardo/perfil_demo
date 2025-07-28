import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Color(0xFFFFD600),
      brightness: Brightness.dark,
      primary: Color(0xFFFFD600), // Amarillo vibrante
      onPrimary: Colors.black,
      secondary: Color(0xFFBDBDBD), // Gris claro
      onSecondary: Colors.black,
      surface: Color(0xFF1E1E1E),
      onSurface: Colors.white,
      error: Colors.red,
      onError: Colors.white,
    ),
    appBarTheme: const AppBarTheme(centerTitle: false),
  );
}
