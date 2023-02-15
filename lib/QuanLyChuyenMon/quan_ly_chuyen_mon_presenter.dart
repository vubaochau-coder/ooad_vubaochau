import 'package:ooad_vubaochau/QuanLyChuyenMon/abstract_qlcm_view.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/chuyen_mon_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChuyenMon/quan_ly_chuyen_mon_model.dart';

class QuanLyChuyenMonPresenter {
  final QuanLyChuyenMonModel model = QuanLyChuyenMonModel();
  final AbstractQuanLyChuyenMonView view;

  QuanLyChuyenMonPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.getListChuyenMon().then((value) => view.getListChuyenMon(value));
    });
  }
  Future<void> createChuyenMon(ChuyenMonItemModel data) async {
    await model.onCreateNew(data);
  }
}
