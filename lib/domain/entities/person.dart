import 'package:perfil_demo/domain/entities/interest.dart';
import 'package:perfil_demo/domain/entities/language.dart';
import 'package:perfil_demo/domain/entities/player.dart';
import 'package:perfil_demo/domain/entities/skill.dart';
import 'package:perfil_demo/domain/entities/team.dart';

class Person {
  final String id;
  final String name;
  final String jobTitle;
  final String bio;
  final String position;
  final String age;
  final String gamePlayed;
  final String username;
  final String workplace;
  final String city;
  final List<Language> languages;
  final List<Team> supportedTeams;
  final List<Player> admiredPlayers;
  final List<Interest> interests;
  final List<Skill> skills;

  Person({
    required this.id,
    required this.name,
    required this.bio,
    required this.position,
    required this.age,
    required this.gamePlayed,
    required this.username,
    required this.jobTitle,
    required this.workplace,
    required this.city,
    required this.languages,
    required this.supportedTeams,
    required this.admiredPlayers,
    required this.interests,
    required this.skills,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
    id: json['id'],
    bio: json['bio'],
    name: json['name'],
    age: json['age'],
    position: json['position'],
    gamePlayed: json['gamePlayed'],
    username: json['username'],
    jobTitle: json['jobTitle'],
    workplace: json['workplace'],
    city: json['city'],
    languages: (json['languages'] as List)
        .map((e) => Language.fromJson(e))
        .toList(),
    supportedTeams: (json['supportedTeams'] as List)
        .map((e) => Team.fromJson(e))
        .toList(),
    admiredPlayers: (json['admiredPlayers'] as List)
        .map((e) => Player.fromJson(e))
        .toList(),
    interests: (json['interests'] as List)
        .map((e) => Interest.fromJson(e))
        .toList(),
    skills: (json['skills'] as List).map((e) => Skill.fromJson(e)).toList(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'bio': bio,
    'position': position,
    'name': name,
    'age': age,
    'gamePlayed': gamePlayed,
    'username': username,
    'jobTitle': jobTitle,
    'workplace': workplace,
    'city': city,
    'languages': languages.map((e) => e.toJson()).toList(),
    'supportedTeams': supportedTeams.map((e) => e.toJson()).toList(),
    'admiredPlayers': admiredPlayers.map((e) => e.toJson()).toList(),
    'interests': interests.map((e) => e.toJson()).toList(),
    'skills': skills.map((e) => e.toJson()).toList(),
  };

  // skill.dart
  Map<SkillType, int> computeSkillScores() {
    final Map<SkillType, int> scoreMap = {
      SkillType.technical: 0,
      SkillType.fitness: 0,
      SkillType.tactical: 0,
    };

    for (final skill in skills) {
      if (skill.isActive) {
        scoreMap[skill.type] = scoreMap[skill.type]! + 1;
      }
    }

    return scoreMap;
  }
}
