import 'package:cloud_firestore/cloud_firestore.dart';

class DoanTheItemModel {
  final String id;
  final String name;
  final int numMem;
  final List<Map<String, String>> mem;

  DoanTheItemModel({
    required this.id,
    required this.name,
    required this.mem,
    required this.numMem,
  });

  factory DoanTheItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      int count,
      List<Map<String, String>> mems) {
    final data = snapshot.data()!;
    return DoanTheItemModel(
      id: snapshot.id,
      name: data['name'],
      numMem: count,
      mem: mems,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
