import 'package:ooad_vubaochau/QuanLyDoanThe/abstract_qldt_view.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/doan_the_item_model.dart';
import 'package:ooad_vubaochau/QuanLyDoanThe/quan_ly_doan_the_model.dart';

class QuanLyDoanThePresenter {
  final QuanLyDoanTheModel model = QuanLyDoanTheModel();
  final AbstractQuanLyDoanTheView view;

  QuanLyDoanThePresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.getListDoanThe().then((value) => view.getListDoanThe(value));
    });
  }

  Future<void> createDoanThe(DoanTheItemModel data) async {
    await model.onCreate(data);
  }
}
