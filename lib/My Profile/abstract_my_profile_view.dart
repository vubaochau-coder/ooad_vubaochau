import 'package:ooad_vubaochau/Models/Employee_Models/profile_detail.dart';

abstract class AbstractProfileView {
  void getProfile(ProfileDetail data);
  void showToastSuccess(String message);
}
