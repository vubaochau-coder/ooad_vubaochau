import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/abstract_chuc_vu_chi_tiet.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/chuc_vu_chi_tiet_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/ChiTietChucVu/detail_chuc_vu_item_model.dart';
import 'package:ooad_vubaochau/QuanLyChucVu/don_vi_chuc_vu_item_model.dart';

class ChucVuChiTietPresenter {
  final ChucVuChiTietModel model = ChucVuChiTietModel();
  final AbstractChucVuChiTietView view;

  ChucVuChiTietPresenter(this.view, ChucVuItemModel data) {
    model.listenDataChange(data.idDonVi).listen((event) {
      model
          .onGetDetailChucVu(data.chucVu)
          .then((value) => view.getListChucVu(value));
    });
  }

  Future<void> addNewChucVu(DetailInfoChucVu chucVu) async {
    await model.onAddChucVu(chucVu);
  }

  Future<void> upDateChucVu(DetailInfoChucVu chucVu) async {
    await model.onEditChucVu(chucVu);
  }
}
