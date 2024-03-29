import 'package:flutter/material.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/domain/sp_provider.dart';

import '../../ui/res/themes.dart';

class SettingsRepository {
  //Вариант хранения данных
  //0 - просто SQL
  //1 - SharedPreferences
  //2 - Moor

  static const _distanceEnd = 'distanceEnd';
  static int dbType = 1;

  ///--------------------------------------------------------------
  ///Получаем темы из базы
  static Future<ThemeData> getSettingsThemeColor() async {
    var param = 0;

    if (dbType == 0) {
      param = await DBProvider.dbProvider.getThemeColor();
    }

    if (dbType == 1) {
      param = await SPProvider.getThemeColor() ?? 0;
    }

    return param == 0 ? lightTheme : darkTheme;
  }

  ///Сохранение темы в базе
  static Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    final saveTheme = themeData == darkTheme ? 1 : 0;

    if (dbType == 0) {
      await DBProvider.dbProvider.updateSettingsThemeColorInDb(saveTheme);
    }

    if (dbType == 1) {
      await SPProvider.updateThemeColor(saveTheme);
    }
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

  // ///Проверяем показ Туториала
  // static Future<bool> getShowOnboarding() async {
  //   final param = await SPProvider.getShowOnboarding() ?? false;
  //
  //   return param;
  // }
  //
  // ///Сохраняем показ Туториала
  // static Future<void> updateShowOnboarding() async {
  //   await SPProvider.updateShowOnboarding();
  // }
}
