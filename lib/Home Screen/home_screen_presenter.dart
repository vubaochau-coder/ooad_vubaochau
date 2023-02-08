import 'package:ooad_vubaochau/Home%20Screen/abstract_home_view.dart';
import 'package:ooad_vubaochau/Home%20Screen/home_screen_model.dart';

class HomePresenter {
  final HomeModel model = HomeModel();
  HomeView view;

  HomePresenter(this.view) {
    model.userChange.listen((event) {
      model.futureUser().then((value) => view.updateData(
          value.name, value.position, value.image, value.email, value.level));
    });
  }
}
