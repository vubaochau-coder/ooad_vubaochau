import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ooad_vubaochau/Attendance/abstract_attendance_view.dart';
import 'package:ooad_vubaochau/Attendance/attendance_model.dart';

class AttendancePresenter {
  final AttendanceModel _attendanceModel = AttendanceModel();
  final AttendanceView _attendanceView;

  AttendancePresenter(this._attendanceView) {
    _attendanceModel.userID().then((value) {
      FirebaseFirestore.instance
          .collection("Users")
          .doc(value)
          .collection("Record")
          .where("day", isEqualTo: _attendanceModel.toDay)
          .snapshots()
          .listen((event) {
        _attendanceModel
            .getAttendanceData()
            .then((value1) => _attendanceView.showRecord(value1));
      });
    });
  }

  void checkIn(String recordID, String uid) {
    _attendanceModel.onCheckIn(recordID, uid);
  }

  void checkOut(String recordID, String uid) {
    _attendanceModel.onCheckOut(recordID, uid);
  }
}
