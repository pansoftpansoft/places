import 'package:flutter/material.dart';

//import 'package:places/domain/db_provider.dart';
import 'package:places/domain/sp_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Слой получения данных
class FilterRepository {
  ///Получаем список настроек фильтра категорий
  static Future<List<String>> getListFilterCategory() async {
    final listFilter = await SPProvider.getListFilter() ?? <String>[];

    // ToDo - версия с SQLite
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }

  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра дистанции
  static Future<RangeValues> getListFilterDistance() async {
    final distanceStart = await SPProvider.getDistanceStart() ?? 100;
    final distanceEnd = await SPProvider.getDistanceEnd() ?? 1000;

    // ToDo - версия с SQLite
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterDistanceFromDb();

    return RangeValues(distanceStart, distanceEnd);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра категорий в базе данных
  static Future<void> updateFilterCategory(Set<String> filterCategory) async {
    await saveToSharedPreferences(
      _listFilterCategory,
      filterCategory.toList(),
    );

    //Убрал до следующего Урока
    //await DBProvider.dbProvider.updateSettingsFilterCategoryInDb(filter);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра в базе данных
  static Future<void> updateFilterDistance(RangeValues filterDistance) async {
    await saveToSharedPreferences<double>(
      _distanceStart,
      filterDistance.start,
    );
    await saveToSharedPreferences<double>(_distanceEnd, filterDistance.end);

    //await DBProvider.dbProvider.updateSettingsFilterDistanceInDb(filter);
  }
}
