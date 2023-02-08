import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Home%20Screen/user_model.dart';

class HomeModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  late String id;

  Future<TestUserModel> futureUser() async {
    var user = auth.currentUser;

    final ref = await firestore
        .collection("Account")
        .where('userName', isEqualTo: user!.email)
        .get();
    String accID = ref.docs[0].id;
    int level = ref.docs[0].data()['levelPermission'];

    final userReference =
        firestore.collection("Users").where('id', isEqualTo: accID);

    final snapshot = await userReference.get();

    String image = snapshot.docs[0].data()['image'];
    var urlRef = FirebaseStorage.instance.ref().child('avatar').child(image);

    String imgUrl = await urlRef.getDownloadURL();
    return TestUserModel.fromJson(snapshot.docs[0].data(), imgUrl, level);
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get userChange {
    return firestore.collection("Users").snapshots();
  }
}
