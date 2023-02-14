import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/than_nhan_item_model.dart';

class QuanLyThanNhanModel {
  final fireStore = FirebaseFirestore.instance;

  Future<List<ThanNhanItemModel>> onGetListThanNhan() async {
    List<ThanNhanItemModel> resuilt = [];
    final getNhanVienQuery = await fireStore.collection('Nhân Viên').get();
    for (var ele in getNhanVienQuery.docs) {
      String idNhanVien = ele.id;
      String nameNhanVien = ele.data()['name'];

      final getThanNhanQuery = await fireStore
          .collection('Nhân Viên')
          .doc(idNhanVien)
          .collection('Thân Nhân')
          .get();

      for (var item in getThanNhanQuery.docs) {
        resuilt.add(
            ThanNhanItemModel.fromSnapshot(item, idNhanVien, nameNhanVien));
      }
    }
    return resuilt;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return fireStore.collection('Nhân Viên').snapshots();
  }
}
