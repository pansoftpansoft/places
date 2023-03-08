import 'package:flutter/material.dart';
import 'package:places/data/api/api_sp.dart';
import 'package:places/ui/res/sizes.dart';

///SharedPreferences
///функции для доступа
class SPProvider {
  ///Ключи значений
  static const _listFilterCategory = 'listFilterCategory';
  static const _distanceStart = 'distanceStart';
  static const _distanceEnd = 'distanceEnd';
  static const _keyThemeColor = 'keyThemeColor';
  static const _keyShowTutorial = 'keyShowTutorial';

  static Future<int?> getThemeColor() async {
    final param = await ApiSP.getFromSP<int>(_keyThemeColor);

    return param;
  }

  static Future<List<String>?> getListFilter() async {
    final param = await ApiSP.getFromSP<List<String>>(_listFilterCategory);

    return param;
  }

  static Future<RangeValues> getDistance() async {
    final distanceStart =
        await ApiSP.getFromSP<double>(_distanceStart) ?? defaultDistanceStart;
    final distanceEnd =
        await ApiSP.getFromSP<double>(_distanceEnd) ?? defaultDistanceEnd;

    return RangeValues(distanceStart, distanceEnd);
  }

  static Future<void> updateThemeColor(int themeData) async {
    await ApiSP.updateInSP<int>(
      _keyThemeColor,
      themeData,
    );
  }

  static Future<bool?> getShowOnboarding() async {
    final param = await ApiSP.getFromSP<bool>(_keyShowTutorial);

    return param;
  }

  static Future<void> updateShowOnboarding() async {
    await ApiSP.updateInSP<bool>(
      _keyShowTutorial,
      true,
    );
  }

  static Future<void> updateDistance(RangeValues filterDistance) async {
    await ApiSP.updateInSP<double>(
      _distanceStart,
      filterDistance.start,
    );

    await ApiSP.updateInSP<double>(
      _distanceEnd,
      filterDistance.end,
    );
  }

  static Future<void> updateFilterCategory(Set<String> filterCategory) async {
    await ApiSP.updateInSP<List<String>>(
      _listFilterCategory,
      filterCategory.toList(),
    );
  }
}
