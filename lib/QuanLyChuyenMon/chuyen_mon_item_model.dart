import 'package:cloud_firestore/cloud_firestore.dart';

class ChuyenMonItemModel {
  final String id;
  final String name;
  final int countTrinhDo;

  ChuyenMonItemModel({
    required this.id,
    required this.name,
    required this.countTrinhDo,
  });

  factory ChuyenMonItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, int count) {
    final data = snapshot.data()!;

    return ChuyenMonItemModel(
      id: snapshot.id,
      name: data['name'],
      countTrinhDo: count,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
