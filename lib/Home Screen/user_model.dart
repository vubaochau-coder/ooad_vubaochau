class TestUserModel {
  final String name;
  final String position;

  TestUserModel({required this.name, required this.position});

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
      };

  static TestUserModel fromJson(Map<String, dynamic> json) => TestUserModel(
        name: json['name'],
        position: json['position'],
      );
}
