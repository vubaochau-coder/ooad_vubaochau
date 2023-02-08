import 'package:cloud_firestore/cloud_firestore.dart';

class AccountInfoModel {
  final String id;
  final String name;
  final String dateCreate;
  final String lastLogin;
  final String position;
  final String email;
  late bool isActive;
  final String imgURL;

  AccountInfoModel({
    required this.id,
    required this.name,
    required this.dateCreate,
    required this.lastLogin,
    required this.email,
    required this.position,
    required this.isActive,
    required this.imgURL,
  });

  factory AccountInfoModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String name,
      String position,
      String image) {
    final data = snapshot.data()!;
    return AccountInfoModel(
      id: snapshot.id,
      name: name,
      dateCreate: data["dateCreated"],
      lastLogin: data["lastLogin"],
      email: data["userName"],
      position: position,
      isActive: data["isEnable"],
      imgURL: image,
    );
  }
}
