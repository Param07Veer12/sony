

import 'package:flutter/material.dart';

const textFieldColor= Color(0xffe5edf2);
const themeColor=Color.fromRGBO(0, 95, 179, 1);
const disabledButtonColor=Color(0xff808080);
const lightTextBgColor = Color.fromRGBO(116, 116, 116, 1);
const transparentColor= Color.fromRGBO(116, 116, 116, 0);




MaterialColor customMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}