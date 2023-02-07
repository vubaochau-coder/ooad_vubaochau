import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserSingleton {
  late String userName;
  late String id;
  late String name;
  late int levelPermission;
  static final UserSingleton _instance = UserSingleton._internal();

  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  factory UserSingleton({
    userName,
    id,
    name,
    levelPermission,
  }) {
    _instance.name = name;
    _instance.userName = userName;
    _instance.id = id;
    _instance.levelPermission = levelPermission;

    return _instance;
  }
  UserSingleton._internal();

  Future<void> listenDataChange() async {
    firestore
        .collection("Users")
        .where("email", isEqualTo: auth.currentUser!.email)
        .snapshots()
        .listen((event) {
      UserSingleton temp = UserSingleton._internal();
      temp = UserSingleton(
          name: event.docs[0].data()["name"],
          id: temp.id,
          levelPermission: temp.levelPermission,
          userName: temp.userName);
    });
  }
}
