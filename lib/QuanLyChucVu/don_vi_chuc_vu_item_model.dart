import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/chuc_vu_model.dart';

class ChucVuItemModel {
  final String idDonVi;
  final String nameDonVi;
  List<ChucVu> chucVu;

  ChucVuItemModel({
    required this.idDonVi,
    required this.nameDonVi,
    required this.chucVu,
  });

  factory ChucVuItemModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot, List<ChucVu> chuc) {
    final data = snapshot.data()!;
    return ChucVuItemModel(
      idDonVi: snapshot.id,
      nameDonVi: data['name'],
      chucVu: chuc,
    );
  }
}
