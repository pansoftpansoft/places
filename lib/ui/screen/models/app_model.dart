import 'package:flutter/material.dart';
import 'package:places/ui/res/themes.dart';

///Модель для ChangeNotifierProvider
class AppModel extends ChangeNotifier {
  static bool _themeColor = false;

  ///
  ThemeData get themeColor => _themeColor ? darkTheme : lightTheme;

  ///
  bool get isThemeColor => _themeColor;

  ///
  void changeTheme() {
    _themeColor = !_themeColor;
    notifyListeners();
  }
}
