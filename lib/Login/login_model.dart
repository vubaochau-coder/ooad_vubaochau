import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/user_singleton.dart';

class LoginModel {
  Future<int> onLogin(String userName, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userName, password: password)
          .whenComplete(() {});

      return 100;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return 101;
      }
      if (e.code == 'invalid-email') {
        return 102;
      }
      if (e.code == 'user-disabled') {
        return 103;
      }
      if (e.code == 'user-not-found') {
        return 104;
      }
      return 105;
    }
  }

  Future<UserSingleton?> futureUser() async {
    late String id;
    var user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String uid = user.uid;

      final ref =
          await FirebaseFirestore.instance.collection("Account").doc(uid).get();
      id = ref.get("idEmp");

      final userReference =
          FirebaseFirestore.instance.collection("Users").doc(id);

      final snapshot = await userReference.get();

      if (snapshot.exists) {
        return null;
      } else {
        return null;
      }
    }
    return null;
  }
}
