import 'package:jarir_bookstore_project/core/models/form_validation_model.dart';
import 'package:jarir_bookstore_project/core/models/password_validation_model.dart';

class Validator {
  static PasswordValidationModel validatePassword(String password) {
    return PasswordValidationModel(
      hasMinLength: password.length >= 8,
      hasUppercase: RegExp(r'[A-Z]').hasMatch(password),
      hasLowercase: RegExp(r'[a-z]').hasMatch(password),
      hasNumber: RegExp(r'[0-9]').hasMatch(password),
      hasSpecialCharacter:
      RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(password),
    );
  }
  static bool validateEmail(String email) {
    return RegExp(
      r'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$',
    ).hasMatch(email);
  }
  static bool validatePhone(String phone) {
    return RegExp(
      r'^(?:\+966|966|0)?5[0-9]{8}$',
    ).hasMatch(phone);
  }
}
