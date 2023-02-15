import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/don_vi_item_model.dart';

class QuanLyDonViModel {
  final firestore = FirebaseFirestore.instance;

  Future<List<DonViItemModel>> getListDonVi() async {
    List<DonViItemModel> result = [];

    final getDonVi = await firestore.collection('Đơn Vị').get();
    for (var ele in getDonVi.docs) {
      String id = ele.id;
      final getCountUser = await firestore
          .collection('Nhân Viên')
          .where('donVi', isEqualTo: id)
          .get();
      result.add(DonViItemModel.fromSnapshot(ele, getCountUser.size));
    }
    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDatachange {
    return firestore.collection('Đơn Vị').snapshots();
  }

  Future<void> onCreateNew(DonViItemModel data) async {
    await firestore.collection('Đơn Vị').doc(data.id).set(data.toJson());
  }
}
