import 'package:cloud_firestore/cloud_firestore.dart';

class NhanVienItemModel {
  final String id;
  final String name;
  final bool isMen;
  final String ngaySinh;
  final String danToc;
  final String ngayVaoLam;
  final String diaChi;
  final String soCMND;
  final String imgURL;
  final String ngayNghiLam;

  NhanVienItemModel({
    required this.id,
    required this.name,
    required this.isMen,
    required this.ngaySinh,
    required this.danToc,
    required this.ngayVaoLam,
    required this.diaChi,
    required this.soCMND,
    required this.imgURL,
    required this.ngayNghiLam,
  });

  factory NhanVienItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, String imgURL) {
    final data = snapshot.data()!;
    return NhanVienItemModel(
      id: snapshot.id,
      name: data['name'],
      isMen: data['isMen'],
      ngaySinh: data['ngaySinh'],
      danToc: data['danToc'],
      ngayVaoLam: data['ngayVaoLam'],
      diaChi: data['diaChi'],
      soCMND: data['soCMND'],
      imgURL: imgURL,
      ngayNghiLam: data['ngayNghiLam'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isMen': isMen,
      'ngaySinh': ngaySinh,
      'danToc': danToc,
      'ngayVaoLam': ngayVaoLam,
      'diaChi': diaChi,
      'soCMND': soCMND,
      'ngayNghiLam': ngayNghiLam,
    };
  }
}
