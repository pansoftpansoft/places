import 'package:flutter/material.dart';
import 'package:places/data/repository/settings_repository.dart';

class SettingsInteractor {
  Future<ThemeData> getSettingsThemeColor() async {
    return SettingsRepository.getSettingsThemeColor();
  }

  Future<void> updateSettingsThemeColor(ThemeData themeData) async {
    await SettingsRepository.updateSettingsThemeColor(themeData);
  }

  Future<bool> getShowOnboarding() async {
    return SettingsRepository.getShowOnboarding();
  }

  Future<void> updateShowOnboarding() async {
    await SettingsRepository.updateShowOnboarding();
  }
}
