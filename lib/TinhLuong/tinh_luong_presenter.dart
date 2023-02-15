import 'package:ooad_vubaochau/TinhLuong/abstraft_tinh_luong_view.dart';
import 'package:ooad_vubaochau/TinhLuong/tinh_luong_model.dart';

class TinhLuongPresenter {
  final TinhLuongModel model = TinhLuongModel();
  final AbstractTinhLuongView view;

  TinhLuongPresenter(this.view, DateTime time) {
    getListLuong(time);
  }

  Future<void> getListLuong(DateTime time) async {
    model.getListEmsPayRoll(time).then((value) => view.getListPayRoll(value));
  }
}
