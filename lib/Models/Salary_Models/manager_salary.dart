import 'package:ooad_vubaochau/Models/Salary_Models/label.dart';

class ManagerSalaryModel {
  final String Name;
  final List<SalaryLabelModel> Label;
  final String subTitle;
  final String date;

  ManagerSalaryModel(this.Name, this.Label, this.subTitle, this.date);
}
