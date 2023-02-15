import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/chuc_vu_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_chuc_vu_item_model.dart';

class QuanLyChucVuModel {
  final firestore = FirebaseFirestore.instance;

  Future<List<ChucVuItemModel>> onGetListChucVu() async {
    List<ChucVuItemModel> result = [];

    final donViQuery = await firestore.collection('Đơn Vị').get();

    for (var ele in donViQuery.docs) {
      String idDonVi = ele.id;
      List<ChucVu> chucVuList = [];

      final chucVuQuery = await firestore
          .collection('Đơn Vị')
          .doc(idDonVi)
          .collection('Chức Vụ')
          .get();

      for (var chucVuEle in chucVuQuery.docs) {
        ChucVu temp = ChucVu.fromSnapshot(chucVuEle);
        chucVuList.add(temp);
      }

      result.add(ChucVuItemModel.fromSnapshot(ele, chucVuList));
    }

    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Đơn Vị').snapshots();
  }
}
