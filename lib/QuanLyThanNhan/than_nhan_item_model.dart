import 'package:cloud_firestore/cloud_firestore.dart';

class ThanNhanItemModel {
  final String id;
  final String name;
  final String idNV;
  final String nameNV;
  final String quanHe; //con cái hoặc vợ chồng
  final String ngaySinh;
  final String ngheNghiep;

  ThanNhanItemModel({
    required this.id,
    required this.name,
    required this.idNV,
    required this.nameNV,
    required this.quanHe,
    required this.ngaySinh,
    required this.ngheNghiep,
  });

  factory ThanNhanItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String idNv,
      String nameNv) {
    final data = snapshot.data()!;
    return ThanNhanItemModel(
      id: snapshot.id,
      name: data['name'],
      idNV: idNv,
      nameNV: nameNv,
      quanHe: data['quanHe'],
      ngaySinh: data['ngaySinh'],
      ngheNghiep: data['ngheNghiep'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ngheNghiep': ngheNghiep,
      'quanHe': quanHe,
      'ngaySinh': ngaySinh,
    };
  }
}
