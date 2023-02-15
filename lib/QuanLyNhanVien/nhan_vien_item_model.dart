import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/Models/tham_gia_don_vi_model.dart';

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

  final String ngachID;
  final String ngach;
  final String donViID;
  final String donVi;
  final String chucVuID;
  final String chucVu;

  final List<ThamGiaDonVi> quaTrinhLamViec;

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
    required this.ngach,
    required this.ngachID,
    required this.chucVu,
    required this.chucVuID,
    required this.donVi,
    required this.donViID,
    required this.quaTrinhLamViec,
  });

  factory NhanVienItemModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    String imgURL,
    String ngacH,
    String ngachid,
    String chucvu,
    String chucvuid,
    String donvi,
    String donviid,
    List<ThamGiaDonVi> quaTrinh,
  ) {
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
      ngach: ngacH,
      chucVu: chucvu,
      donVi: donvi,
      donViID: donviid,
      chucVuID: chucvuid,
      ngachID: ngachid,
      quaTrinhLamViec: quaTrinh,
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
