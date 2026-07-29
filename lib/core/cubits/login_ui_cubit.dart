
import 'package:flutter_bloc/flutter_bloc.dart';


enum LoginMethod {
  password,
  otp,
}

class LoginUIState {
  final LoginMethod method;
  final bool obscurePassword;
  final bool faceIDEnabled;

  const LoginUIState({
    this.method = LoginMethod.password,
    this.obscurePassword = true,
    this.faceIDEnabled = false,
  });

  LoginUIState copyWith({
    LoginMethod? method,
    bool? obscurePassword,
    bool? faceIDEnabled,
  }) {
    return LoginUIState(
      method: method ?? this.method,
      obscurePassword: obscurePassword ?? this.obscurePassword,
      faceIDEnabled: faceIDEnabled?? this.faceIDEnabled,
    );
  }
}
class LoginUICubit extends Cubit<LoginUIState> {
  LoginUICubit() : super(const LoginUIState());

  void changeMethod(LoginMethod method) {
    emit(state.copyWith(method: method));
  }

  void togglePassword() {
    emit(
      state.copyWith(
        obscurePassword: !state.obscurePassword,
      ),
    );
  }
  void toggleFaceID() {
    emit(state.copyWith(
      faceIDEnabled: !state.faceIDEnabled,
    ));
  }
}