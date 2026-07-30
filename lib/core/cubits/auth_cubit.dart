import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jarir_bookstore_project/core/models/user_model.dart';
import 'package:jarir_bookstore_project/core/services/auth_service.dart';
import 'package:jarir_bookstore_project/l10n/app_localizations.dart';

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
  UserModel? userModel;

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

  bool isAuthenticated(){
    return FirebaseAuth.instance.currentUser!=null;
  }

  User? getCurrentUser(){
    return FirebaseAuth.instance.currentUser;
  }
  Future<void> register(UserModel user,{required BuildContext context}) async {
    emit(const AuthLoading());

    try {
      final credential = await _authService.register(user
      );

      if (credential.user != null) {
        emit(AuthAuthenticated(credential.user!));
      } else {
        emit(AuthError('Registration failed.'));
      }
    } catch (e) {
      AppLocalizations l10n = AppLocalizations.of(context)!;
      switch (e.toString()) {
        case 'email-already-in-use':
          emit(AuthError(l10n.errorEmailAlreadyInUse));
          break;
        case 'invalid-email':
          emit(AuthError(l10n.errorInvalidEmail));
          break;
        case 'weak-password':
          emit(AuthError(l10n.errorWeakPassword));
          break;
        case 'network-request-failed':
          emit(AuthError(l10n.errorNoInternet));
          break;
        case 'unknown':
          emit(AuthError(l10n.errorSomethingWentWrong));
          break;
        default:
          emit(AuthError(l10n.errorRegistrationFailed));
      }
    }
  }

  Future<void> signIn({
    required String email,
    required String password,
    required context
  }) async {
    emit(const AuthLoading());

    try {
      final credential = await _authService.signIn(
        email: email,
        password: password,
      );

      emit(AuthAuthenticated(credential.user!));
    } catch (e) {
      AppLocalizations l10n = AppLocalizations.of(context)!;
      switch (e.toString()) {
        case 'invalid-credential':
          emit(AuthError(l10n.errorInvalidCredential));
          break;
        case 'user-disabled':
          emit(AuthError(l10n.errorUserDisabled));
          break;
        case 'too-many-requests':
          emit(AuthError(l10n.errorTooManyRequests));
          break;
        case 'network-request-failed':
          emit(AuthError(l10n.errorNoInternet));
          break;
        case 'unknown':
          emit(AuthError(l10n.errorSomethingWentWrong));
          break;
        default:
          emit(AuthError(l10n.errorLoginFailed));
      }
    }
  }

  Future<void> getCurrentUserData() async {
    userModel = await _authService.getCurrentUserData();
    if (userModel!=null)emit(AuthAuthenticated(FirebaseAuth.instance.currentUser!));
  }
}