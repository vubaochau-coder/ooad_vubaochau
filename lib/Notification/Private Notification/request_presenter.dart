import 'package:ooad_vubaochau/Notification/Private%20Notification/abstrac_request_view.dart';
import 'package:ooad_vubaochau/Notification/Private%20Notification/request_model.dart';

class RequestNotifyPresenter {
  final RequestNotiView view;
  final RequestNotifyModel model = RequestNotifyModel();

  RequestNotifyPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.getListRequest().then((value) => view.showListRequest(value));
    });
  }
}
