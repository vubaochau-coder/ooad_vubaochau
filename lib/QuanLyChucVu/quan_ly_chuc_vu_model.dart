import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/chuc_vu_item_model.dart';

class QuanLyChucVuModel {
  final firestore = FirebaseFirestore.instance;

  Future<List<ChucVuItemModel>> onGetListChucVu() async {
    List<ChucVuItemModel> result = [];

    final chucVuQuery = await firestore.collection('Chức Vụ').get();
    for (var ele in chucVuQuery.docs) {
      String idChucVu = ele.id;

      final phuCapQuery = await firestore
          .collection('Chức Vụ')
          .doc(idChucVu)
          .collection('Phụ Cấp')
          .get();

      for (var phuCapEle in phuCapQuery.docs) {
        String year = phuCapEle.id.split('C')[1];
        double heSoPC = double.parse(phuCapEle.data()['heSoPhuCap'].toString());

        result.add(ChucVuItemModel.fromSnapshot(ele, year, heSoPC));
      }
    }

    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Chức Vụ').snapshots();
  }
}
