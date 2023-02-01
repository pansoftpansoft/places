import 'package:flutter/material.dart';

///Модель для ChangeNotifierProvider
class AppModel extends ChangeNotifier {
  static int language = 1;

  //static bool get isThemeColor => themeColor == darkTheme;

  // void changeTheme() {
  //   themeColor = themeColor == lightTheme ? darkTheme : lightTheme;
  //   SettingsInteractor.updateSettingsThemeColor(themeColor);
  //   notifyListeners();
  // }
}
