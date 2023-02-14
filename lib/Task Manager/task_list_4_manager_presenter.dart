import 'package:ooad_vubaochau/Models/Task_Models/manager_task.dart';
import 'package:ooad_vubaochau/Task%20Manager/abstract_task_view.dart';
import 'package:ooad_vubaochau/Task%20Manager/task_list_4_manager_model.dart';

class TaskManagerScreenPresenter {
  final TaskScreenModel taskScreenModel = TaskScreenModel();
  AbstractTaskView taskView;

  TaskManagerScreenPresenter(this.taskView) {
    taskScreenModel.taskChanges.listen((event) {
      taskScreenModel.getData().then((value) => taskView.updateListView(value));
      taskScreenModel
          .getAllMemberInDepartment()
          .then((value) => taskView.getAllEmpsInDepart(value));
    });
  }

  Future<void> addNewTask(ManagerTaskModel task) async {
    await taskScreenModel.addTask(task);
  }

  Future<void> removeTask(String id) async {
    await taskScreenModel.deleteTask(id);
  }

  Future<void> updateTask(ManagerTaskModel task) async {
    await taskScreenModel.updateTask(task);
  }

  Future<void> completeTask(ManagerTaskModel task) async {
    await taskScreenModel.completeTask(task);
  }
}
