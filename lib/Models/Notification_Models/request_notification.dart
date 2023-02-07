import 'package:ooad_vubaochau/Models/Notification_Models/notifications.dart';

class RequestNotificationModel extends NotificationModel {
  final String idUserRequest;
  final String idUserRespone;
  final bool isAccepted;
  final bool isSalaryRequest;

  RequestNotificationModel({
    required this.idUserRequest,
    required this.idUserRespone,
    required this.isAccepted,
    required this.isSalaryRequest,
    required super.id,
    required super.title,
    required super.details,
    required super.date,
    required super.isRead,
  });
}
