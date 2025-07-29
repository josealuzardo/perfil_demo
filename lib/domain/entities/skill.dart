enum SkillType { technical, fitness, tactical }

class Skill {
  final String name;
  final SkillType type;
  final bool isActive;

  Skill({
    required this.name,
    required this.type,
    required this.isActive,
  });

  factory Skill.fromJson(Map<String, dynamic> json) => Skill(
    name: json['name'],
    type: SkillType.values.firstWhere(
      (e) => e.name == json['type'],
      orElse: () => SkillType.technical,
    ),
    isActive: json['isActive'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'type': type.name,
    'isActive': isActive,
  };
}
