import 'package:flutter/material.dart';
import 'package:perfil_demo/domain/entities/person.dart';

class PersonProfile extends StatelessWidget {
  final Person person;

  const PersonProfile({required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(person.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('📍 Ubicación: ${person.location}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('⚽ Nivel: ${person.skillLevel}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text(
              'Este perfil está diseñado como parte de tu práctica de Flutter. Aquí podrías agregar futuras secciones como disponibilidad, valoraciones o intereses deportivos.',
              style: TextStyle(color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }
}