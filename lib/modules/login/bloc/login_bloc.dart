import 'package:firebase_auth/firebase_auth.dart';
import '../../../bloc/bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../view_model/login_model.dart';

class LoginBloc extends Bloc<LoginModel> {
  @override
  LoginModel initDefaultValue() {
    return LoginModel(appState: AppState.initial, loginType: LoginType.normal);
  }

  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> googleLogin() async {
    state.loginType = LoginType.google;
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
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        UserCredential result = await auth.signInWithCredential(credential);
        state.appState = AppState.success;
        state.responseModel = ResponseModel(
          statusCode: '200',
          statusMessage: 'Success',
          data: {
            'profile_pic': googleSignInAccount.photoUrl,
            'email': googleSignInAccount.email,
            'full_name': googleSignInAccount.displayName,
            'isNewUser': result.additionalUserInfo?.isNewUser,
          },
        );
        // await GoogleSignIn().signOut();
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
