import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_label_model.dart';

class TaskScreenModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get taskChanges {
    return firestore.collection("Task").snapshots();
  }

  Future<List<ManagerTaskModel>> getData() async {
    List<ManagerTaskModel> fullTasks = [];

    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    String idDepart = userQuery.docs[0].data()['idDepartment'];

    var taskQuery = await firestore
        .collection("Task")
        .where('idDepartment', isEqualTo: idDepart)
        .get();
    for (var taskDoc in taskQuery.docs) {
      List<MemberInTask> empsInTask = [];
      final hastags = await firestore
          .collection("Task")
          .doc(taskDoc.id)
          .collection("Hastag")
          .get();
      final hastagData =
          hastags.docs.map((e) => TestLabel.fromSnapshot(e)).toList();

      final emps = await firestore
          .collection("Task")
          .doc(taskDoc.id)
          .collection("Members")
          .get();
      for (var ele in emps.docs) {
        String empID = ele.data()['id'];
        final getEmpInfoQuery =
            await firestore.collection('Users').doc(empID).get();

        String imgName = getEmpInfoQuery.data()!['image'];

        var urlRef =
            FirebaseStorage.instance.ref().child('avatar').child(imgName);
        String imgUrl = await urlRef.getDownloadURL();

        empsInTask.add(MemberInTask.fromSnapshot(getEmpInfoQuery, imgUrl));
      }

      final myTask = ManagerTaskModel.fromSnapshot(
          taskDoc, hastagData, empsInTask, idDepart);
      fullTasks.add(myTask);
    }
    return fullTasks;
  }

  Future<void> addTask(ManagerTaskModel newTask) async {
    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    String idDepart = userQuery.docs[0].data()['idDepartment'];

    var docRef =
        await firestore.collection("Task").add(newTask.toJson(idDepart));

    for (var item in newTask.label) {
      firestore
          .collection("Task")
          .doc(docRef.id)
          .collection("Hastag")
          .add(item.toJson());
    }
    for (var people in newTask.members) {
      firestore.collection("Task").doc(docRef.id).collection("Members").add(
            people.toJson(),
          );
    }
  }

  Future<void> completeTask(ManagerTaskModel task) async {
    final memInTaskQuery = await firestore
        .collection('Task')
        .doc(task.id)
        .collection('Members')
        .get();
    for (var memDoc in memInTaskQuery.docs) {
      String memID = memDoc.data()['id'];

      final memQuery = await firestore.collection('Users').doc(memID).get();
      double score = double.parse(memQuery.data()!['taskScore'].toString());
      double taskTotal =
          double.parse(memQuery.data()!['taskCountTotal'].toString());
      double taskSuccess =
          double.parse(memQuery.data()!['taskCountSuccess'].toString());

      if (DateFormat("MMM dd, yyyy")
              .parse(task.date)
              .difference(DateTime.now())
              .inDays >=
          0) {
        taskSuccess += 1;
        score += task.score / task.members.length;
      }

      taskTotal += 1;

      final docRef = firestore.collection('Users').doc(memID);
      await docRef.update({
        'taskScore': score,
        'taskCountTotal': taskTotal,
        'taskCountSuccess': taskSuccess
      });
    }
    await deleteTask(task.id);
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
    await docRef.update(newTask.toJson(newTask.idDepart));
  }

  Future<List<MemberInTask>> getAllMemberInDepartment() async {
    List<MemberInTask> result = [];

    final userQuery = await firestore
        .collection('Users')
        .where('email', isEqualTo: auth.currentUser!.email)
        .get();
    String idDepart = userQuery.docs[0].data()['idDepartment'];

    final allEmpQuery = await firestore
        .collection('Users')
        .where('idDepartment', isEqualTo: idDepart)
        .get();
    for (var empDoc in allEmpQuery.docs) {
      String imgName = empDoc.data()['image'];
      var urlRef =
          FirebaseStorage.instance.ref().child('avatar').child(imgName);
      String imgUrl = await urlRef.getDownloadURL();

      result.add(MemberInTask.fromSnapshot(empDoc, imgUrl));
    }

    return result;
  }
}
