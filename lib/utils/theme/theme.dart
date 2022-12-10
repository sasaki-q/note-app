import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData({
    required bool isDarkTheme,
    required BuildContext context,
  }) {
    return isDarkTheme
        // dark
        ? ThemeData(
            scaffoldBackgroundColor: const Color(0xFF00001a),
            primaryColor: Colors.blue,
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: const Color(0xFF1a1f3c),
                  brightness: Brightness.dark,
                ),
            cardColor: const Color(0xFF0a0d2c),
            canvasColor: Colors.black,
            buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: const ColorScheme.dark(),
                ),
          )
        // light
        : ThemeData(
            scaffoldBackgroundColor: const Color(0xFFFFFFFF),
            primaryColor: Colors.blue,
            colorScheme: ThemeData().colorScheme.copyWith(
                  secondary: const Color(0xFFE8FDFD),
                  brightness: Brightness.light,
                ),
            cardColor: const Color(0xFFF2FDFD),
            canvasColor: Colors.grey[50],
            buttonTheme: Theme.of(context).buttonTheme.copyWith(
                  colorScheme: const ColorScheme.light(),
                ),
            inputDecorationTheme: const InputDecorationTheme(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue, width: 1.0),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey, width: 1.0),
              ),
            ),
            floatingActionButtonTheme: const FloatingActionButtonThemeData(
              backgroundColor: Colors.blue,
            ),
          );
  }
}
