import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Colors.blue;

  static const List<Color> sky = [Color(0xFF6448FE), Color(0xFF5FC6FF)];

  static const List<Color> sunset = [Color(0xFFFE6197), Color(0xFFFFB463)];

  static const List<Color> sea = [Color(0xFF61A3FE), Color(0xFF63FFD5)];

  static const List<Color> mango = [Color(0xFFFFA738), Color(0xFFFFE130)];

  static const List<Color> fire = [Color(0xFFFF5DCD), Color(0xFFFF8484)];

  static const List<Color> nightFade = [Color(0xFFa18cd1), Color(0xFFfbc2eb)];

  static const List<Color> temptingAzure = [
    Color(0xFF84fab0),
    Color(0xFF8fd3f4)
  ];
  static const List<Color> trueSunset = [Color(0xFFfa709a), Color(0xFFfee140)];

  static const List<Color> purpleLake = [Color(0xFF009245), Color(0xFFFCEE21)];

  static const List<Color> mixedHopes = [Color(0xFFc471f5), Color(0xFFfa71cd)];

  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      );
}
