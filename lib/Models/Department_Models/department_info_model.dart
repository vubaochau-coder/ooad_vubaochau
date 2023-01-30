import 'package:cloud_firestore/cloud_firestore.dart';

class DepartmentModel {
  final String id;
  final String name;
  final int taskTotal;
  final int taskSuccess;
  final String manager;
  final String idManager;
  final List<String> idEmps;

  DepartmentModel({
    required this.id,
    required this.name,
    required this.manager,
    required this.idManager,
    required this.taskTotal,
    required this.taskSuccess,
    required this.idEmps,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'manager': manager,
      'taskTotal': taskTotal,
      'taskSuccess': taskSuccess,
    };
  }

  factory DepartmentModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String nameManager,
      List<String> ids) {
    final data = snapshot.data()!;
    return DepartmentModel(
      id: snapshot.id,
      name: data["name"],
      idManager: data["manager"],
      manager: nameManager,
      taskTotal: data["taskTotal"],
      taskSuccess: data["taskSuccess"],
      idEmps: ids,
    );
  }
}
