import 'package:flutter/material.dart';

class LightColorTheme {
  static const Map<int, Color> _blueSwatch = {
    50: Color.fromRGBO(0, 106, 216, 1),
    100: Color.fromRGBO(0, 106, 216, 2),
    200: Color.fromRGBO(0, 106, 216, 3),
    300: Color.fromRGBO(0, 106, 216, 4),
    400: Color.fromRGBO(0, 106, 216, 5),
    500: Color.fromRGBO(0, 106, 216, 6),
    600: Color.fromRGBO(0, 106, 216, 7),
    700: Color.fromRGBO(0, 106, 216, 8),
    800: Color.fromRGBO(0, 106, 216, 9),
    900: Color.fromRGBO(0, 106, 216, 1),
  };

  static MaterialColor get getMaterialBLueSwatch => const MaterialColor(0xFF006AD8, _blueSwatch);

}
