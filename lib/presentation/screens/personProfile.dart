import 'package:flutter/material.dart';
import 'package:perfil_demo/domain/entities/person.dart';
import 'package:perfil_demo/domain/entities/skill.dart';

class ProfileDetailPage extends StatefulWidget {
  final Person person;

  const ProfileDetailPage({required this.person});

  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  bool _showAllInterests = false; // Controla si se muestran todos los chips

  @override
  Widget build(BuildContext context) {
    final skillsByType = widget.person.computeSkillScores();

    return Scaffold(
      extendBodyBehindAppBar:
          true, // Permite que el cuerpo se extienda detrás del AppBar
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      appBar: AppBar(
        backgroundColor: Colors.transparent, // Hace el AppBar transparente
        elevation: 0, // Elimina la sombra del AppBar
        actions: [IconButton(icon: Icon(Icons.notes), onPressed: () {})],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(widget.person, context),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: buildKudosBox(
                int.parse(widget.person.kudosReceived),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildInfoSection(widget.person),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: const SizedBox(height: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildInterests(widget.person, context),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSkillSummary(skillsByType, context),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(Person person, context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Imagen de fondo con degradado
        Container(
          width: double.infinity,
          height: 415,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Theme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.3), // Parte clara arriba
                  Colors.black.withOpacity(0.4), // Parte oscura abajo
                  Colors.black.withOpacity(0.5), // Parte oscura abajo
                  Colors.black.withOpacity(0.6), // Parte oscura abajo
                ],
              ),
            ),
          ),
        ),

        // Contenido desplazado hacia abajo
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + kToolbarHeight,
            ), // Espacio para el AppBar y el notch
            // Avatar circular
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(person.imageUrl),
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
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoColumn('Yo', '${person.age} yo'),
                  _buildInfoColumn('Position', person.position),
                  _buildInfoColumn('Games', person.gamePlayed),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Botón "Messages"
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              onPressed: () {
                // Acción del botón
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.chat_bubble_outline),
                    const SizedBox(width: 8),
                    const Text("Messages"),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                person.bio,
                style: const TextStyle(fontSize: 16, color: Colors.white70),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildKudosBox(int kudosCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: const Color(
          0xFF1F1F1F,
        ), // fondo diferente al fondo base (#121212)
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const Icon(Icons.thumb_up_alt_outlined, color: Colors.yellowAccent),
          const SizedBox(width: 12),
          Text(
            '$kudosCount kudos received',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
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
        const SizedBox(height: 16),
        _infoRow(
          Icons.work_outline,
          '',
          '${widget.person.jobTitle} at ${widget.person.workplace}',
        ),

        _infoRow(Icons.location_on_outlined, 'Live in', widget.person.city),

        _infoRow(
          Icons.language,
          'Speaks',
          widget.person.languages.map((l) => l.name).join(', '),
        ),

        _infoRow(
          Icons.sports_soccer,
          'Supports',
          widget.person.supportedTeams.map((t) => t.name).join(', '),
        ),

        _infoRow(
          Icons.star_outline,
          'Admires',
          widget.person.admiredPlayers.map((p) => p.fullName).join(', '),
        ),

        const Divider(color: Colors.white70, thickness: 0.5),
      ],
    );
  }

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22, color: Color(0xFFAEAEB2)),
          const SizedBox(width: 12),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Text(
                  value,
                  style: TextStyle(fontSize: 15, color: Color(0xFFAEAEB2)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillSummary(Map<SkillType, int> skills, context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Football skills', style: TextStyle(fontSize: 15)),

        const SizedBox(height: 12),
        _skillBar('Technical', skills[SkillType.technical], context),

        _skillBar('Fitness', skills[SkillType.fitness], context),

        _skillBar('Tactical', skills[SkillType.tactical], context),
      ],
    );
  }

  Widget _buildInterests(Person person, context) {
    final maxVisibleChips = 6; // Número máximo de chips visibles inicialmente
    final interests = person.interests;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Interested in', style: TextStyle(fontSize: 15)),
        SizedBox(height: 10),
        Wrap(
          spacing: 8,
          children: [
            // Muestra los primeros 6 chips o todos si _showAllInterests es true
            ...(_showAllInterests ? interests : interests.take(maxVisibleChips))
                .map((interest) {
                  return Chip(
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                    label: Text(interest.title),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(color: Colors.grey, width: 1),
                    ),
                  );
                })
                .toList(),
            // Botón "See More" o "See Less"
            if (interests.length > maxVisibleChips)
              TextButton(
                onPressed: () {
                  setState(() {
                    _showAllInterests = !_showAllInterests;
                  });
                },
                child: Text(
                  _showAllInterests ? 'See Less' : 'See More',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }

  Widget _skillBar(String label, int? level, context) {
    final safeLevel = level ?? 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: safeLevel / 5,
                  minHeight: 4,
                  backgroundColor: Colors.grey[850],
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Text('$level/5', style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
