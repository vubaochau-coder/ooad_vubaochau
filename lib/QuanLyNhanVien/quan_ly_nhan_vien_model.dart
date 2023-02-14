
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';

class QuanLyNhanVienModel {
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<List<NhanVienItemModel>> onGetListNhanVien() async {
    List<NhanVienItemModel> datas = [];

    final getAllNhanVienQuery = await fireStore.collection('Nhân Viên').get();

    for (var ele in getAllNhanVienQuery.docs) {
      String imgName = ele.data()['imgName'];
      var urlRef = storage.ref().child('avatar').child(imgName);
      String imgUrl = await urlRef.getDownloadURL();
      datas.add(
        NhanVienItemModel.fromSnapshot(ele, imgUrl),
      );
    }
    return datas;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return fireStore.collection('Nhân Viên').snapshots();
  }
}
