import '../../../utlis/helpers/app_state.dart';
import '../../../utlis/helpers/response_modal.dart';

class LoginModel {
  AppState appState;
  ResponseModel? responseModel;
  LoginType? loginType;

  LoginModel({
    required this.appState,
    this.responseModel,
    this.loginType,
  });
}

enum LoginType {
  normal,
  google,
}
