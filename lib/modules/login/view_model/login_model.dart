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

enum LoginType {
  normal,
  google,
}
