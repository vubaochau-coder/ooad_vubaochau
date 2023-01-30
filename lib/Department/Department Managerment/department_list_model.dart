import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentListModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<List<DepartmentModel>> getListDepartment() async {
    List<DepartmentModel> myListDepart = [];
    final depart = await firestore.collection("Department").get();
    for (var item in depart.docs) {
      List<String> idList = [];
      final temp = await firestore
          .collection("Users")
          .where("idDepartment", isEqualTo: item.id)
          .get();
      for (var ele in temp.docs) {
        final nameEmpsQuery =
            await firestore.collection("Users").doc(ele.id).get();
        idList.add(nameEmpsQuery.data()!["name"]);
      }

      String idManager = item.data()["manager"];
      final managerInfo =
          await firestore.collection("Users").doc(idManager).get();
      String nameManager = managerInfo.data()!["name"];
      myListDepart.add(DepartmentModel.fromSnapshot(item, nameManager, idList));
    }

    return myListDepart;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get streamDepartment {
    return firestore.collection("Department").snapshots();
  }
}
