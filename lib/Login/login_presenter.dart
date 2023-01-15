import 'package:ooad_vubaochau/Login/abstract_login_view.dart';
import 'package:ooad_vubaochau/Login/login_model.dart';

class LoginPresenter {
  final LoginModel _loginModel = LoginModel();
  final LoginView _loginView;

  LoginPresenter(this._loginView);

  void login(String userName, String password) async {
    int result = await _loginModel.onLogin(userName, password);
    switch (result) {
      case 100:
        _loginView.onLoginSuccess();
        break;
      case 101:
        _loginView.onLoginError(101, 'Wrong password');
        break;
      case 102:
        _loginView.onLoginError(102, 'Invalid email');
        break;
      case 103:
        _loginView.onLoginError(103, 'User disable');
        break;
      case 104:
        _loginView.onLoginError(104, 'User not found');
        break;
      case 105:
        _loginView.onLoginError(105, 'Unknow error');
        break;
    }
  }
}
