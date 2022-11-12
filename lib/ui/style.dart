import 'package:flutter/material.dart';
import "dart:math";

ThemeData lightTheme() {
  return ThemeData(
    backgroundColor: AppColor.white,
    primaryColor: const Color(0xFF4059AD),
    primarySwatch: AppColor.materialBlue,
    colorScheme: const ColorScheme(
      primary: Color(0xFF4059AD),
      onPrimary: Color(0xFFFFFFFF),
      surface: Color(0xFFFEFBFF),
      onSurface: Color(0xFF1B1B1F),
      background: Color(0xFFFEFBFF),
      onBackground: Color(0xFF1B1B1F),
      secondary: Color(0xFF1269FF),
      onSecondary: Color(0xFFFFFFFF),
      error: Color(0xFFBA1A1A),
      onError: Color(0xFFFFFFFF),
      brightness: Brightness.light,
    ),

    ///
    textTheme: TextTheme(
        displayLarge: const TextStyle(
          fontSize: 57.0,
          wordSpacing: 52.0,
          fontWeight: FontWeight.bold,
        ),
        displayMedium: TextStyle(
          fontSize: 45.0,
          fontWeight: FontWeight.bold,
          color: AppColor.materialBlue[400],
        ),
        displaySmall:
            const TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
        headlineLarge:
            const TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
        headlineMedium: const TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold, color: AppColor.black1),
        headlineSmall: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: AppColor.black1),
        titleLarge: const TextStyle(fontSize: 22.0),
        titleMedium: const TextStyle(fontSize: 18.0),
        titleSmall: const TextStyle(fontSize: 14.0),
        labelLarge: const TextStyle(fontSize: 14.0),
        labelMedium: const TextStyle(fontSize: 12.0),
        labelSmall: const TextStyle(fontSize: 11.0),
        bodyLarge: const TextStyle(fontSize: 18.0),
        bodyMedium: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            color: AppColor.black1),
        bodySmall: const TextStyle(fontSize: 14.0)),
  );
}

class AppColor {
  static const primary = Color(0xFF4059AD);
  static const white = Color(0xFFFDFDFD);
  static const aliceBlue = Color(0xFFF3FAFF);
  static const blueRYB = Color(0xFF1D33FF);
  static const bluetiful = Color(0xFF1269FF);
  static const midnightBlue = Color(0xFF0e0e52);
  static const black1 = Color(0xFF1a181b);
  static const black2 = Color(0xFF171219);
  static const russianViolet = Color(0xFF2c0735);

  static const materialBlue = MaterialColor(0xFF1269FF, {
    50: Color(0xFFb3cfff),
    100: Color(0xFFb3cfff),
    200: Color(0xFF80aeff),
    300: Color(0xFF4d8eff),
    400: Color(0xFF1a6eff),
    500: Color(0xFF0054e6),
    600: Color(0xFF0042b3),
    700: Color(0xFF002f80),
    800: Color(0xFF001c4d),
    900: Color(0xFF00091a),
  });

  static const pink1 = Color(0xFFff006e);
  static const indigoDye = Color(0xFF083D77);
  static const lightSalmon = Color(0xFFfca17d);
  static const correctGreen = Color(0xFF81dc9b);

  static Color randomLabelColor() {
    var list = [pink1, indigoDye, lightSalmon, correctGreen];

// generates a new Random object
    final random = Random();

// generate a random index based on the list length
// and use it to retrieve the element
    return list[random.nextInt(list.length)];
  }
}
