import 'package:ooad_vubaochau/Home%20Screen/abstract_home_view.dart';
import 'package:ooad_vubaochau/Home%20Screen/home_screen_model.dart';

class HomePresenter {
  final HomeModel model = HomeModel();
  HomeView view;

  HomePresenter(this.view) {
    model.userChange.listen((event) {
      view.updateData(
          event.docChanges[0].doc["name"], event.docChanges[0].doc["position"]);
    });
  }
}
