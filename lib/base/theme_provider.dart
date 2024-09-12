import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:whatsapp_stacked/base/theme/theme.dart';

/// Get and set theme using shared preferences and send to [MaterialApp].

class ThemeProvider extends ChangeNotifier {
  late ThemeData selectedTheme;
  late SharedPreferences prefs;
  ThemeProvider({bool isDark = false}) {
    selectedTheme = isDark ? dark : light;
  }

  ThemeData get getTheme => selectedTheme;

  Future<void> changeTheme() async {
    prefs = await SharedPreferences.getInstance();

    if (selectedTheme == dark) {
      selectedTheme = light;
      await prefs.setBool("isDark", false);
    } else {
      selectedTheme = dark;
      await prefs.setBool("isDark", true);
    }
    notifyListeners();
  }
}
