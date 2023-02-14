import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Models/Task_Models/test_emp_model.dart';

abstract class AbstractTaskView {
  void updateListView(List<ManagerTaskModel> tasks);
  void getAllEmpsInDepart(List<MemberInTask> emps);
}
