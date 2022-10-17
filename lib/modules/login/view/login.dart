import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/modules/login/bloc/login_bloc.dart';
import '../../../utlis/helpers/route.dart';
import '../../../bloc/bloc_builder.dart';
import '../../../utlis/custom_widgets/custom_snackbar.dart';
import '../../../utlis/custom_widgets/password_textfield/view/password_textfield.dart';
import '../../../utlis/custom_widgets/cutom_textformfield.dart';
import '../../../utlis/helpers/validations.dart';
import '../../../utlis/custom_widgets/custom_icon.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../../../res/strings.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../view_model/login_model.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final LoginBloc _loginBloc = LoginBloc();

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      _navigateToMyProfile();
    }
  }

  _navigateToSignup() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.signupScreen,
      arguments: {
        'loginType': _loginBloc.state.loginType,
        'loginData': _loginBloc.state.responseModel?.data,
      },
    );
  }

  _navigateToMyProfile() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.myProfileScreen,
      arguments: _loginBloc.state.responseModel?.data,
    );
  }

  _onPressGoogle() async {
    await _loginBloc.googleLogin();
    if (_loginBloc.state.appState == AppState.success) {
      if (_loginBloc.state.responseModel?.data['isNewUser']) {
        _navigateToSignup();
      } else {
        _navigateToMyProfile();
      }
      // _navigateToMyProfile();
    } else {
      CustomSnackbar.showSnackBar(
        context: context,
        message: _loginBloc.state.responseModel?.statusMessage ?? '',
        backgroundColor: AppColors.red,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
          AppDimen.size30,
          AppDimen.size80,
          AppDimen.size30,
          AppDimen.size25,
        ),
        child: Stack(
          children: [
            Form(
              key: _formKey,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Column(
                      children: [
                        _titleText(),
                        _sizedBox(height: AppDimen.size18),
                        _descriptionText(),
                      ],
                    ),
                  ),
                  _sizedBox(height: AppDimen.size40),
                  _sizedBox(height: AppDimen.size18),
                  _emailTextForm(),
                  _sizedBox(height: AppDimen.size18),
                  PasswordTextField(passwordController: _passwordController),
                  _sizedBox(height: AppDimen.size18),
                  _sizedBox(height: AppDimen.size40),
                  _submitButton(),
                  _sizedBox(height: AppDimen.size40),
                  _buildSocialMediaLogin(),
                ],
              ),
            ),
            _buildBottomView(),
          ],
        ),
      ),
    );
  }

  _titleText() {
    return const CustomText(
      title: AppStrings.login,
      fontSize: AppDimen.size40,
      fontWeight: FontWeight.bold,
    );
  }

  _sizedBox({double height = 0, double width = 0}) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  _descriptionText() {
    return const CustomText(
      title: AppStrings.welcomeAgain,
      fontSize: AppDimen.size20,
    );
  }

  _emailTextForm() {
    return CustomTextFormField(
      maxLength: 50,
      controller: _emailController,
      fontSize: AppDimen.size18,
      hintText: AppStrings.enterEmail,
      prefixIcon: const CustomIcon(icon: Icons.email),
      counterText: '',
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.emailValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z0-9@._]'),
        )
      ],
    );
  }

  _submitButton() {
    return ElevatedButton(
      onPressed: () {
        _returnErrorText();
      },
      style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.indigo,
          textStyle: const TextStyle(
            fontSize: AppDimen.size20,
            fontWeight: FontWeight.bold,
          )),
      child: const CustomText(
        title: AppStrings.submit,
        color: AppColors.white,
        fontSize: AppDimen.size18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  _buildBottomView() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomText(
            title: AppStrings.noAccount,
            fontSize: AppDimen.size16,
          ),
          InkWell(
            onTap: () {
              _navigateToSignup();
            },
            child: const CustomText(
              title: AppStrings.signup,
              fontSize: AppDimen.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  _buildSocialMediaLogin() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBuilder(),
      ],
    );
  }

  _buildGoogleLogin() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.red),
      ),
      onPressed: () {
        _onPressGoogle();
      },
      child: _loginBloc.state.appState == AppState.loading
          ? const CircularProgressIndicator()
          : const CustomText(
              title: 'Google',
              color: AppColors.white,
              fontWeight: FontWeight.w600,
            ),
    );
  }

  _buildBuilder() {
    return BlocBuilder(
      builder: () {
        return _buildGoogleLogin();
      },
      bloc: _loginBloc,
    );
  }
}
