import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/doan_the_item_model.dart';

class QuanLyDoanTheModel {
  final firestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return firestore.collection('Đoàn Thể').snapshots();
  }

  Future<List<DoanTheItemModel>> getListDoanThe() async {
    List<DoanTheItemModel> result = [];

    final query = await firestore.collection("Đoàn Thể").get();
    for (var ele in query.docs) {
      String id = ele.id;
      List<Map<String, String>> mems = [];
      int count = 0;

      final temp = await firestore.collection("Nhân Viên").get();
      for (var mem in temp.docs) {
        String nvID = mem.id;

        final countMemQuery = await firestore
            .collection('Nhân Viên')
            .doc(nvID)
            .collection('Tham Gia Đoàn Thể')
            .where('idDoanThe', isEqualTo: id)
            .where('ngayRa', isEqualTo: '--/--/----')
            .get();
        if (countMemQuery.size > 0) {
          mems.add({'id': mem.id, 'name': mem.data()['name']});
          count++;
        }
      }
      result.add(DoanTheItemModel.fromSnapshot(ele, count, mems));
    }

    return result;
  }

  Future<void> onCreate(DoanTheItemModel data) async {
    await firestore.collection('Đoàn Thể').doc(data.id).set(data.toJson());
  }
}
