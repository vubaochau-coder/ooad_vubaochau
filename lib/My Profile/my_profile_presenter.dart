import 'package:ooad_vubaochau/My%20Profile/abstract_my_profile_view.dart';
import 'package:ooad_vubaochau/My%20Profile/my_profile_model.dart';

class MyProfilePresenter {
  final MyProfileModel model = MyProfileModel();
  final AbstractProfileView view;

  MyProfilePresenter(this.view) {
    model.userProfileChange.listen((event) {
      model.getMyProfile().then((value) => view.getProfile(value));
    });
  }

  Future<void> editProfile(
      String id, String name, String phone, String address) async {
    model.onEditMyProfile(id, name, phone, address).whenComplete(
        () => view.showToastSuccess('Your Profile has been Edited!'));
  }
}
