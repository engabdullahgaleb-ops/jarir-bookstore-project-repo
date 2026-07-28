import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/theme/app_bottom_nav_bar_theme.dart';

import 'app_button_theme.dart';
import 'app_colors.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

class DarkTheme {

  static ThemeData theme = ThemeData(

    useMaterial3: true,

    fontFamily: 'SFArabic',

    brightness: Brightness.dark,

    scaffoldBackgroundColor:
    AppColors.darkBackground,

    colorScheme: ColorScheme.fromSeed(

      seedColor: AppColors.primary,

      brightness: Brightness.dark,
    ),

    cardColor: AppColors.darkSurface,

    textTheme:
    AppTextTheme.light.apply(

      bodyColor: Colors.white,

      displayColor: Colors.white,
    ),

    elevatedButtonTheme:
    AppButtonTheme.light,

    inputDecorationTheme:
    AppInputTheme.light.copyWith(

      fillColor: AppColors.darkSurface,
    ),
    navigationBarTheme: AppBottomNavTheme.dark
  );
}