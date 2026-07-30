import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:jarir_bookstore_project/shared/helpers/theme_mode_helper.dart';

class ThemeCubit extends Cubit<Brightness> {
  ThemeCubit(super.def);

  void toggle() {
    Brightness newThemeMode = Brightness.dark == state
        ? Brightness.light
        : Brightness.dark;
    ThemeModeHelper.saveCurrentThemeMode(newThemeMode)
        .then((value) {
          emit(newThemeMode);
        })
        .catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }

  void changeMode(Brightness mode) {
    ThemeModeHelper.saveCurrentThemeMode(mode)
        .then((value) {
          emit(mode);
        })
        .catchError((error) {
          if (kDebugMode) {
            print(error.toString());
          }
        });
  }
}
