import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';

abstract class AbstractRequirementView {
  void updateListView(List<ManagerRequiredModel> queries);
  void showSuccessToast(String toast);
}
