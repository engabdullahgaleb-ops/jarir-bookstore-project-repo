import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:jarir_bookstore_project/core/services/auth_service.dart';

// states
sealed class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthAuthenticated extends AuthState {
  final User user;

  const AuthAuthenticated(this.user);
}

class AuthUnauthenticated extends AuthState {
  const AuthUnauthenticated();
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);
}

//cubit
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService) : super(const AuthInitial());

  final AuthService _authService;

  Future<void> signInWithGoogle() async {
    emit(const AuthLoading());

    try {
      final credential = await _authService.signInWithGoogle();

      print(credential == null);
      if (credential != null && credential.user != null) {
        emit(AuthAuthenticated(credential.user!));
      } else {
        emit(AuthError('Google sign in was cancelled.'));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(AuthError(e.toString()));
    }
  }

  Future<void> signOut() async {
    emit(const AuthLoading());

    try {
      await _authService.signOut();
      emit(const AuthUnauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }

  void checkAuthStatus() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      emit(AuthAuthenticated(user));
    } else {
      emit(const AuthUnauthenticated());
    }
  }
}
