import 'package:flutter/material.dart';
import 'package:perfil_demo/domain/entities/person.dart';
import 'package:perfil_demo/domain/entities/skill.dart';

class ProfileDetailPage extends StatelessWidget {
  final Person person;

  const ProfileDetailPage({required this.person});

  @override
  Widget build(BuildContext context) {
    final skillsByType = person.computeSkillScores();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text('@${person.name.toLowerCase().replaceAll(" ", "")}'),
        actions: [IconButton(icon: Icon(Icons.message), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(person),
            const SizedBox(height: 20),
            _buildInfoSection(person),
            const SizedBox(height: 20),
            _buildSkillSummary(skillsByType),
            const SizedBox(height: 20),
            _buildInterests(person),
            const SizedBox(height: 20),
            _buildSupportedTeams(person),
            const SizedBox(height: 20),
            _buildAdmiredPlayers(person),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Person person) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Imagen de fondo
        Container(
          height: 280,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://tse4.mm.bing.net/th/id/OIP.ChhbU86-I3mtCe7Du35L4QHaE8?rs=1&pid=ImgDetMain&o=7&rm=3'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                Colors.amber,
                BlendMode.darken,
              ),
            ),
          ),
        ),

        // Contenido
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar circular
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://tse3.mm.bing.net/th/id/OIP.Bc2vhVH-xGuo5f29fygEkgHaE6?rs=1&pid=ImgDetMain&o=7&rm=3'),
              backgroundColor: Colors.white,
            ),
            const SizedBox(height: 12),

            // Nombre y usuario
            Text(
              person.name,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              '@${person.username}',
              style: const TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 20),

            // Filas con estadísticas
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Edad', '${person.age} años'),
                  _buildInfoColumn('Posición', person.position),
                  _buildInfoColumn('Juegos', person.gamePlayed),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  // Componente auxiliar para columnas
  Widget _buildInfoColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white70, fontSize: 14),
        ),
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoSection(Person p) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ciudad: ${p.city}'),
        Text('Idiomas: ${p.languages.map((l) => l.name).join(', ')}'),
      ],
    );
  }

  Widget _buildSkillSummary(Map<SkillType, int> skills) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: skills.entries.map((entry) {
        return Column(
          children: [
            Text(entry.key.name.toUpperCase()),
            Text('${entry.value}/5'),
          ],
        );
      }).toList(),
    );
  }

  Widget _buildInterests(Person person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Intereses',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Wrap(
          spacing: 8,
          children: person.interests
              .map(
                (interest) => Chip(
                  label: Text(interest.title),
                  backgroundColor: Colors.blue.shade50,
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  Widget _buildSupportedTeams(Person person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Equipos Favoritos',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: person.supportedTeams.length,
          itemBuilder: (context, index) {
            final team = person.supportedTeams[index];
            return ListTile(
              leading: Icon(Icons.sports_soccer, color: Colors.green),
              title: Text(team.name),
            );
          },
        ),
      ],
    );
  }

  Widget _buildAdmiredPlayers(Person person) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jugadores Admirados',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Column(
          children: person.admiredPlayers
              .map(
                (player) => Card(
                  child: ListTile(
                    title: Text(player.fullName),
                    subtitle: Text(player.position),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
