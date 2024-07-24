import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Brightness brightness = Brightness.light;

  changeBrightess() {
    if (brightness == Brightness.dark) {
      brightness = Brightness.light;
    } else {
      brightness = Brightness.dark;
    }
    notifyListeners();
  }

  isDarkMode() {
    return brightness == Brightness.dark;
  }
}
