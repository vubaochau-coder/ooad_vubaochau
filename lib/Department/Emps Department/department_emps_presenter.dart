import 'package:ooad_vubaochau/Department/Emps%20Department/abstract_view_class.dart';
import 'package:ooad_vubaochau/Department/Emps%20Department/department_emps_model.dart';

class EmpsDepartPresenter {
  final EmpsDepartmentView view;
  final EmpsDepartModel model = EmpsDepartModel();

  EmpsDepartPresenter(this.view) {
    model.getListEmpsDepart().then((value) => view.showListEmp(value));
  }
}
