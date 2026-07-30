import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppFilledButtonTheme {
  static FilledButtonThemeData light = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      minimumSize: const Size(double.infinity, 56),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
  );
}
