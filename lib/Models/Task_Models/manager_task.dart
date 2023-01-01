import 'package:ooad_vubaochau/Models/Task_Models/label.dart';

class ManagerTaskModel {
  final String title;
  final List<MyLabelModel> label;
  final String subTitle;
  final String date;
  final List<String> members;

  ManagerTaskModel(
      this.title, this.label, this.subTitle, this.date, this.members);
}
