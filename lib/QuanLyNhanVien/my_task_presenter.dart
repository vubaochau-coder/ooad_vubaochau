import 'package:ooad_vubaochau/QuanLyNhanVien/abstract_my_task_view.dart';
import 'package:ooad_vubaochau/QuanLyNhanVien/my_task_model.dart';

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
