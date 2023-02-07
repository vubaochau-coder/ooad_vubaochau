import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/test_emp_model.dart';

const List<MemberInWriting> _defaultEmp = [];

class ManagerRequiredModel {
  final String id;
  final String title;
  final String subTitle;
  final String date;
  final List<MemberInWriting> members;

  ManagerRequiredModel({
    required this.id,
    required this.title,
    required this.subTitle,
    required this.date,
    this.members = _defaultEmp,
  });
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': subTitle,
      'date': date,
    };
  }

  factory ManagerRequiredModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      List<MemberInWriting> members) {
    final data = document.data()!;
    return ManagerRequiredModel(
      id: document.id,
      title: data["title"],
      subTitle: data["description"],
      date: data["date"],
      members: members,
    );
  }
}
