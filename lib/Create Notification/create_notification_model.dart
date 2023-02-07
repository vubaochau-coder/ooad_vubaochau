import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/create_noti.dart';

class CreateNotiModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Future<void> onCreaetNotification(NotiCreatedModel newNoti) async {
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      final queryUser = await firestore
          .collection("Account")
          .where('userName', isEqualTo: currentUser.email)
          .limit(1)
          .get();
      int levelPer = queryUser.docs[0].data()['levelPermission'];
      if (levelPer == 1) {
        final docRef = await firestore
            .collection("Notification")
            .add(newNoti.toJson('all'));
        await addReadStatusForEmp('all', docRef.id);
      } else {
        if (levelPer == 2) {
          String uid = queryUser.docs[0].id;
          final query = await firestore
              .collection('Users')
              .where('id', isEqualTo: uid)
              .limit(1)
              .get();
          String idDepart = query.docs[0].data()['idDepartment'];
          final docRef = await firestore
              .collection('Notification')
              .add(newNoti.toJson(idDepart));
          await addReadStatusForEmp(idDepart, docRef.id);
        }
      }
    }
  }

  Future<void> addReadStatusForEmp(String idDepart, String idNoti) async {
    if (idDepart == 'all') {
      final query = await firestore.collection('Users').get();
      for (var ele in query.docs) {
        await firestore
            .collection('Users')
            .doc(ele.id)
            .collection('ReadStatus')
            .add({
          'idNoti': idNoti,
          'isRead': false,
        });
      }
    } else {
      final query = await firestore
          .collection('Users')
          .where('idDepartment', isEqualTo: idDepart)
          .get();
      for (var ele in query.docs) {
        await firestore
            .collection('Users')
            .doc(ele.id)
            .collection('ReadStatus')
            .add({
          'idNoti': idNoti,
          'isRead': false,
        });
      }
    }
  }
}
