import 'package:flutter/material.dart';
import 'package:places/data/interactor/settings_interactor.dart';
import 'package:places/main.dart';
import 'package:places/ui/res/themes.dart';

///Модель для ChangeNotifierProvider
class AppModel extends ChangeNotifier {
  static int language = 1;

  static bool get isThemeColor => themeColor == darkTheme;

  void changeTheme() {
    themeColor = themeColor == lightTheme ? darkTheme : lightTheme;
    SettingsInteractor.updateSettingsThemeColor(themeColor);
    notifyListeners();
  }
}
