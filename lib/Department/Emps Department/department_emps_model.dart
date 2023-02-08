import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/Department_Models/emps_depart_model.dart';

class EmpsDepartModel {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<EmpsDepartInfo>> getListEmpsDepart() async {
    List<EmpsDepartInfo> emps = [];
    final query = await firestore.collection("Users").get();
    for (var ele in query.docs) {
      String idDepart = ele.data()["idDepartment"];
      String idAccount = ele.data()["id"];
      String nameEmp = ele.data()["name"];
      String imgName = ele.data()['image'];

      var urlRef =
          FirebaseStorage.instance.ref().child('avatar').child(imgName);
      String imgUrl = await urlRef.getDownloadURL();

      final getNameDepart =
          await firestore.collection("Department").doc(idDepart).get();
      String nameDepart = getNameDepart.data()!["name"];

      final getPermiss =
          await firestore.collection("Account").doc(idAccount).get();
      int levelPer = getPermiss.data()!["levelPermission"];

      EmpsDepartInfo temp = EmpsDepartInfo(
        id: ele.id,
        name: nameEmp,
        idAcc: idAccount,
        levelPermission: levelPer,
        idDepart: idDepart,
        department: nameDepart,
        imgURL: imgUrl,
      );
      emps.add(temp);
    }
    return emps;
  }
}
