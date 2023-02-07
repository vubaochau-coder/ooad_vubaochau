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
    model
        .onDisableAccount(id)
        .whenComplete(() => view.showSuccessToast("Account has been Disable!"))
        .onError((error, stackTrace) =>
            view.showFailedToast("Disable Failed!\nError:$error"))
        .timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        view.showFailedToast("Time out");
      },
    );
  }

  void enableAccount(String id) {
    model
        .onEnableAccount(id)
        .whenComplete(() => view.showSuccessToast("Account has been Enable!"))
        .onError((error, stackTrace) =>
            view.showFailedToast("Enable Failed!\nError:$error"))
        .timeout(
      const Duration(seconds: 3),
      onTimeout: () {
        view.showFailedToast("Time out");
      },
    );
  }
}
