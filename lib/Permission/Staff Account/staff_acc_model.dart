import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

class StaffAccModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<AccountInfoModel>> getListStaffAcc() async {
    List<AccountInfoModel> list = [];
    final query = await firestore
        .collection("Account")
        .where("levelPermission", isEqualTo: 3)
        .get();
    if (query.size > 0) {
      for (var item in query.docs) {
        String userName = item.data()["userName"];

        final secondQuery = await firestore
            .collection("Users")
            .where("email", isEqualTo: userName)
            .limit(1)
            .get();
        String name = secondQuery.docs[0].data()["name"];
        String position = secondQuery.docs[0].data()["position"];

        AccountInfoModel temp =
            AccountInfoModel.fromSnapshot(item, name, position);
        list.add(temp);
      }
    }
    return list;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get accChanges {
    return firestore
        .collection("Account")
        .where("levelPermission", isEqualTo: 3)
        .snapshots();
  }

  Future<void> onEnableAccount(String id) async {
    await firestore.collection("Account").doc(id).update({"isEnable": true});
  }

  Future<void> onDisableAccount(String id) async {
    await firestore.collection("Account").doc(id).update({"isEnable": false});
  }
}
