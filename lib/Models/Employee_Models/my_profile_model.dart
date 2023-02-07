import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileDetail {
  final String id;
  final String name;
  final String position;
  final String address;
  final int levelPermission;
  final int taskSuccess;
  final int taskTotal;
  final int dayOff;
  final String email;
  final String phone;
  final int dayWorked;

  ProfileDetail({
    required this.id,
    required this.name,
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
      int dayWorked) {
    final data = snapshot.data()!;
    return ProfileDetail(
      id: snapshot.id,
      name: data["name"],
      position: data["position"],
      address: data["address"],
      levelPermission: levelPer,
      taskSuccess: data["taskCountSuccess"],
      taskTotal: data["taskCountTotal"],
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
