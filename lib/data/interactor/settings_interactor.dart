import 'package:flutter/material.dart';
//import 'package:places/data/repository/settings_repository.dart';
import 'package:places/domain/sp_provider.dart';

import '../../ui/res/themes.dart';

class SettingsInteractor extends ChangeNotifier {
  Future<ThemeData> getSettingsTheme(String settingName) async {
    final param = await SPProvider.getFromSP<int>(settingName);
    final themeColorValue = param == 0 ? lightTheme : darkTheme;

    return themeColorValue;

    // SQLite вариант
    // final listFilter = await SettingsRepository.getListSettingsApp();
    // var settingListValue = lightTheme;
    //
    // for (final item in listFilter) {
    //   if (item.settingsName == settingName) {
    //     // debugPrint('SettingsApp.toMap() = ${item.settingsValue}');
    //     settingListValue = item.settingsValue == '0' ? lightTheme : darkTheme;
    //   }
    // }
    // debugPrint('SettingsApp.toMap() = ${settingListValue.toString()}');
  }

  Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    final saveTheme = themeData == darkTheme ? 1 : 0;
    await SPProvider.updateInSP<int>(
      'themesColor',
      saveTheme,
    );

    // SQLite версия
    // final settingListValue = themeData == darkTheme ? '1' : '0';
    // await SettingsRepository.updateSettingsThemeColor(settingListValue);
  }
}
