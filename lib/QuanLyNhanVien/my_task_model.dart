import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_label_model.dart';

class MyTaskScreenModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<List<ManagerTaskModel>> getMyTaskList() async {
    List<ManagerTaskModel> listData = [];

    final currentUser = auth.currentUser;
    final accQuery = await firestore
        .collection('Account')
        .where('userName', isEqualTo: currentUser!.email)
        .get();
    String accID = accQuery.docs[0].id;

    final userQuery =
        await firestore.collection('Users').where('id', isEqualTo: accID).get();
    String userID = userQuery.docs[0].id;
    String myDepart = userQuery.docs[0].data()['idDepartment'];

    final taskQuery = await firestore
        .collection('Task')
        .where('idDepartment', isEqualTo: myDepart)
        .get();

    if (taskQuery.docs.isNotEmpty) {
      for (var taskDoc in taskQuery.docs) {
        List<MemberInTask> empsInTask = [];
        final empInTaskQuery = await firestore
            .collection('Task')
            .doc(taskDoc.id)
            .collection('Members')
            .where('id', isEqualTo: userID)
            .get();
        if (empInTaskQuery.docs.isNotEmpty) {
          final hastags = await firestore
              .collection("Task")
              .doc(taskDoc.id)
              .collection("Hastag")
              .get();
          final hastagData =
              hastags.docs.map((e) => TestLabel.fromSnapshot(e)).toList();

          final empsID = await firestore
              .collection("Task")
              .doc(taskDoc.id)
              .collection("Members")
              .get();
          for (var empsIDDoc in empsID.docs) {
            String tempEmpID = empsIDDoc.data()['id'];
            final getEmpInfoQuery =
                await firestore.collection('Users').doc(tempEmpID).get();
            String imgName = getEmpInfoQuery.data()!['image'];

            var urlRef =
                FirebaseStorage.instance.ref().child('avatar').child(imgName);
            String imgUrl = await urlRef.getDownloadURL();

            empsInTask.add(MemberInTask.fromSnapshot(getEmpInfoQuery, imgUrl));
          }

          final myTask = ManagerTaskModel.fromSnapshot(
              taskDoc, hastagData, empsInTask, myDepart);
          listData.add(myTask);
        }
      }
    }

    return listData;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listtenDataChanges {
    return firestore.collection('Task').snapshots();
  }
}
