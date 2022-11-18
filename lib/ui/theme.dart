import 'package:flutter/material.dart';

const customYellow = Color(0xFFFBD42C);
const customBlack = Color(0xFF000000);
const customDarkNeutral1 = Color(0xFF1A1A1A);
const customDarkNeutral4 = Color(0xFF5C5C5C);
const customDarkNeutral5 = Color(0xFF787878);

const customWhite = Color(0xFFFFFFFF);
const customLight = Color(0xFFECEFF4);
const customTransparent = Colors.transparent;

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
        style: primaryButtonStyle,
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

final ButtonStyle primaryButtonStyle = TextButton.styleFrom(
  backgroundColor: customYellow,
  foregroundColor: customBlack,
  disabledBackgroundColor: customYellow.withOpacity(0.5),
  disabledForegroundColor: customBlack,
  minimumSize: const Size(56, 56),
  shape: const ContinuousRectangleBorder(),
  textStyle: const TextStyle(
    fontFamily: 'Rajdhani',
    color: customYellow,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);

final ButtonStyle secondaryButtonStyle = TextButton.styleFrom(
  backgroundColor: customBlack,
  foregroundColor: customWhite,
  minimumSize: const Size(56, 56),
  shape: const ContinuousRectangleBorder(),
  textStyle: const TextStyle(
    fontFamily: 'Rajdhani',
    color: customYellow,
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
  ),
);
