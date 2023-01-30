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

      final emps = await firestore
          .collection("Task")
          .doc(doc.id)
          .collection("Members")
          .get();
      final empsData =
          emps.docs.map((e) => MemberInTask.fromSnapshot(e)).toList();

      final myTask = ManagerTaskModel.fromSnapshot(doc, hastagData, empsData);
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

  Future<void> deleteTask(String taskID) async {
    var hastagSnapshot = await firestore
        .collection("Task")
        .doc(taskID)
        .collection("Hastag")
        .get();
    for (var snapshot in hastagSnapshot.docs) {
      await snapshot.reference.delete();
    }
    var empSnapshot = await firestore
        .collection("Task")
        .doc(taskID)
        .collection("Members")
        .get();
    for (var snapshot in empSnapshot.docs) {
      await snapshot.reference.delete();
    }
    await firestore.collection("Task").doc(taskID).delete();
  }

  Future<void> updateTask(ManagerTaskModel newTask) async {
    DocumentReference docRef = firestore.collection("Task").doc(newTask.id);
    //Remove old Hastag
    var hastagSnapshot = await docRef.collection("Hastag").get();
    for (var snapshot in hastagSnapshot.docs) {
      await snapshot.reference.delete();
    }
    //Remove old Member in Task
    var empSnapshot = await docRef.collection("Members").get();
    for (var snapshot in empSnapshot.docs) {
      await snapshot.reference.delete();
    }
    //Add new Hastag
    for (TestLabel item in newTask.label) {
      docRef.collection("Hastag").add(item.toJson());
    }
    //Add new Member
    for (MemberInTask item in newTask.members) {
      docRef.collection("Members").add(item.toJson());
    }
    await docRef.update(newTask.toJson());
  }
}
