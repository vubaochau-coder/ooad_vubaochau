import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:ooad_vubaochau/Models/Requirement_Models/test_emp_model.dart';

class RequirementScreenModel {
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get formChanges {
    return FirebaseFirestore.instance.collection("Form").snapshots();
  }
  
  Future<List<ManagerRequiredModel>> getData() async {
    List<MemberInWriting> members = [];
    List<ManagerRequiredModel> fullRequirements = [];
    var query = await FirebaseFirestore.instance.collection("Form").get();
    for (var doc in query.docs) {
      final emps = await FirebaseFirestore.instance
          .collection("Form")
          .doc(doc.id)
          .collection("Members")
          .get();
      final empsData =
          emps.docs.map((e) => MemberInWriting.fromSnapshot(e)).toList();
      members = empsData;

      final myRequirement = ManagerRequiredModel.fromSnapshot(doc, members);
      fullRequirements.add(myRequirement);
    }
    return fullRequirements;
  }

  Future<void> addForm(ManagerRequiredModel newForm) async {
    var docRef = await FirebaseFirestore.instance
        .collection("Form")
        .add(newForm.toJson());

    for (var emp in newForm.members) {
      FirebaseFirestore.instance
          .collection("Form")
          .doc(docRef.id)
          .collection("Members")
          .add(emp.toJson());
    }
  }
}
