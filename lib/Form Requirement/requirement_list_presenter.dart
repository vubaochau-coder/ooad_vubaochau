import 'package:ooad_vubaochau/Models/Requirement_Models/manager_requirement.dart';
import 'package:ooad_vubaochau/Form%20Requirement/abstract_requirement_view.dart';
import 'package:ooad_vubaochau/Form%20Requirement/requirement_list_model.dart';

class FormManagerScreenPresenter {
  final RequirementScreenModel formScreenModel = RequirementScreenModel();
  AbstractRequirementView formView;

  FormManagerScreenPresenter(this.formView) {
    formScreenModel.formChanges.listen((event) {
      formScreenModel.getData().then((value) => formView.updateListView(value));
    });
  }

  Future<void> addNewForm(ManagerRequiredModel queries) async {
    await formScreenModel
        .addForm(queries)
        .whenComplete(() => formView.showSuccessToast("Add success."));
  }
}
