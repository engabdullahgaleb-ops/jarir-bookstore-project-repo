import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jarir_bookstore_project/core/models/form_validation_model.dart';
import 'package:jarir_bookstore_project/shared/helpers/validators.dart';


class RegisterUiState {
  final bool obscurePassword;
  final bool obscureConfirmPassword;
  final bool faceIDEnabled;
  final bool marketingAccepted;
  final FormValidationModel formValid;
  final String passwordValue;

   RegisterUiState({
    this.passwordValue = "",
    this.obscureConfirmPassword=true,
    this.obscurePassword = true,
    this.faceIDEnabled = false,
    this.marketingAccepted = false,
    this.formValid =  const FormValidationModel(),
  });

  RegisterUiState copyWith({
    String? passwordValue,
    bool ? obscureConfirmPassword,
    bool? obscurePassword,
    bool? faceIDEnabled,
    bool? marketingAccepted,
    FormValidationModel? form,
  }) {
    return RegisterUiState(
      passwordValue: passwordValue ?? this.passwordValue,
      formValid: form ?? this.formValid,
      obscureConfirmPassword: obscureConfirmPassword ?? this.obscureConfirmPassword,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      faceIDEnabled: faceIDEnabled ?? this.faceIDEnabled,
      marketingAccepted: marketingAccepted ?? this.marketingAccepted,
    );
  }
}

class RegisterUICubit extends Cubit<RegisterUiState> {
  RegisterUICubit() : super( RegisterUiState());



  void togglePassword() {
    emit(state.copyWith(obscurePassword: !state.obscurePassword));
  }

  void toggleFaceID() {
    emit(state.copyWith(faceIDEnabled: !state.faceIDEnabled));
  }
  void toggleTerms() {
    emit(state.copyWith(form: state.formValid.copyWith(termsAccepted: !state.formValid.termsAccepted)));
  }
  void toggleMarketing() {
    emit(state.copyWith(marketingAccepted: !state.marketingAccepted));
  }
  void toggleConfirmPassword() {
    emit(state.copyWith(obscureConfirmPassword: !state.obscureConfirmPassword));
  }

  void passwordChanged(String value) {
    emit(
      state.copyWith(
          passwordValue: value,
          form:state.formValid.copyWith(
              passwordValid:Validator.validatePassword(value)
          )
      ),
    );
  }
  void confirmPasswordChanged(String value) {
    emit(
      state.copyWith(
          form:state.formValid.copyWith(
              confirmPasswordValid: value == state.passwordValue,
          )
      ),
    );
  }

  void fNameChanged(String value) {
    emit(
      state.copyWith(
          form:state.formValid.copyWith(
              fNameValid: value.trim().isNotEmpty||value.trim().length<=50,
          )
      ),
    );
  }
  void lNameChanged(String value) {
    emit(
      state.copyWith(
          form:state.formValid.copyWith(
            lNameValid: value.trim().isNotEmpty||value.trim().length<=50,
          )
      ),
    );
  }
  void phoneChanged(String value) {
    emit(
      state.copyWith(
          form:state.formValid.copyWith(
            phoneValid: Validator.validatePhone(value),
          )
      ),
    );
  }
  void emailChanged(String value) {
    emit(
      state.copyWith(
          form:state.formValid.copyWith(
            emailValid: Validator.validateEmail(value),
          )
      ),
    );
  }
}
