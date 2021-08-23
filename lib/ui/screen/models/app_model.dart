import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';

//Модель для ChangeNotifierProvider
class AppModel extends ChangeNotifier {
  static bool _themeColor = false;

  ThemeData get themeColor => _themeColor == false ? lightTheme : darkTheme;

  bool get isThemeColor => _themeColor;

  void changeTheme(bool theme) {
    _themeColor = theme;
    notifyListeners();
  }
}
