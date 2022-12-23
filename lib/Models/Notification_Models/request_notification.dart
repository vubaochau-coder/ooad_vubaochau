import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';

class RequestNotificationModel extends NotificationModel {
  final String idUserRequest;
  final String idUserRespone;
  final bool isAccepted;
  final bool isSalaryRequest;

  RequestNotificationModel(
      super.title,
      super.details,
      super.date,
      this.idUserRequest,
      this.idUserRespone,
      this.isAccepted,
      this.isSalaryRequest);
}
