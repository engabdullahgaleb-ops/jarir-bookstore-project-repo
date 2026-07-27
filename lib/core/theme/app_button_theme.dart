import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppButtonTheme {

  static ElevatedButtonThemeData light =
  ElevatedButtonThemeData(

    style: ElevatedButton.styleFrom(

      backgroundColor: AppColors.primary,

      foregroundColor: Colors.white,

      elevation: 0,

      minimumSize: const Size(double.infinity, 52),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
  );
}