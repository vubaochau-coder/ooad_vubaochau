import 'package:firebase_auth/firebase_auth.dart';

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
}
