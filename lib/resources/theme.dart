import 'package:flutter/material.dart';

class MolTheme {
  static ThemeData theme = ThemeData(
      brightness: Brightness.dark,
      primarySwatch: buildMaterialColor(const Color(0xFFEB6530)),
      scaffoldBackgroundColor: const Color(0xFF202020),
      textTheme: const TextTheme(
          bodyText1: TextStyle(fontSize: 12, color: Colors.white),
          headline2: TextStyle(fontSize: 20, color: Colors.white)),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFEB6530),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
      ));
}

MaterialColor buildMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    // strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  // );
  return MaterialColor(color.value, swatch);
}
