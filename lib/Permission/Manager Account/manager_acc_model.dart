import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/Account_Models/account_info_model.dart';

class MngAccModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<AccountInfoModel>> getListMngAcc() async {
    List<AccountInfoModel> listMngAcc = [];
    final query = await firestore
        .collection("Account")
        .where("levelPermission", isEqualTo: 2)
        .get();
    if (query.size > 0) {
      for (var item in query.docs) {
        String userName = item.data()["userName"];

        final tempQuery = await firestore
            .collection("Users")
            .where("email", isEqualTo: userName)
            .limit(1)
            .get();
        String name = tempQuery.docs[0].data()["name"];
        String position = tempQuery.docs[0].data()["position"];

        String imgName = tempQuery.docs[0].data()['image'];
        var urlRef =
            FirebaseStorage.instance.ref().child('avatar').child(imgName);
        String imgUrl = await urlRef.getDownloadURL();

        final newAcc =
            AccountInfoModel.fromSnapshot(item, name, position, imgUrl);
        listMngAcc.add(newAcc);
      }
    }
    return listMngAcc;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get accChanges {
    return firestore
        .collection("Account")
        .where("levelPermission", isEqualTo: 2)
        .snapshots();
  }

  Future<void> onDisableAccount(String id) async {
    DocumentReference docRef = firestore.collection("Account").doc(id);
    await docRef.update({"isEnable": false});
  }

  Future<void> onEnableAccount(String id) async {
    DocumentReference docRef = firestore.collection("Account").doc(id);
    await docRef.update({"isEnable": true});
  }
}
