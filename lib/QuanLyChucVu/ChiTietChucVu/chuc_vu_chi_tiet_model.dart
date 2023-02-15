import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/detail_chuc_vu_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/chuc_vu_model.dart';

class ChucVuChiTietModel {
  final firestore = FirebaseFirestore.instance;

  Future<List<DetailInfoChucVu>> onGetDetailChucVu(List<ChucVu> chucVu) async {
    if (chucVu.isNotEmpty) {
      List<DetailInfoChucVu> result = [];

      String idDonVi = chucVu[0].id.substring(0, 5);

      for (var ele in chucVu) {
        List<Map<String, String>> nhanvien = [];
        final getNhanVienQuery = await firestore
            .collection("Nhân Viên")
            .where('chucVu', isEqualTo: ele.id)
            .get();

        for (var mem in getNhanVienQuery.docs) {
          String memID = mem.id;
          String memName = mem.data()['name'];
          nhanvien.add({'id': memID, 'name': memName});
        }
        result.add(DetailInfoChucVu(
            idChucVu: ele.id,
            idDonVi: idDonVi,
            nameChucVu: ele.name,
            mem: nhanvien,
            phuCap: ele.phuCap));
      }
      return result;
    } else {
      return [];
    }
  }

  Future<void> onAddChucVu(DetailInfoChucVu chucVu) async {
    await firestore
        .collection('Đơn Vị')
        .doc(chucVu.idDonVi)
        .collection('Chức Vụ')
        .doc(chucVu.idChucVu)
        .set(chucVu.toJson());
  }

  Future<void> onEditChucVu(DetailInfoChucVu chucVu) async {
    await firestore
        .collection('Đơn Vị')
        .doc(chucVu.idDonVi)
        .collection('Chức Vụ')
        .doc(chucVu.idChucVu)
        .update(chucVu.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> listenDataChange(String idDV) {
    return firestore
        .collection('Đơn Vị')
        .doc(idDV)
        .collection('Chức Vụ')
        .snapshots();
  }
}
