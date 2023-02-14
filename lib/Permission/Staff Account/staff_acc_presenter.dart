import 'package:ooad_vubaochau/Permission/Staff%20Account/abstract_staff_acc_view.dart';
import 'package:ooad_vubaochau/Permission/Staff%20Account/staff_acc_model.dart';

class StaffAccPresenter {
  final StaffAccModel model = StaffAccModel();
  final AbstractStaffAccView view;

  StaffAccPresenter(this.view) {
    model.accChanges.listen((event) {
      model.getListStaffAcc().then((value) => view.showListAcc(value));
    });
  }

  void disableAccount(String id) {
    model.onDisableAccount(id);
  }

  void enableAccount(String id) {
    model.onEnableAccount(id);
  }
}
