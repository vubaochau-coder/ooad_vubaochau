import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';

abstract class AbstractSalaryView {
  void updateListView(List<ManagerSalaryModel> salary);
  void showSuccessToast(String toast);
}
