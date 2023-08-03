import 'package:flutter/material.dart';
import 'package:places/domain/sp_provider.dart';

import '../../ui/res/themes.dart';

class SettingsRepository {
  ///Получаем темы из базы
  static Future<ThemeData> getSettingsThemeColor() async {
    var param = 0;

    param = await SPProvider.getThemeColor() ?? 0;

    return param == 0 ? lightTheme : darkTheme;
  }

  ///Сохранение темы в базе
  static Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    final saveTheme = themeData == darkTheme ? 1 : 0;

    await SPProvider.updateThemeColor(saveTheme);
  }

  ///Проверяем показ Туториала
  static Future<bool> getShowOnboarding() async {
    final param = await SPProvider.getShowOnboarding() ?? false;

    return param;
  }

  ///Сохраняем показ Туториала
  static Future<void> updateShowOnboarding() async {
    await SPProvider.updateShowOnboarding();
  }
}
