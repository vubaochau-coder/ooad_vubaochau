import 'package:cloud_firestore/cloud_firestore.dart';

class TinhLuongItemModel {
  final String idNV;
  final String nameNV;
  final String idNgach;
  final String ngayVaoLam;
  final String idDonVi;
  final String idChucVu;
  final double heSoNgach;
  final double heSoChucVu;
  final double heSOTrinhDo;

  TinhLuongItemModel({
    required this.idNV,
    required this.nameNV,
    required this.idNgach,
    required this.ngayVaoLam,
    required this.idDonVi,
    required this.idChucVu,
    required this.heSoNgach,
    required this.heSoChucVu,
    required this.heSOTrinhDo,
  });

  factory TinhLuongItemModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    double hsN,
    double hsCV,
    double hsTd,
  ) {
    final data = snapshot.data()!;
    return TinhLuongItemModel(
      idNV: snapshot.id,
      nameNV: data['name'],
      idNgach: data['ngach'],
      ngayVaoLam: data['ngayVaoLam'],
      idDonVi: data['donVi'],
      idChucVu: data['chucVu'],
      heSoNgach: hsN,
      heSoChucVu: hsCV,
      heSOTrinhDo: hsTd,
    );
  }
}
