import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/my_profile_model.dart';

class MyProfileModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get userProfileChange {
    return firestore
        .collection("Users")
        .where("email", isEqualTo: auth.currentUser!.email)
        .snapshots();
  }

  Future<ProfileDetail> getMyProfile() async {
    String? currentUserName = auth.currentUser!.email;
    final query = await firestore
        .collection("Account")
        .where("userName", isEqualTo: currentUserName)
        .get();
    int level = query.docs[0].data()["levelPermission"];
    String idAccount = query.docs[0].id;
    final query2 = await firestore
        .collection("Users")
        .where("id", isEqualTo: idAccount)
        .get();
    ProfileDetail myProfile =
        ProfileDetail.fromSnapshot(query2.docs[0], level, 0);
    return myProfile;
  }
}
