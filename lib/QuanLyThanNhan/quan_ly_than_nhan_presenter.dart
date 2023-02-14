import 'package:ooad_vubaochau/QuanLyThanNhan/abstract_quan_ly_than_nhan_view.dart';
import 'package:ooad_vubaochau/QuanLyThanNhan/quan_lu_than_nhan_model.dart';

class QuanLyThanNhanPresenter {
  final QuanLyThanNhanModel model = QuanLyThanNhanModel();
  final AbstractQuanLyThanNhanView view;

  QuanLyThanNhanPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.onGetListThanNhan().then((value) => view.getListThanNhan(value));
    });
  }
}
