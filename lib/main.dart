import 'package:flutter/material.dart';
import 'package:perfil_demo/config/theme/app_theme.dart';
import 'package:perfil_demo/presentation/screens/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Futbol Demo',
      theme: AppTheme().getTheme(),
      home: HomePage()
    );
  }
}
