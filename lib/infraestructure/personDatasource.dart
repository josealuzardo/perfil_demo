import 'package:perfil_demo/domain/entities/person.dart';
import 'package:perfil_demo/domain/mocks/mock_person.dart';

class PersonDatasource {
  final List<Person> _people = [];

  PersonDatasource() {
    _loadMockData();
  }

  void _loadMockData() {
    final mockData = personList;
    for (var person in mockData) {
      _people.add(Person.fromJson(person));
    }
  }

  List<Person> getPeople() {
    return _people;
  }
}