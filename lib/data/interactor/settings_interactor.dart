import 'package:flutter/material.dart';
import 'package:places/data/repository/settings_repository.dart';

class SettingsInteractor extends ChangeNotifier {
  Future<ThemeData> getSettingsThemeColor() async {
    return SettingsRepository.getSettingsThemeColor();
  }

  Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    await SettingsRepository.updateSettingsThemeColor(themeData);
  }
}
