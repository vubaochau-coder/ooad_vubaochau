import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_label_model.dart';

const List<TestLabel> _default = [];
const List<MemberInTask> _defaultUser = [];

class ManagerTaskModel {
  final String id;
  final String title;
  List<TestLabel> label;
  final String subTitle;
  final String date;
  final List<MemberInTask> members;
  final int score;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  ManagerTaskModel({
    required this.id,
    required this.title,
    this.label = _default,
    required this.subTitle,
    required this.date,
    this.members = _defaultUser,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': subTitle,
      'scores': score,
      'date': date,
    };
  }

  factory ManagerTaskModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      List<TestLabel> label,
      List<MemberInTask> members) {
    final data = document.data()!;
    return ManagerTaskModel(
      id: document.id,
      title: data["title"],
      subTitle: data["description"],
      date: data["date"],
      score: data["scores"],
      label: label,
      members: members,
    );
  }
}
