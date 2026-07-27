import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppBottomNavTheme {

  static final light =
  BottomNavigationBarThemeData(

    selectedItemColor: AppColors.primary,

    unselectedItemColor: Colors.grey,

    elevation: 12,

    type: BottomNavigationBarType.fixed,
  );
}