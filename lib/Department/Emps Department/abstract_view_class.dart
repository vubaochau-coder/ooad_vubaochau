import 'package:ooad_vubaochau/Models/Department_Models/emps_depart_model.dart';

abstract class EmpsDepartmentView {
  void showListEmp(List<EmpsDepartInfo> list);
  void showSuccess(String message);
}
