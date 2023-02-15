import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/chuyen_mon_item_model.dart';

class QuanLyChuyenMonModel {
  final firestore = FirebaseFirestore.instance;

  Future<List<ChuyenMonItemModel>> getListChuyenMon() async {
    List<ChuyenMonItemModel> result = [];

    final chuyenMonQuery = await firestore.collection('Chuyên Môn').get();
    for (var ele in chuyenMonQuery.docs) {
      String id = ele.id;

      final temp = await firestore
          .collection('Chuyên Môn')
          .doc(id)
          .collection('Trình Độ')
          .get();
      result.add(ChuyenMonItemModel.fromSnapshot(ele, temp.size));
    }
    return result;
  }

  Future<void> onCreateNew(ChuyenMonItemModel data) async {
    await firestore.collection('Chuyên Môn').doc(data.id).set(data.toJson());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Chuyên Môn').snapshots();
  }
}
