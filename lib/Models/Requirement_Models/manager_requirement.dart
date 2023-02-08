import 'package:cloud_firestore/cloud_firestore.dart';

class ManagerRequiredModel {
  final String idWriter;
  final String nameWriter;
  final String title;
  final String subTitle;
  final String date;
  final String idManager;
  final String nameManager;
  final String status;

  ManagerRequiredModel({
    required this.idWriter,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.idManager,
    required this.status,
    required this.nameManager,
    required this.nameWriter,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': subTitle,
      'date': date,
      'idWriter': idWriter,
      'idManager': idManager,
      'status': status,
    };
  }

  factory ManagerRequiredModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      String nameWri,
      String nameMan) {
    final data = document.data()!;
    return ManagerRequiredModel(
      idWriter: document.id,
      title: data["title"],
      subTitle: data["description"],
      date: data["date"],
      idManager: data['idManager'],
      status: data['status'],
      nameManager: nameMan,
      nameWriter: nameWri,
    );
  }
}
