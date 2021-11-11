import 'package:flutter/material.dart';

class CustomTheme {
  static final Color colorBlue = Color.fromRGBO(40,155,212,1);
  static final Color colorGreen = Color.fromRGBO(66,209,193,1);
  static final Color colorLightGray = Color.fromRGBO(247,248,251,1);
  static final Color colorGray = Color.fromRGBO(202,202,202,1);
  static final Color colorMaastrichtBlue = Color.fromRGBO(29,37,64,1);
  static final Color colorSpanishGray = Color.fromRGBO(157,158,159,1);
  static final Color colorSaladGreen = Color.fromRGBO(76, 175, 80, 1.0);
  static final Color colorDarkGreen = Color.fromRGBO(51, 122, 61, 1.0);
  static final Color colorRed = Color.fromRGBO(175, 76, 80, 1.0);
  static const Color info = Color.fromRGBO(0, 188, 212, 1.0);
  static final ThemeData theme = ThemeData.light().copyWith(
    primaryColor: colorGreen,);
}