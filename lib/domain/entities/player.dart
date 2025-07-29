class Player {
  final String id;
  final String fullName;
  final String position;
  final String teamId;

  Player({
    required this.id,
    required this.fullName,
    required this.position,
    required this.teamId,
  });

  factory Player.fromJson(Map<String, dynamic> json) => Player(
    id: json['id'],
    fullName: json['fullName'],
    position: json['position'],
    teamId: json['teamId'],
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'fullName': fullName,
    'position': position,
    'teamId': teamId,
  };
}
