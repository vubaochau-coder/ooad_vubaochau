import 'package:ooad_vubaochau/Models/Salary_Models/label.dart';

class ManagerSalaryModel {
  final String name;
  final List<SalaryLabelModel> label;
  final String subTitle;
  final String date;

  ManagerSalaryModel(this.name, this.label, this.subTitle, this.date);
}
