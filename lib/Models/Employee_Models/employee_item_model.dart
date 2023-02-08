import 'package:cloud_firestore/cloud_firestore.dart';

class EmployeeItemModel {
  late String id;
  late String name;
  late String imgURL;
  late String position;
  final int levelPer;
  final String dateCreated;
  final String address;
  final String email;
  final String phone;
  final double taskCountTotal;
  final double taskCountSuccess;
  final double taskScore;

  EmployeeItemModel({
    required this.id,
    required this.name,
    required this.imgURL,
    required this.position,
    required this.levelPer,
    required this.dateCreated,
    required this.address,
    required this.email,
    required this.phone,
    required this.taskCountTotal,
    required this.taskCountSuccess,
    required this.taskScore,
  });

  factory EmployeeItemModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    String imgURL,
    int levelPer,
    String dateCreated,
  ) {
    final data = snapshot.data()!;
    return EmployeeItemModel(
      id: snapshot.id,
      name: data['name'],
      imgURL: imgURL,
      position: data['position'],
      levelPer: levelPer,
      dateCreated: dateCreated,
      email: data['email'],
      phone: data['phoneNumber'],
      address: data['address'],
      taskCountSuccess: double.parse(data['taskCountSuccess'].toString()),
      taskCountTotal: double.parse(data['taskCountTotal'].toString()),
      taskScore: double.parse(data['taskScore'].toString()),
    );
  }
}
