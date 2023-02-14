import 'package:ooad_vubaochau/FormRequirement/abstract_requirement_view.dart';
import 'package:ooad_vubaochau/FormRequirement/requirement_list_model.dart';

class FormManagerScreenPresenter {
  final RequirementScreenModel formScreenModel = RequirementScreenModel();
  AbstractRequirementView formView;

  FormManagerScreenPresenter(this.formView) {
    formScreenModel.formChanges.listen((event) {
      formScreenModel.getData().then((value) => formView.updateListView(value));
    });
  }

  Future<void> createRequirementForm(String title, String des) async {
    formScreenModel.createRequirement(title, des).whenComplete(
        () => formView.showSuccessToast("Requirement has been Created!"));
  }
}
