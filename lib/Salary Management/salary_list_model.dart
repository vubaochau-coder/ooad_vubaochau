import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';
import 'package:ooad_vubaochau/Models/Salary_Models/test_label_model.dart';

class SalaryScreenModel {
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get salaryChanges {
    return FirebaseFirestore.instance.collection("Salary").snapshots();
  }

  Future<List<ManagerSalaryModel>> getData() async {
    List<TestSalaryLabel> labels = [];
    List<ManagerSalaryModel> fullSalaryInfo = [];
    var query = await FirebaseFirestore.instance.collection("Salary").get();
    for (var doc in query.docs) {
      final hastags = await FirebaseFirestore.instance
          .collection("Salary")
          .doc(doc.id)
          .collection("Hastag")
          .get();
      final hastagData =
          hastags.docs.map((e) => TestSalaryLabel.fromSnapshot(e)).toList();
      labels = hastagData;

      final mySalaryInfo = ManagerSalaryModel.fromSnapshot(doc, labels);
      fullSalaryInfo.add(mySalaryInfo);
    }
    return fullSalaryInfo;
  }

  Future<void> addSalary(ManagerSalaryModel newSalaryInfo) async {
    var docRef = await FirebaseFirestore.instance
        .collection("Salary")
        .add(newSalaryInfo.toJson());

    for (var item in newSalaryInfo.label) {
      FirebaseFirestore.instance
          .collection("Salary")
          .doc(docRef.id)
          .collection("Hastag")
          .add(item.toJson());
    }
  }
}
