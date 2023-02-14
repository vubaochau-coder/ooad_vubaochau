import 'package:intl/intl.dart';
import 'package:ooad_vubaochau/Create%20Notification/abstract_create_noti_view.dart';
import 'package:ooad_vubaochau/Create%20Notification/create_notification_model.dart';
import 'package:ooad_vubaochau/Models/Notification_Models/create_noti.dart';

class CreateNotiPresenter {
  final CreateNotiModel model = CreateNotiModel();
  final CreateNotiView view;
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  CreateNotiPresenter(this.view);

  Future<void> createNotification(String title, String description) async {
    NotiCreatedModel newNoti = NotiCreatedModel(
        title: title,
        description: description,
        date: dateFormat.format(DateTime.now()));
  }
}
