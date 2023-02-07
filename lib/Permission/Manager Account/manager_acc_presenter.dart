import 'package:ooad_vubaochau/Permission/Manager%20Account/abstract_manager_acc_view.dart';
import 'package:ooad_vubaochau/Permission/Manager%20Account/manager_acc_model.dart';

class MngAccPresenter {
  final AbstractMngAccView view;
  final MngAccModel model = MngAccModel();

  MngAccPresenter(this.view) {
    model.accChanges.listen((event) {
      model.getListMngAcc().then((value) => view.showListMngAcc(value));
    });
  }

  void disableAccount(String id) {
    model
        .onDisableAccount(id)
        .whenComplete(() => view.showSuccessToast("Account has been Disable!"))
        .onError((error, stackTrace) =>
            view.showFailedToast("Disable Failed!\nError:$error"))
        .timeout(
      const Duration(seconds: 10),
      onTimeout: () {
        view.showFailedToast("Session Timeout");
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
      const Duration(seconds: 10),
      onTimeout: () {
        view.showFailedToast("Session Timeout");
      },
    );
  }
}
