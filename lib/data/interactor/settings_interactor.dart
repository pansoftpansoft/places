import 'package:flutter/material.dart';
import 'package:places/data/repository/settings_repository.dart';

import '../../ui/res/themes.dart';

class SettingsInteractor extends ChangeNotifier {
  Future<ThemeData> getSettingsTheme(String settingName) async {
    final listFilter = await SettingsRepository.getListSettingsApp();
    var settingListValue = lightTheme;

    for (final item in listFilter) {
      if (item.settingsName == settingName) {
        // debugPrint('SettingsApp.toMap() = ${item.settingsValue}');
        settingListValue = item.settingsValue == '0' ? lightTheme : darkTheme;
      }
    }
    debugPrint('SettingsApp.toMap() = ${settingListValue.toString()}');

    return settingListValue;
  }

  Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    final settingListValue = themeData == darkTheme ? '1' : '0';
    await SettingsRepository.updateSettingsThemeColor(settingListValue);
  }
}
