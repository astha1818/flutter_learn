class SignupModel {
  AppState appState;
  ResponseModel? responseModel;
  SignupModel({
    required this.appState,
    this.responseModel,
  });
}

class ResponseModel<T> {
  String statusCode;
  String statusMessage;
  T? data;
  ResponseModel({
    required this.statusCode,
    required this.statusMessage,
    this.data,
  });
}

enum AppState {
  initial,
  loading,
  success,
  failure,
  noInternet,
}
