import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../bloc/bloc_builder.dart';
import '../../../../utlis/custom_widgets/password_textfield/bloc/password_bloc.dart';

import '../../../../res/dimen.dart';
import '../../../../res/strings.dart';
import '../../../helpers/validations.dart';
import '../../custom_icon.dart';
import '../../cutom_textformfield.dart';

class PasswordTextField extends StatelessWidget {
  PasswordTextField({super.key, required this.passwordController});
  final TextEditingController passwordController;
  final PasswordBloc _passwordBloc = PasswordBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      builder: () => _passwordTextForm(),
      bloc: _passwordBloc,
    );
  }

  _passwordTextForm() {
    return CustomTextFormField(
      maxLength: 15,
      controller: passwordController,
      fontSize: AppDimen.size18,
      hintText: AppStrings.enterPassword,
      prefixIcon: const CustomIcon(icon: Icons.lock),
      suffixIcon: IconButton(
        onPressed: () {
          _passwordBloc.updateState();
        },
        icon: _passwordBloc.state.passwordVisible
            ? const CustomIcon(
                icon: Icons.visibility_off,
              )
            : const CustomIcon(
                icon: Icons.visibility,
              ),
      ),
      counterText: '',
      obscureText: _passwordBloc.state.passwordVisible,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.passwordValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
    );
  }
}
