import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:ooad_vubaochau/Models/tham_gia_don_vi_model.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/nhan_vien_item_model.dart';

class QuanLyNhanVienModel {
  final fireStore = FirebaseFirestore.instance;
  final storage = FirebaseStorage.instance;

  Future<List<NhanVienItemModel>> onGetListNhanVien() async {
    List<NhanVienItemModel> datas = [];

    final getAllNhanVienQuery = await fireStore.collection('Nhân Viên').get();

    for (var ele in getAllNhanVienQuery.docs) {
      String imgName = ele.data()['imgName'];
      String ngachID = ele.data()['ngach'];
      String donViID = ele.data()['donVi'];
      String chucVuID = ele.data()['chucVu'];
      List<ThamGiaDonVi> quaTrinhList = [];

      final ngachQuery = await fireStore.collection('Ngạch').doc(ngachID).get();
      String ngachName = ngachQuery.data()!['name'];

      final donViQuery =
          await fireStore.collection('Đơn Vị').doc(donViID).get();
      String donViName = donViQuery.data()!['name'];

      final chucVuQuery = await fireStore
          .collection('Đơn Vị')
          .doc(donViID)
          .collection('Chức Vụ')
          .doc(chucVuID)
          .get();
      String chucVuName = chucVuQuery.data()!['name'];

      var urlRef = storage.ref().child('avatar').child(imgName);
      String imgUrl = await urlRef.getDownloadURL();

      final quaTrinhQuery = await fireStore
          .collection('Nhân Viên')
          .doc(ele.id)
          .collection('Tham Gia Đơn Vị')
          .get();
      for (var quaTrinhItem in quaTrinhQuery.docs) {
        String tempIDCV = quaTrinhItem.data()['idChucVu'];
        String tempIDDV = quaTrinhItem.data()['idDonVi'];

        final tempDVqr =
            await fireStore.collection('Đơn Vị').doc(tempIDDV).get();
        final tempCVqr = await fireStore
            .collection('Đơn Vị')
            .doc(tempIDDV)
            .collection('Chức Vụ')
            .doc(tempIDCV)
            .get();
        quaTrinhList.add(ThamGiaDonVi.fromSnapshot(
            quaTrinhItem, tempDVqr.data()!['name'], tempCVqr.data()!['name']));
      }

      datas.add(
        NhanVienItemModel.fromSnapshot(
          ele,
          imgUrl,
          ngachName,
          ngachID,
          chucVuName,
          chucVuID,
          donViName,
          donViID,
          quaTrinhList,
        ),
      );
    }
    return datas;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> get listenDataChange {
    return fireStore.collection('Nhân Viên').snapshots();
  }
}
