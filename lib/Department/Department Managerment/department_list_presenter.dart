import 'package:ooad_vubaochau/Department/Department%20Managerment/abstract_depart_list_view.dart';
import 'package:ooad_vubaochau/Department/Department%20Managerment/department_list_model.dart';
import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

class DepartmentListPresenter {
  final DepartmentListModel model = DepartmentListModel();
  final DepartmentView view;

  DepartmentListPresenter(this.view) {
    model.streamDepartment.listen((event) {
      model.getListDepartment().then((value) => view.getListDepartmnet(value));
    });
  }

  Future<void> onCreate(DepartmentModel newDepartment) async {}

  Future<void> onDelete(String id) async {}

  Future<void> onUpdate(DepartmentModel department) async {}
}
