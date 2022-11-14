import 'package:flutter/material.dart';

const customYellow = Color(0xFFFBD42C);
const customBlack = Color(0xFF000000);
const customWhite = Color(0xFFFFFFFF);
const customLight = Color(0xFFECEFF4);

List<ThemeData> getThemes() {
  return [
    // Dark theme
    ThemeData(
      fontFamily: 'Rajdhani',
      colorScheme: const ColorScheme.highContrastDark(
        secondary: customBlack,
        onSecondary: customWhite,
      ),
      textButtonTheme: TextButtonThemeData(
        style: flatButtonStyle,
      ),
      scaffoldBackgroundColor: customBlack,
    ),
    // Light theme
    ThemeData(
      fontFamily: 'Rajdhani',
      colorScheme: const ColorScheme.highContrastLight(
        secondary: customWhite,
        onSecondary: Color(0xFF2F3132),
      ),
      scaffoldBackgroundColor: customLight,
    ),
  ];
}

final ButtonStyle flatButtonStyle = TextButton.styleFrom(
  backgroundColor: customYellow,
  foregroundColor: customBlack,
  minimumSize: const Size(56, 56),
  shape: const ContinuousRectangleBorder(),
  textStyle: const TextStyle(
    fontFamily: 'Rajdhani',
    color: customYellow,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);
