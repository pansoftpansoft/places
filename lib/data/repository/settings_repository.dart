import 'package:flutter/material.dart';
import 'package:places/data/model/settings_app.dart';
import 'package:places/domain/db_provider.dart';

class SettingsRepository {
  ///--------------------------------------------------------------
  ///Получаем список настроек приложения
  static Future<List<SettingsApp>> getListSettingsApp() async {
    final listFilter = await DBProvider.dbProvider.getListSettingsAppFromDb();
    for (final item in listFilter) {
      debugPrint(
        'item = ${item.settingsName} ${item.settingsValue}',
      );
    }

    return listFilter;
  }

  //updateSettingsThemeColorInDb
  static Future<void> updateSettingsThemeColor(String settingsApp) async {
    await DBProvider.dbProvider.updateSettingsThemeColorInDb(settingsApp);
  }
}
