import 'dart:math';

import 'package:flutter/material.dart';
import 'package:jarir_bookstore_project/shared/helpers/helpers.dart';

class RandomColorsHelper {
  RandomColorsHelper._();

  static final Random _random = Random();

  static const List<Color> _lightPalette = [
    Color(0xFFCCCCD8),
    Color(0xFFFAD1D2),
    Color(0xFFF7BEC0),
    Color(0xFFE8E6E7),
    Color(0xFFE1DFE0),
    Color(0xFFFCD8C0),
    Color(0xFFE7DDC7),
    Color(0xFFD1C3C3),
    Color(0xFFC5DDD0),
    Color(0xFFCFE3DA),
    Color(0xFFE5C2C1),
    Color(0xFFD9E9CA),
  ];

  static Color random(BuildContext context) {
    final color = _lightPalette[_random.nextInt(_lightPalette.length)];

    if (Theme.of(context).brightness == Brightness.dark) {
      return darken(color);
    }

    return color;
  }
}