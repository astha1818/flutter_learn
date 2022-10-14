import 'package:flutter_learn/bloc/bloc.dart';
import 'package:flutter_learn/utlis/custom_widgets/password_textfield/view_model/password_model.dart';

class PasswordBloc extends Bloc<PasswordModel> {
  @override
  PasswordModel initDefaultValue() {
    return PasswordModel(false);
  }

  updateState() {
    state.passwordVisible = !state.passwordVisible;
    emit(state);
  }
}
