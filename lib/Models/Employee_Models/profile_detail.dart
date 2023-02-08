import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDetail {
  final String id;
  final String imageURL;
  final String name;
  final String position;
  final String address;
  final int levelPermission;
  final double taskSuccess;
  final double taskTotal;
  final int dayOff;
  final String email;
  final String phone;
  final int dayWorked;

  ProfileDetail({
    required this.id,
    required this.name,
    required this.imageURL,
    required this.position,
    required this.address,
    required this.levelPermission,
    required this.taskSuccess,
    required this.taskTotal,
    required this.dayOff,
    required this.email,
    required this.phone,
    required this.dayWorked,
  });

  factory ProfileDetail.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      int levelPer,
      int dayWorked,
      String imageURL) {
    final data = snapshot.data()!;
    return ProfileDetail(
      id: snapshot.id,
      name: data["name"],
      imageURL: imageURL,
      position: data["position"],
      address: data["address"],
      levelPermission: levelPer,
      taskSuccess: double.parse(data["taskCountSuccess"].toString()),
      taskTotal: double.parse(data["taskCountTotal"].toString()),
      dayOff: data["dayOff"],
      email: data["email"],
      phone: data["phoneNumber"],
      dayWorked: dayWorked,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "address": address,
      "phoneNumber": phone,
    };
  }
}
