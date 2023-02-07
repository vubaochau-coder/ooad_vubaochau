import 'package:cloud_firestore/cloud_firestore.dart';

class AttendanceDay {
  final String id;
  final String checkIn;
  final String checkOut;
  final String userID;
  final String day;
  final int totalCheckInDay;

  AttendanceDay({
    required this.id,
    required this.checkIn,
    required this.checkOut,
    required this.userID,
    required this.day,
    required this.totalCheckInDay,
  });

  Map<String, dynamic> toJson() {
    return {
      "checkIn": checkIn,
      "checkOut": checkOut,
      "day": day,
    };
  }

  factory AttendanceDay.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      String uid,
      int totalDay) {
    final data = snapshot.data()!;
    return AttendanceDay(
      id: snapshot.id,
      checkIn: data["checkIn"],
      checkOut: data["checkOut"],
      userID: uid,
      day: data["day"],
      totalCheckInDay: totalDay,
    );
  }
}
