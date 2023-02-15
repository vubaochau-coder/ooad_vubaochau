import 'package:cloud_firestore/cloud_firestore.dart';

class DonViItemModel {
  final String id;
  final String name;
  final String diaChi;
  final String soDienThoai;
  final String namThanhLap;
  final int numMember;

  DonViItemModel({
    required this.id,
    required this.name,
    required this.diaChi,
    required this.soDienThoai,
    required this.namThanhLap,
    required this.numMember,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': diaChi,
      'establishment': int.parse(namThanhLap),
      'name': name,
      'phone': soDienThoai,
    };
  }

  factory DonViItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, int num) {
    final data = snapshot.data()!;
    return DonViItemModel(
      id: snapshot.id,
      name: data['name'],
      diaChi: data['address'],
      soDienThoai: data['phone'],
      namThanhLap: data['establishment'].toString(),
      numMember: num,
    );
  }
}
