import 'package:cloud_firestore/cloud_firestore.dart';

class ThamGiaDonVi {
  final String id;
  final String idChucVu;
  final String chucVu;
  final String idDonVi;
  final String donVi;
  final String ngayVao;
  final String ngayRa;

  ThamGiaDonVi({
    required this.id,
    required this.idChucVu,
    required this.chucVu,
    required this.donVi,
    required this.idDonVi,
    required this.ngayVao,
    required this.ngayRa,
  });

  factory ThamGiaDonVi.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String donvi,
      String chucvu) {
    final data = snapshot.data()!;
    return ThamGiaDonVi(
      id: snapshot.id,
      idChucVu: data['idChucVu'],
      chucVu: chucvu,
      donVi: donvi,
      idDonVi: data['idDonVi'],
      ngayVao: data['ngayVao'],
      ngayRa: data['ngayRa'],
    );
  }
}
