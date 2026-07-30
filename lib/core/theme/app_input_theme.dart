import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppInputTheme {
  static InputDecorationTheme light = InputDecorationTheme(
    filled: true,
    fillColor: AppColors.grey100,

    contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey300),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: AppColors.grey500),
    ),
  );
}
