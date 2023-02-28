import 'package:flutter/material.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/type_place.dart';
import 'package:shared_preferences/shared_preferences.dart';

///--------------------------------------------------------------
/// Слой получения данных
class FilterRepository {
  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра категорий
  static Future<List<FilterCategory>> getListFilterCategory() async {
    final listFilter = <FilterCategory>[];
    for (var i = 0; i < typePlace.length; i++) {
      final val = await getFromSharedPreferences<int>(typePlace[i]) ?? 0;
      debugPrint('val = ${val.toString()}');
      listFilter.add(
        FilterCategory(typePlace[i], i, val),
      );
    }

    debugPrint('listFilter = ${listFilter.toString()}');
    //Убрал до следующего Урока
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }

  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра дистанции
  static Future<FilterDistance> getListFilterDistance() async {
    final listFilter =
        await DBProvider.dbProvider.getListFilterDistanceFromDb();

    return listFilter.first;
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра категорий в базе данных
  static Future<void> updateFilterCategory(FilterCategory filter) async {
    debugPrint('filter = ${filter.toMap().toString()}');
    await saveToSharedPreferences(filter.category, filter.categoryValue);
    //Убрал до следующего Урока
    //await DBProvider.dbProvider.updateSettingsFilterCategoryInDb(filter);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра в базе данных
  static Future<void> updateFilterDistance(FilterDistance filter) async {
    await DBProvider.dbProvider.updateSettingsFilterDistanceInDb(filter);
  }

  static Future<void> saveToSharedPreferences<T>(
    String keyValue,
    T value,
  ) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) {
      await prefs.setString(keyValue, value as String);
    }

    if (T == int) {

      await prefs.setInt(keyValue, value as int);
    }

    if (T == double) {
      await prefs.setDouble(keyValue, value as double);
    }

    if (T == bool) {
      await prefs.setBool(keyValue, value as bool);
    }

    if (T == List<String>) {
      await prefs.setStringList(keyValue, value as List<String>);
    }
  }

  static Future<T?> getFromSharedPreferences<T>(String keyValue) async {
    final prefs = await SharedPreferences.getInstance();

    T value;

    if (T == String) {
      value = prefs.getString(keyValue) as T;

      return value;
    }

    if (T == int) {
      value = prefs.getInt(keyValue) as T;
      debugPrint('value = ${value.toString()}');

      return value;
    }

    if (T == bool) {
      value = prefs.getBool(keyValue) as T;

      return value;
    }

    if (T == List<String>) {
      value = prefs.getBool(keyValue) as T;

      return value;
    }

    return null;
  }
}
