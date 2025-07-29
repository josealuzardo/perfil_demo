class Language {
  final String name;
  final String code;

  Language({required this.name, required this.code});

  factory Language.fromJson(Map<String, dynamic> json) => Language(
    name: json['name'],
    code: json['code'],
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'code': code,
  };
}
