import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/test_label_model.dart';

const List<TestSalaryLabel> _default = [];

class ManagerSalaryModel {
  final String id;
  final String nameEmp;
  List<TestSalaryLabel> label;
  final String salaryGain;
  final String date;
  final int score;

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  ManagerSalaryModel({
    required this.id,
    required this.nameEmp,
    this.label = _default,
    required this.salaryGain,
    required this.date,
    required this.score,
  });

  Map<String, dynamic> toJson() {
    return {
      'nameEmp': nameEmp,
      'salaryGain': salaryGain,
      'scores': score,
      'date': date,
    };
  }

  factory ManagerSalaryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
    List<TestSalaryLabel> label,
  ) {
    final data = document.data()!;
    return ManagerSalaryModel(
      id: document.id,
      nameEmp: data["nameEmp"],
      salaryGain: data["salaryGain"],
      date: data["date"],
      score: data["scores"],
      label: label,
    );
  }
}
