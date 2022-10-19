import '../../../utlis/helpers/app_state.dart';
import '../../../utlis/helpers/response_modal.dart';

class ApiModel {
  AppState appState;
  ResponseModel? responseModel;

  ApiModel({
    required this.appState,
    this.responseModel,
  });
}
