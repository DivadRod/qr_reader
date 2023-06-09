import 'package:flutter/material.dart';

class ThemeGreen {
  static final themeData = ThemeData(
    appBarTheme: const AppBarTheme(color: Colors.lightGreen),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Colors.lightGreen,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.lightGreen),
  );
}
