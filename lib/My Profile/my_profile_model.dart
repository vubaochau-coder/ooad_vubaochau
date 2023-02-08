import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/Employee_Models/profile_detail.dart';

class MyProfileModel {
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final storage = FirebaseStorage.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get userProfileChange {
    return firestore
        .collection("Users")
        .where("email", isEqualTo: auth.currentUser!.email)
        .snapshots();
  }

  Future<ProfileDetail> getMyProfile() async {
    String? currentUserName = auth.currentUser!.email;
    final accQuery = await firestore
        .collection("Account")
        .where("userName", isEqualTo: currentUserName)
        .get();
    int level = accQuery.docs[0].data()["levelPermission"];
    String idAccount = accQuery.docs[0].id;

    final userQuery = await firestore
        .collection("Users")
        .where("id", isEqualTo: idAccount)
        .get();
    String imageName = userQuery.docs[0].data()['image'];

    final dayworkQuery = await firestore
        .collection('Users')
        .doc(userQuery.docs[0].id)
        .collection('Record')
        .get();

    String imageURL =
        await storage.ref().child('avatar').child(imageName).getDownloadURL();

    ProfileDetail myProfile = ProfileDetail.fromSnapshot(
        userQuery.docs[0], level, dayworkQuery.size, imageURL);
    return myProfile;
  }

  Future<void> onEditMyProfile(
      String id, String name, String phone, String address) async {
    final docRef = firestore.collection('Users').doc(id);
    await docRef.update({
      'name': name,
      'phoneNumber': phone,
      'address': address,
    });
  }
}
