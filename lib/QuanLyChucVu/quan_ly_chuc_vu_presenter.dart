import 'package:ooad_vubaochau/QuanLyChucVu/abstract_quan_ly_chuc_vu_view.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/quan_ly_chuc_vu_model.dart';

class QuanLyChucVuPresenter {
  final QuanLyChucVuModel model = QuanLyChucVuModel();
  final AbstractQuanLyChucVuView view;

  QuanLyChucVuPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.onGetListChucVu().then((value) => view.getListChucVu(value));
    });
  }
}
