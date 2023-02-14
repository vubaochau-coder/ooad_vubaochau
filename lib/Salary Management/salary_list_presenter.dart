import 'package:ooad_vubaochau/Models/Salary_Models/manager_salary.dart';
import 'package:ooad_vubaochau/Salary%20Management/abstract_salary_view.dart';
import 'package:ooad_vubaochau/Salary%20Management/salary_list_model.dart';

class SalaryManagementScreenPresenter {
  final SalaryScreenModel salaryScreenModel = SalaryScreenModel();
  AbstractSalaryView salaryView;

  SalaryManagementScreenPresenter(this.salaryView) {
    salaryScreenModel.salaryChanges.listen((event) {
      salaryScreenModel
          .getData()
          .then((value) => salaryView.updateListView(value));
    });
  }

  Future<void> addNewTask(ManagerSalaryModel salary) async {
    await salaryScreenModel.addSalary(salary);
  }
}
