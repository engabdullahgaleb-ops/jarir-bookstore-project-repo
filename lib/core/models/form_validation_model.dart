import 'package:jarir_bookstore_project/core/models/password_validation_model.dart';

class FormValidationModel {
  final bool fNameValid;
  final bool lNameValid;
  final bool phoneValid;
  final bool emailValid;
  final PasswordValidationModel passwordValid;
  final bool confirmPasswordValid;
  final bool termsAccepted;

  const FormValidationModel({
    this.fNameValid = false,
    this.lNameValid = false,
    this.phoneValid = false,
    this.emailValid = false,
    this.confirmPasswordValid = false,
    this.passwordValid = const PasswordValidationModel(),
    this.termsAccepted = false,
  });

  FormValidationModel copyWith({
    bool? fNameValid,
    bool? lNameValid,
    bool? phoneValid,
    bool? emailValid,
    PasswordValidationModel? passwordValid,
    bool? confirmPasswordValid,
    bool? termsAccepted,
}){
    return FormValidationModel(
      fNameValid: fNameValid ?? this.fNameValid,
      lNameValid: lNameValid ?? this.lNameValid,
      phoneValid: phoneValid ?? this.phoneValid,
      emailValid: emailValid ?? this.emailValid,
      confirmPasswordValid: confirmPasswordValid ?? this.confirmPasswordValid,
      passwordValid: passwordValid ?? this.passwordValid,
      termsAccepted: termsAccepted ?? this.termsAccepted,
    );

  }
}