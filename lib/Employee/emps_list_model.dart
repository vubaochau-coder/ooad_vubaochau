import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/employee_item_model.dart';

class EmpsMngListModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  Future<List<EmployeeItemModel>> onGetListEmp() async {
    List<EmployeeItemModel> emps = [];

    final accQuery = await firestore
        .collection('Account')
        .where('userName', isEqualTo: auth.currentUser!.email)
        .get();

    int levelPer = accQuery.docs[0].data()['levelPermission'];

    if (levelPer == 1) {
      final allUserQuery = await firestore.collection('Users').get();
      for (var ele in allUserQuery.docs) {
        String imgName = ele.data()['image'];
        var urlRef =
            FirebaseStorage.instance.ref().child('avatar').child(imgName);
        String imgUrl = await urlRef.getDownloadURL();

        String tempAccID = ele.data()['id'];
        var tempAccQuery =
            await firestore.collection('Account').doc(tempAccID).get();
        int level = tempAccQuery.data()!['levelPermission'];
        String dateCreated = tempAccQuery.data()!['dateCreated'];

        emps.add(
            EmployeeItemModel.fromSnapshot(ele, imgUrl, level, dateCreated));
      }
    } else {
      if (levelPer == 2) {
        String accID = accQuery.docs[0].id;
        final currentUserQuery = await firestore
            .collection('Users')
            .where('id', isEqualTo: accID)
            .get();
        String idDepart = currentUserQuery.docs[0].data()['idDepartment'];

        final empsInDepartQuery = await firestore
            .collection('Users')
            .where('idDepartment', isEqualTo: idDepart)
            .get();
        for (var ele in empsInDepartQuery.docs) {
          String imgName = ele.data()['image'];
          var urlRef =
              FirebaseStorage.instance.ref().child('avatar').child(imgName);
          String imgUrl = await urlRef.getDownloadURL();

          String tempAccID = ele.data()['id'];
          var tempAccQuery =
              await firestore.collection('Account').doc(tempAccID).get();
          int level = tempAccQuery.data()!['levelPermission'];
          String dateCre = tempAccQuery.data()!['dateCreated'];

          emps.add(EmployeeItemModel.fromSnapshot(ele, imgUrl, level, dateCre));
        }
      }
    }
    return emps;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Users').snapshots();
  }
}
