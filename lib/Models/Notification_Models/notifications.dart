import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel {
  final String id;
  final String title;
  final String details;
  final String date;
  final bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.details,
    required this.date,
    required this.isRead,
  });

  factory NotificationModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapShot, bool isRead) {
    final data = snapShot.data()!;
    return NotificationModel(
      id: snapShot.id,
      title: data['title'],
      details: data['description'],
      date: data['date'],
      isRead: isRead,
    );
  }
}
