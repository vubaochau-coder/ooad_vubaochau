class TestUserModel {
  final String name;
  final String position;
  final String image;
  final String email;
  final int level;

  TestUserModel({
    required this.name,
    required this.position,
    required this.image,
    required this.email,
    required this.level,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
      };

  static TestUserModel fromJson(
          Map<String, dynamic> json, String imgUrl, int level) =>
      TestUserModel(
        name: json['name'],
        position: json['position'],
        email: json['email'],
        image: imgUrl,
        level: level,
      );
}
