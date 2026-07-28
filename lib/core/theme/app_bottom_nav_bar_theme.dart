import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBottomNavTheme {
  static final light = NavigationBarThemeData(
    height: 72,
    elevation: 12,
    backgroundColor: Colors.white,
    shadowColor: Colors.black12,
    indicatorColor: Colors.transparent,

    iconTheme: WidgetStateProperty.resolveWith((states) {
      return IconThemeData(
        size: 24,
        color: states.contains(WidgetState.selected)
            ? AppColors.primary
            : Colors.grey,
      );
    }),

    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      return TextStyle(
        fontSize: 15,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w600
            : FontWeight.w500,
        color: states.contains(WidgetState.selected)
            ? AppColors.primary
            : Colors.grey,
      );
    }),

    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
  );

  static final dark = NavigationBarThemeData(
    height: 72,
    elevation: 12,
    backgroundColor: const Color(0xFF1E1E1E),
    shadowColor: Colors.black54,
    indicatorColor: Colors.transparent,

    iconTheme: WidgetStateProperty.resolveWith((states) {
      return IconThemeData(
        size: 24,
        color: states.contains(WidgetState.selected)
            ? AppColors.primary
            : Colors.grey.shade500,
      );
    }),

    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      return TextStyle(
        fontSize: 12,
        fontWeight: states.contains(WidgetState.selected)
            ? FontWeight.w600
            : FontWeight.w500,
        color: states.contains(WidgetState.selected)
            ? AppColors.primary
            : Colors.grey.shade500,
      );
    }),

    overlayColor: const WidgetStatePropertyAll(Colors.transparent),
  );
}