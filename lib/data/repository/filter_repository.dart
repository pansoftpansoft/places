import 'package:flutter/material.dart';

//import 'package:places/domain/db_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

///--------------------------------------------------------------
/// Слой получения данных
class FilterRepository {
  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра категорий
  static Future<List<String>> getListFilterCategory() async {
    final listFilter =
        await getFromSharedPreferences<List<String>>('listFilterCategory') ??
            <String>[];

    debugPrint('listFilter = ${listFilter.toString()}');
    //Убрал до следующего Урока
    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterCategoryFromDb();

    return listFilter;
  }

  ///--------------------------------------------------------------
  ///Получаем список настроек фильтра дистанции
  static Future<RangeValues> getListFilterDistance() async {
    final distanceStart =
        await getFromSharedPreferences<double>('distanceStart') ?? 100;

    final distanceEnd =
        await getFromSharedPreferences<double>('distanceEnd') ?? 9000;

    // final listFilter =
    //     await DBProvider.dbProvider.getListFilterDistanceFromDb();

    return RangeValues(distanceStart, distanceEnd);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра категорий в базе данных
  static Future<void> updateFilterCategory(Set<String> filterCategory) async {
    await saveToSharedPreferences(
      'listFilterCategory',
      filterCategory.toList(),
    );

    //Убрал до следующего Урока
    //await DBProvider.dbProvider.updateSettingsFilterCategoryInDb(filter);
  }

  ///--------------------------------------------------------------
  ///Обновляем список настроек фильтра в базе данных
  static Future<void> updateFilterDistance(RangeValues filterDistance) async {
    await saveToSharedPreferences<double>(
      'distanceStart',
      filterDistance.start,
    );
    await saveToSharedPreferences<double>('distanceEnd', filterDistance.end);

    //await DBProvider.dbProvider.updateSettingsFilterDistanceInDb(filter);
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

    if (T == double) {
      value = prefs.getDouble(keyValue) as T;
      debugPrint('value = ${value.toString()}');

      return value;
    }

    if (T == bool) {
      value = prefs.getBool(keyValue) as T;
      debugPrint('bool value = ${value.toString()}');

      return value;
    }

    if (T == List<String>) {
      value = (prefs.getStringList(keyValue) ?? <String>[]) as T;

      return value;
    }

    return null;
  }
}
