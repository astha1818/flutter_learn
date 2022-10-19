import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../modules/login/view_model/login_model.dart';
import '../../../utlis/helpers/route.dart';
import '../../../utlis/custom_widgets/password_textfield/view/password_textfield.dart';
import '../../../utlis/custom_widgets/cutom_textformfield.dart';
import '../../../utlis/helpers/validations.dart';
import '../../../utlis/custom_widgets/custom_icon.dart';
import '../../../utlis/custom_widgets/custom_text.dart';
import '../../../res/strings.dart';
import '../../../res/colors.dart';
import '../../../res/dimen.dart';
import '../bloc/signup_bloc.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final SignupBloc _signupBloc = SignupBloc();

  _returnErrorText() {
    bool isValidated = _formKey.currentState?.validate() ?? false;
    if (isValidated) {
      _navigateToMyProfile();
    }
  }

  _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.loginScreen,
    );
  }

  _navigateToMyProfile() {
    Navigator.of(context).pushReplacementNamed(
      AppRoutes.myProfileScreen,
      arguments: _signupBloc.state.responseModel?.data,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;

    if (args['loginType'] == LoginType.google) {
      _nameController.text = args['loginData']['full_name'];
      _emailController.text = args['loginData']['email'];
    }
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
                  _nameTextForm(),
                  _sizedBox(height: AppDimen.size18),
                  _emailTextForm(),
                  _sizedBox(height: AppDimen.size18),
                  PasswordTextField(passwordController: _passwordController),
                  _sizedBox(height: AppDimen.size18),
                  _phoneNoTextform(),
                  _sizedBox(height: AppDimen.size40),
                  _submitButton(),
                  _sizedBox(height: AppDimen.size40),
                  // _buildSocialMediaSignup(),
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
      title: AppStrings.signup,
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
      title: AppStrings.creatAccount,
      fontSize: AppDimen.size20,
    );
  }

  _nameTextForm() {
    return CustomTextFormField(
      textCapitalization: TextCapitalization.words,
      maxLength: 30,
      controller: _nameController,
      fontSize: AppDimen.size18,
      hintText: AppStrings.enterName,
      prefixIcon: const CustomIcon(icon: Icons.person),
      counterText: '',
      // errorText: _errorText,
      textInputAction: TextInputAction.next,
      validator: (value) {
        return Validation.nameValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(30),
        FilteringTextInputFormatter.allow(
          RegExp(r'[A-Za-z ]'),
        )
      ],
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

  _phoneNoTextform() {
    return CustomTextFormField(
      maxLength: 10,
      controller: _phoneController,
      fontSize: AppDimen.size18,
      hintText: AppStrings.enterPhoneNumber,
      prefixIcon: const CustomIcon(icon: Icons.phone),
      counterText: '',
      keyboardType: TextInputType.phone,
      validator: (value) {
        return Validation.phoneNumberValidation(value);
      },
      inputFormatters: [
        LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(
          RegExp(r'[0-9]'),
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
            title: AppStrings.haveAnAccount,
            fontSize: AppDimen.size16,
          ),
          InkWell(
            onTap: () {
              _navigateToLogin();
            },
            child: const CustomText(
              title: AppStrings.login,
              fontSize: AppDimen.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

/*  _buildFaebookSignup() {
    return GestureDetector(
      child: const CustomIcon(
        icon: Icons.facebook,
        iconSize: AppDimen.size50,
      ),
      onTap: () {},
    );
  }

  _buildAppleSignup() {
    return GestureDetector(
      child: const CustomIcon(
        icon: Icons.apple,
        iconSize: AppDimen.size50,
      ),
      onTap: () {},
    );
  }
*/
}
