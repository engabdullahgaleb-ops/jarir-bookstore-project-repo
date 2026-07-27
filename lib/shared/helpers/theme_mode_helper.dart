import 'dart:ui';

import 'package:jarir_bookstore_project/core/values/strings.dart';
import 'package:jarir_bookstore_project/shared/helpers/shared_preferences_helper.dart';


class ThemeModeHelper{

  static final Brightness defaultThemeMode = Brightness.light;

  static Brightness getCurrentThemeMode(){
    String mode = SharedPreferencesHelper.instance.getString(themeModeKey)??defaultThemeMode.name;
    return Brightness.values.byName(mode);
  }
  static Future<bool> saveCurrentThemeMode(Brightness arg){
    return SharedPreferencesHelper.instance.setString(themeModeKey, arg.name);
  }
}
