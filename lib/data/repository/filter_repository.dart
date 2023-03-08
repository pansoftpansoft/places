import 'package:flutter/material.dart';

//import 'package:places/domain/db_provider.dart';
import 'package:places/domain/sp_provider.dart';

/// Слой получения данных
class FilterRepository {
  ///Получаем список настроек фильтра категорий
  static Future<List<String>> getListFilterCategory() async {
    final listFilter = await SPProvider.getListFilter() ?? <String>[];

    //Todo Сделать переключатеь выбора базы данных для сохранения
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }

  ///Получаем список настроек фильтра дистанции
  static Future<RangeValues> getListFilterDistance() async {
    final distance = await SPProvider.getDistance();

    //Todo Сделать переключатеь выбора базы данных для сохранения
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterDistanceFromDb();

    return distance;
  }

  ///Обновляем список настроек фильтра категорий в базе данных
  static Future<void> updateFilterCategory(Set<String> filterCategory) async {
    await SPProvider.updateFilterCategory(
      filterCategory,
    );

    //Todo Сделать переключатеь выбора базы данных для сохранения
    //await DBProvider.dbProvider.updateSettingsFilterCategoryInDb(filter);
  }

  ///Обновляем список настроек фильтра в базе данных
  static Future<void> updateFilterDistance(RangeValues filterDistance) async {
    await SPProvider.updateDistance(
      filterDistance,
    );

    //Todo Сделать переключатеь выбора базы данных для сохранения
    //await DBProvider.dbProvider.updateSettingsFilterDistanceInDb(filter);
  }
}
