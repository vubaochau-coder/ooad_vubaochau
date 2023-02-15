import 'package:ooad_vubaochau/QuanLyDonVi/abstract_ql_dv_view.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/don_vi_item_model.dart';
import 'package:ooad_vubaochau/QuanLyDonVi/quan_ly_don_vi_model.dart';

class QuanLyDonViPresenter {
  final QuanLyDonViModel model = QuanLyDonViModel();
  final AbstractQLDVView view;

  QuanLyDonViPresenter(this.view) {
    model.listenDatachange.listen((event) {
      model.getListDonVi().then((value) => view.getListDonVi(value));
    });
  }

  Future<void> createNewDonVi(DonViItemModel data) async {
    await model.onCreateNew(data);
  }
}
