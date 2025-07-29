class Interest {
  final String title;
  final String category;

  Interest({required this.title, required this.category});

  factory Interest.fromJson(Map<String, dynamic> json) => Interest(
    title: json['title'],
    category: json['category'],
  );

  Map<String, dynamic> toJson() => {
    'title': title,
    'category': category,
  };
}
