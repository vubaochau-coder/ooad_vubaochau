import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Home%20Screen/user_model.dart';

class HomeModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late String id;

  Future<TestUserModel?> futureUser() async {
    var user = auth.currentUser;
    if (user != null) {
      String uid = user.uid;

      final ref = await firestore.collection("Account").doc(uid).get();
      id = ref.get("idEmp");

      final userReference = firestore.collection("Users").doc(id);

      final snapshot = await userReference.get();

      if (snapshot.exists) {
        return TestUserModel.fromJson(snapshot.data()!);
      } else {
        return null;
      }
    }
    return null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get userChange {
    return firestore
        .collection("Users")
        .where("id", isEqualTo: auth.currentUser!.uid)
        .limit(1)
        .snapshots();
  }
}
