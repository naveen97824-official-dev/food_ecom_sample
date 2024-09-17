import 'package:flutter/material.dart';

class ColorTheme {
  static ColorTheme colorTheme = new ColorTheme();
  final Color primaryColor;
  final Color primaryLightColor;
  final Color primaryTextColor;
  final Color whiteColor;
  final Color dangerColor;
  final Color successColor;

  ColorTheme({
    this.primaryColor = const Color(0xFFFF4D00),
    this.primaryLightColor = const Color(0xFFC98162),
    this.primaryTextColor = const Color(0xFF000000),
    this.whiteColor = const Color(0xFFFFFFFF),
    this.dangerColor = const Color(0xFFFF0000),
    this.successColor = const Color(0xFF00FF00),
  });
}
