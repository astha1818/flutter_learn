import '../../../res/strings.dart';

class Validation {
  static String? nameValidation(String? text) {
    String name = text ?? '';
    if (name.trim().isEmpty) return AppStrings.emptyName;
    return null;
  }

  static String? emailValidation(String? text) {
    String email = text ?? '';
    if (email.trim().isEmpty) {
      return AppStrings.emptyEmail;
    }
    return null;
  }

  static String? passwordValidation(String? text) {
    String password = text ?? '';
    if (password.trim().isEmpty) {
      return AppStrings.emptyPassword;
    } else if (password.trim().length < 8) {
      return AppStrings.passwordCount;
    }
    return null;
  }

  static String? phoneNumberValidation(String? text) {
    String phoneNumber = text ?? '';
    if (phoneNumber.trim().isEmpty) {
      return AppStrings.emptyPhoneNumber;
    } else if (phoneNumber.trim().length < 8) {
      return AppStrings.phoneNumberCount;
    }
    return null;
  }
}
