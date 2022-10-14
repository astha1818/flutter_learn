import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../profile/view/my_profile.dart';
import '../signup/view/signup.dart';
import '../../utlis/custom_widgets/cutom_textformfield.dart';
import '../../utlis/helpers/validations.dart';
import '../../utlis/custom_widgets/custom_icon.dart';
import '../../utlis/custom_widgets/custom_text.dart';
import '../../res/strings.dart';
import '../../res/colors.dart';
import '../../res/dimen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passwordVisible = false;

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      _onSubmit();
    }
  }

  _onSubmit() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyProfile(),
      ),
    );
  }

  _navigateToSignup() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Padding(
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
                          _sizedBox(AppDimen.size18),
                          _descriptionText(),
                        ],
                      ),
                    ),
                    _sizedBox(AppDimen.size80),
                    _emailTextForm(),
                    _sizedBox(AppDimen.size18),
                    _passwordTextForm(),
                    _sizedBox(AppDimen.size40),
                    _submitButton(),
                  ],
                ),
              ),
              _buildBottomView(),
            ],
          ),
        ),
      ]),
    );
  }

  _titleText() {
    return const CustomText(
      title: AppStrings.login,
      fontSize: AppDimen.size40,
      fontWeight: FontWeight.bold,
    );
  }

  _sizedBox(double height) {
    return SizedBox(
      height: height,
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

  _passwordTextForm() {
    return CustomTextFormField(
      maxLength: 15,
      controller: _passwordController,
      fontSize: AppDimen.size18,
      hintText: AppStrings.enterPassword,
      prefixIcon: const CustomIcon(icon: Icons.lock),
      suffixIcon: _buildPasswordIcon(),
      counterText: '',
      obscureText: !passwordVisible,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.passwordValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(15),
      ],
    );
  }

  _buildPasswordIcon() {
    return IconButton(
      onPressed: () {
        setState(() {
          passwordVisible = !passwordVisible;
        });
      },
      icon: passwordVisible
          ? const CustomIcon(
              icon: Icons.visibility_off,
            )
          : const CustomIcon(
              icon: Icons.visibility,
            ),
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
}
