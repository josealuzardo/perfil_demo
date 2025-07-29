import 'package:flutter/material.dart';
import 'package:perfil_demo/domain/entities/person.dart';
import 'package:perfil_demo/presentation/screens/personProfile.dart';
import 'package:perfil_demo/infraestructure/personDatasource.dart';

class ExploreScreen extends StatelessWidget {
  final List<Person> people = PersonDatasource().getPeople();

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: people.length,
      itemBuilder: (context, index) {
        final person = people[index];
        return ListTile(
          leading: CircleAvatar(child: Text(person.name[0])),
          title: Text(person.name),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => ProfileDetailPage(person: person),
              ),
            );
          },
        );
      },
    );
  }
}
