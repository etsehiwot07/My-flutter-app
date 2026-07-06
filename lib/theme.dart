import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  String selectedLanguage = 'English';

  void toggleTheme(bool val) {
    isDarkMode = val;
    notifyListeners();
  }

  void changeLanguage(String lang) {
    selectedLanguage = lang;
    notifyListeners();
  }

}