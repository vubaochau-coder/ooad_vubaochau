import 'dart:async';
import 'package:ooad_vubaochau/Attendance/abstract_attendance_view.dart';
import 'package:ooad_vubaochau/Attendance/attendance_model.dart';
import 'package:ooad_vubaochau/Attendance/attendance_view.dart';

class AttendancePresenter {
  final AttendanceModel _attendanceModel = AttendanceModel();
  final AttendanceView _attendanceView;

  AttendancePresenter(this._attendanceView);

  Future<void> getRecord(String checkIn, String checkOut) async {
    //_attendanceModel.getRecord(checkIn, checkOut);
    try {
      _attendanceModel.getRecord(checkIn, checkOut);
    } catch (e) {
      _attendanceModel.getRecordError(checkIn, checkOut);
    }
  }

  void checkAttendance(String checkIn, String checkOut) async {
    //_attendanceView.getAttendance(checkIn, checkOut);
    _attendanceModel.checkExistsRecord().then((value) {
      value = true;
      try {
        _attendanceModel.getAttendance(checkIn, checkOut);
      } catch (e) {
        _attendanceModel.getAttendanceError(checkIn, checkOut);
      }
    });
    _attendanceView.showRecord(checkIn, checkOut);
  }
}
