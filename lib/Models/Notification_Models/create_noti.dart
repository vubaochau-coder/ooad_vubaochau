class NotiCreatedModel {
  final String title;
  final String description;
  final String date;

  NotiCreatedModel({
    required this.title,
    required this.description,
    required this.date,
  });

  Map<String, dynamic> toJson(String idDepart) {
    return {
      'date': date,
      'description': description,
      'idDepartment': idDepart,
      'title': title,
    };
  }
}
