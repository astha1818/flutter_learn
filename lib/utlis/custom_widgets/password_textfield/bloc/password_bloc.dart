import '../../../../bloc/bloc.dart';
import '../../../../utlis/custom_widgets/password_textfield/view_model/password_model.dart';

class PasswordBloc extends Bloc<PasswordModel> {
  @override
  PasswordModel initDefaultValue() {
    return PasswordModel(true);
  }

  updateState() {
    state.passwordVisible = !state.passwordVisible;
    emit(state);
  }
}
