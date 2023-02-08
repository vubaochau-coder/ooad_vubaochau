import 'package:ooad_vubaochau/Employee/abstract_emps_view.dart';
import 'package:ooad_vubaochau/Employee/emps_list_model.dart';

class EmpMngListPresenter {
  final EmpsMngListModel model = EmpsMngListModel();
  final EmpsMngScreenView view;

  EmpMngListPresenter(this.view) {
    model.listenDataChange.listen((event) {
      model.onGetListEmp().then((value) => view.getListEmps(value));
    });
  }
}
