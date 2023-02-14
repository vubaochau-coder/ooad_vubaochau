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
    model.onDisableAccount(id);
  }

  void enableAccount(String id) {
    model.onEnableAccount(id);
  }
}
