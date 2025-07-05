import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AppSettingsProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;
  String themeTitle = 'Light';
  String language = 'en';
  static const _themeKey = 'themeMode';
  static const languageKey = 'language';
  bool isLoading = true;
  final Map<String, String> categoryMap = {
    'عام': 'General',
    'الصحة': 'Health',
    'الرياضة': 'Sports',
    'الأعمال': 'Business',
    'العلوم': 'Science',
    'الترفيه': 'Entertainment',
    'التكنولوجيا': 'Technology',
  };

  AppSettingsProvider() {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();

    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme == 'dark') {
      themeMode = ThemeMode.dark;
      themeTitle = 'Dark';
    } else {
      themeMode = ThemeMode.light;
      themeTitle = 'Light';
    }

    language = prefs.getString(languageKey) ?? 'en';
    isLoading = false;
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();

    if (themeMode == ThemeMode.light) {
      themeMode = ThemeMode.dark;
      themeTitle = 'Dark';
      await prefs.setString(_themeKey, 'dark');
    } else {
      themeMode = ThemeMode.light;
      themeTitle = 'Light';
      await prefs.setString(_themeKey, 'light');
    }

    notifyListeners();
  }

  Future<void> changeLanguage() async {
    final prefs = await SharedPreferences.getInstance();

    if (language == 'en') {
      language = 'ar';
    } else {
      language = 'en';
    }

    await prefs.setString(languageKey, language);
    notifyListeners();
  }
}
