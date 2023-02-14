import 'package:ooad_vubaochau/QuanLyNhanVien/abstract_quan_ly_nhan_vien.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/quan_ly_nhan_vien_model.dart';

class QuanLyNhanVienPresenter {
  final QuanLyNhanVienModel model = QuanLyNhanVienModel();
  final AbstractQuanLyNhanVienView view;

  QuanLyNhanVienPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.onGetListNhanVien().then((value) => view.getListNhanVien(value));
    });
  }
}
