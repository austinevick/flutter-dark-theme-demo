import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppNotifier {
  static final themeNotifier = ValueNotifier(false);
  static final themeNotifier1 = ValueNotifier(0);
  static String darkTheme = 'darkTheme';
  static String darkTheme1 = 'darkTheme1';

  static Future<bool?> getDarkTheme() async {
    final s = await SharedPreferences.getInstance();
    return s.getBool(darkTheme) ?? false;
  }

  static Future<bool?> saveDarkTheme(bool value) async {
    final s = await SharedPreferences.getInstance();
    return s.setBool(darkTheme, value);
  }

  static Future<int?> getDarkTheme1() async {
    final s = await SharedPreferences.getInstance();
    return s.getInt(darkTheme1) ?? 0;
  }

  static Future<bool?> saveDarkTheme1(int value) async {
    final s = await SharedPreferences.getInstance();
    return s.setInt(darkTheme1, value);
  }
}
