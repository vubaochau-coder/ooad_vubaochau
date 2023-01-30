import 'package:ooad_vubaochau/Models/Department_Models/department_info_model.dart';

abstract class DepartmentView {
  getListDepartmnet(List<DepartmentModel> list);
  onSuccess(String message);
  onFailed(String message);
}
