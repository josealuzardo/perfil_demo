import 'package:flutter/material.dart';
import 'package:perfil_demo/domain/entities/person.dart';
import 'package:perfil_demo/presentation/screens/personProfile.dart';

class ExploreScreen extends StatelessWidget {
  final List<Person> people = [
    Person(name: 'Carlos Mendoza', location: 'Caracas', skillLevel: 'Intermedio'),
    Person(name: 'Ana Torres', location: 'Maracay', skillLevel: 'Avanzado'),
    Person(name: 'Luis García', location: 'Barquisimeto', skillLevel: 'Principiante'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return ListTile(
          leading: CircleAvatar(child: Text(person.name[0])),
          title: Text(person.name),
          subtitle: Text('${person.location} • ${person.skillLevel}'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => PersonProfile(person: person),
              ),
            );
          },
        );
      },
    );
  }
}
