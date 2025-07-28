import 'package:flutter/material.dart';
import 'package:perfil_demo/presentation/screens/exploreScreen.dart';
import 'package:perfil_demo/presentation/screens/fieldsScreen.dart';
import 'package:perfil_demo/presentation/screens/messagesScreen.dart';
import 'package:perfil_demo/presentation/screens/profileScreen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    ExploreScreen(),   // Lista de personas
    FieldsScreen(),    // Canchas (placeholder por ahora)
    MessagesScreen(),  // Mensajes (placeholder)
    ProfileScreen(),   // Tu propio perfil (placeholder)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bienvenido a Flutter Fútbol ⚽')),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _currentIndex = index),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Fields'),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}
