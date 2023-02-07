class TestUserModel {
  final String name;
  final String position;
  final String image;

  TestUserModel({
    required this.name,
    required this.position,
    required this.image,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'position': position,
      };

  static TestUserModel fromJson(Map<String, dynamic> json, String imgUrl) =>
      TestUserModel(
        name: json['name'],
        position: json['position'],
        image: imgUrl,
      );
}
