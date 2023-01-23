import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_label_model.dart';

class TaskScreenModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get taskChanges {
    return firestore.collection("Task").snapshots();
  }

  Future<List<ManagerTaskModel>> getData() async {
    List<TestLabel> labels = [];
    List<MemberInTask> members = [];
    List<ManagerTaskModel> fullTasks = [];
    var query = await firestore.collection("Task").get();
    for (var doc in query.docs) {
      final hastags = await firestore
          .collection("Task")
          .doc(doc.id)
          .collection("Hastag")
          .get();
      final hastagData =
          hastags.docs.map((e) => TestLabel.fromSnapshot(e)).toList();
      labels = hastagData;

      final emps = await firestore
          .collection("Task")
          .doc(doc.id)
          .collection("Members")
          .get();
      final empsData =
          emps.docs.map((e) => MemberInTask.fromSnapshot(e)).toList();
      members = empsData;

      final myTask = ManagerTaskModel.fromSnapshot(doc, labels, members);
      fullTasks.add(myTask);
    }
    return fullTasks;
  }

  Future<void> addTask(ManagerTaskModel newTask) async {
    var docRef = await firestore.collection("Task").add(newTask.toJson());

    for (var item in newTask.label) {
      firestore
          .collection("Task")
          .doc(docRef.id)
          .collection("Hastag")
          .add(item.toJson());
    }
    for (var people in newTask.members) {
      firestore
          .collection("Task")
          .doc(docRef.id)
          .collection("Members")
          .add(people.toJson());
    }
  }
}
