import 'package:ooad_vubaochau/My%20Task/abstract_my_task_view.dart';
import 'package:ooad_vubaochau/My%20Task/my_task_model.dart';

class MyTaskScreenPresenter {
  final MyTaskScreenModel model = MyTaskScreenModel();
  final AbstractMyTaskListView view;

  MyTaskScreenPresenter(this.view) {
    model.listtenDataChanges.listen((event) {
      model.getMyTaskList().then((value) {
        view.getListTask(value);
      });
    });
  }
}
