import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_item_model.dart';

class TinhLuongModel {
  final firebase = FirebaseFirestore.instance;

  Future<List<TinhLuongItemModel>> getListEmsPayRoll(DateTime time) async {
    List<TinhLuongItemModel> result = [];
    final memQuery = await firebase.collection('Nhân Viên').get();
    for (var ele in memQuery.docs) {
      String idNgach = ele.data()['ngach'];
      String idDonVi = ele.data()['donVi'];
      String idChucVu = ele.data()['chucVu'];
      String ngayVaoLam = ele.data()['ngayVaoLam'];

      int namLam = daysBetween(time, convertStringToDate(ngayVaoLam));
      final ngachQuery = await firebase.collection('Ngạch').doc(idNgach).get();
      int nienHan = int.parse(ngachQuery.data()!['nienHan'].toString());
      int soBac = namLam ~/ nienHan;
      double heSoBac = 0;
      switch (soBac) {
        case 0:
          heSoBac = double.parse(ngachQuery.data()!['bac1'].toString());
          break;
        case 1:
          heSoBac = double.parse(ngachQuery.data()!['bac1'].toString());
          break;
        case 2:
          heSoBac = double.parse(ngachQuery.data()!['bac2'].toString());
          break;
        case 3:
          heSoBac = double.parse(ngachQuery.data()!['bac3'].toString());
          break;
        case 4:
          heSoBac = double.parse(ngachQuery.data()!['bac4'].toString());
          break;
        case 5:
          heSoBac = double.parse(ngachQuery.data()!['bac5'].toString());
          break;
        case 6:
          heSoBac = double.parse(ngachQuery.data()!['bac6'].toString());
          break;
        case 7:
          heSoBac = double.parse(ngachQuery.data()!['bac7'].toString());
          break;
        default:
          heSoBac = double.parse(ngachQuery.data()!['bac7'].toString());
          break;
      }

      final chucVu = await firebase
          .collection('Đơn Vị')
          .doc(idDonVi)
          .collection('Chức Vụ')
          .doc(idChucVu)
          .get();
      double heSoCv = double.parse(chucVu.data()!['phuCap'].toString());

      final trinhDo = await firebase
          .collection('Nhân Viên')
          .doc(ele.id)
          .collection('Trình Độ Nhân Viên')
          .get();
      double heSoTd = 0;
      for (var trinhDoEle in trinhDo.docs) {
        String idTrinhDo = trinhDoEle.data()['idTrinhDo'];
        String chuyenMonID = idTrinhDo.split('T')[0];
        final tempQuery = await firebase
            .collection('Chuyên Môn')
            .doc(chuyenMonID)
            .collection('Trình Độ')
            .doc(idTrinhDo)
            .get();
        heSoTd += double.parse(tempQuery.data()!['phuCap'].toString());
      }

      result.add(TinhLuongItemModel.fromSnapshot(ele, heSoBac, heSoCv, heSoTd));
    }
    return result;
  }

  DateTime convertStringToDate(String dateString) {
    return DateFormat("dd/MM/yyyy").parse(dateString);
  }

  int daysBetween(DateTime end, DateTime now) {
    return end.difference(now).inDays ~/ 365;
  }
}
