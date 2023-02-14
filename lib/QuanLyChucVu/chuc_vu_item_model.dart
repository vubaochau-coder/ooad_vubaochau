import 'package:cloud_firestore/cloud_firestore.dart';

class ChucVuItemModel {
  final String id;
  final String name;
  final String year;
  final double phuCap;

  ChucVuItemModel({
    required this.id,
    required this.name,
    required this.year,
    required this.phuCap,
  });

  factory ChucVuItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String year,
      double heSo) {
    final data = snapshot.data()!;
    return ChucVuItemModel(
      id: snapshot.id,
      name: data['name'],
      year: year,
      phuCap: heSo,
    );
  }
}
