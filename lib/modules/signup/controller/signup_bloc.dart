import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/modules/signup/view_model/signup_model.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignupBloc extends Bloc<SignupModel> {
  @override
  SignupModel initDefaultValue() {
    return SignupModel(appState: AppState.initial);
  }

  Future<void> googleLogin() async {
    state.appState == AppState.loading;
    emit(state);

    try {
      final GoogleSignInAccount? googleSignInAccount =
          await GoogleSignIn().signIn();
      if (googleSignInAccount == null) {
        state.appState = AppState.failure;
        state.responseModel = ResponseModel(
          statusCode: '500',
          statusMessage: 'Failed',
        );
      } else {
        state.appState = AppState.success;
        state.responseModel = ResponseModel(
          statusCode: '200',
          statusMessage: 'Success',
          data: {
            'profile_pic': googleSignInAccount.photoUrl,
            'email': googleSignInAccount.email,
            'full_name': googleSignInAccount.displayName,
          },
        );
      }
    } catch (e) {
      state.appState = AppState.failure;
      state.responseModel = ResponseModel(
        statusCode: '500',
        statusMessage: e.toString(),
      );
    }
    state.appState == AppState.success;
    emit(state);
  }
}
