import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/core/theme/app_filled_button_theme.dart';

import 'app_app_bar_theme.dart';
import 'app_bottom_nav_bar_theme.dart';
import 'app_button_theme.dart';
import 'app_card_theme.dart';
import 'app_colors.dart';
import 'app_input_theme.dart';
import 'app_text_theme.dart';

class LightTheme {


  static ThemeData theme = ThemeData(

    useMaterial3: true,

    fontFamily: 'SFArabic',

    scaffoldBackgroundColor:
    AppColors.lightBackground,

    colorScheme: ColorScheme.fromSeed(

      seedColor: AppColors.primary,

      brightness: Brightness.light,
    ),

    textTheme: AppTextTheme.light,

    appBarTheme: AppAppBarTheme.light,

    filledButtonTheme:AppFilledButtonTheme.light,

    elevatedButtonTheme:
    AppButtonTheme.light,

    cardTheme: AppCardTheme.light,

    inputDecorationTheme:
    AppInputTheme.light,

    navigationBarTheme:
    AppBottomNavTheme.light,
  );
}