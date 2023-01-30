import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';

abstract class AbstractTaskView {
  void updateListView(List<ManagerTaskModel> tasks);
  void showSuccessToast(String toast);
  void deleteSuccessful(String toast);
}
