import '../../../utlis/helpers/app_state.dart';
import '../../../utlis/helpers/response_modal.dart';

class SignupModel {
  AppState appState;
  ResponseModel? responseModel;
  SignupModel({
    required this.appState,
    this.responseModel,
  });
}
