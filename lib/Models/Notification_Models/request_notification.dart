import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';

class RequestNotification extends MyNotification {
  final String idUserRequest;
  final String idUserRespone;
  final bool isAccepted;
  final bool isSalaryRequest;

  RequestNotification(
      super.title,
      super.details,
      super.date,
      this.idUserRequest,
      this.idUserRespone,
      this.isAccepted,
      this.isSalaryRequest);
}
