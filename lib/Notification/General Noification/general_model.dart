import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';

class GeneralModel {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<List<NotificationModel>> onGetListNoti() async {
    List<NotificationModel> result = [];
    String accID, userID, idDepart;
    final accountQuery = await firestore
        .collection('Account')
        .where('userName', isEqualTo: auth.currentUser!.email)
        .get();
    accID = accountQuery.docs[0].id;

    final userQuery = await firestore
        .collection("Users")
        .where('id', isEqualTo: accID)
        .limit(1)
        .get();
    userID = userQuery.docs[0].id;
    idDepart = userQuery.docs[0].data()['idDepartment'];

    final getAllNoti = await firestore
        .collection('Notification')
        .where('idDepartment', isEqualTo: 'all')
        .get();
    for (var ele in getAllNoti.docs) {
      final readStatusQuery = await firestore
          .collection('Users')
          .doc(userID)
          .collection('ReadStatus')
          .where('idNoti', isEqualTo: ele.id)
          .get();
      bool isRead = readStatusQuery.docs[0].data()['isRead'];
      result.add(NotificationModel.fromSnapshot(ele, isRead));
    }

    final getDepartNoti = await firestore
        .collection('Notification')
        .where('idDepartment', isEqualTo: idDepart)
        .get();
    for (var ele in getDepartNoti.docs) {
      final readStatusQuery = await firestore
          .collection('Users')
          .doc(userID)
          .collection('ReadStatus')
          .where('idNoti', isEqualTo: ele.id)
          .get();
      bool isRead = readStatusQuery.docs[0].data()['isRead'];
      result.add(NotificationModel.fromSnapshot(ele, isRead));
    }
    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenNotiChanges {
    return firestore.collection("Notification").snapshots();
  }
}
