import 'package:ooad_vubaochau/Notification/General%20Noification/abstract_general_view.dart';
import 'package:ooad_vubaochau/Notification/General%20Noification/general_model.dart';

class GeneralPresenter {
  final GeneralModel model = GeneralModel();
  final AbStractNotiView view;

  GeneralPresenter(this.view) {
    model.listenNotiChanges.listen((event) {
      model.onGetListNoti().then((value) => view.getListNoti(value));
    });
  }

  void readNoti(String id) {
    model.readNotification(id).whenComplete(
        () => model.onGetListNoti().then((value) => view.getListNoti(value)));
  }
}
