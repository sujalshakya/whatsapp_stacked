import 'package:flutter/material.dart';

final ThemeData light = ThemeData(
  colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Colors.black,
      onPrimary: Color.fromARGB(255, 164, 225, 255),
      secondary: Color.fromARGB(255, 192, 234, 144),
      onSecondary: Color(0xFF00856e),
      error: Colors.red,
      onError: Color(0XFFDFD4C7),
      surface: Colors.white,
      onSurface: Colors.black),
  iconTheme: const IconThemeData(color: Colors.white),
);

final ThemeData dark = ThemeData(
    colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Color.fromARGB(255, 3, 113, 168),
        secondary: Color(0xFF00856e),
        onSecondary: Color(0xFF00856e),
        error: Colors.red,
        onError: Colors.black,
        surface: Colors.black,
        onSurface: Colors.white),
    iconTheme: const IconThemeData(color: Colors.white));
