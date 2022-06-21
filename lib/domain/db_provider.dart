// ignore_for_file: cascade_invocations

//import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_local_data.dart';
import 'package:places/domain/db_sql_string_ddl.dart';
import 'package:places/domain/history.dart';
import 'package:sqflite/sqflite.dart';

/// Класс для работы с SQLite Сохраняем историю поиска
class DBProvider {
  ///
  static const String _databaseName = '/placeDB.db';

  ///
  static final DBProvider dbProvider = DBProvider._();

  ///
  static Database? _database;

  ///
  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    return initDB();
  }

  DBProvider._();

  /// Удалить поисковый запрос из истории поиска
  static Future<int> deleteHistory(final String historyText) async {
    _database = await database;
    final res = await _database!.delete(
      'history',
      where: 'history_text = ?',
      whereArgs: <String>[historyText],
    );

    return res;
  }

  ///
  static Future<Database> initDB() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = '${documentsDirectory.path}$_databaseName';

    // var f = File(path);
    // await f.delete();
    // debugPrint('path = ${path}');

    return openDatabase(
      path,
      version: 8,
      onOpen: (final db) async {
        debugPrint('Открать базу данных');
      },
      onCreate: (
        final database,
        final version,
      ) async {
        debugPrint('Создать базу данных');
        await onCreate(database);
      },
      onUpgrade: (final database, final oldVersion, final newVersion) async {
        debugPrint('Обновить базу данных');
        await onCreate(database);
      },
    );
  }

  static Future<void> onCreate(Database database) async {
    await database.execute(DbSqlStringDdl.dropTableHistory);
    await database.execute(DbSqlStringDdl.createTableHistory);

    await database.execute(DbSqlStringDdl.dropTablePlacesLocal);
    await database.execute(DbSqlStringDdl.createTablePlacesLocal);

    await database.execute(DbSqlStringDdl.dropTableFilter);
    await database.execute(DbSqlStringDdl.dropTableFilterCategory);
    await database.execute(DbSqlStringDdl.createTableFilterCategory);

    await database.execute(DbSqlStringDdl.dropTableFilterDistance);
    await database.execute(DbSqlStringDdl.createTableFilterDistance);

    // Заполняем начальными данными фильтр категорий
    for (final item in DbSqlStringDdl.insertValueFilterCategory.keys.toList()) {
      await database.execute(DbSqlStringDdl.insertValueFilterCategory[item]!);
    }
    // Заполняем начальными данными фильтр растоияния

    await database.execute(DbSqlStringDdl.insertValueFilterDistance[1]!);
  }

  ///--------------------------------------------------------------
  /// Получить историю поиска из бызы данных
  Future<List<History>?> getListHistoryFromDb() async {
    _database = await database;
    final res = await _database!.query(
      'history',
      orderBy: 'date_add desc',
      limit: 10,
    );

    final list =
        res.isNotEmpty ? res.map(History.fromMap).toList() : <History>[];

    return list;
  }

  ///--------------------------------------------------------------
  /// Добавить, в список историй поиска, новый поисковый запрос
  Future<int> addHistory(final String historyText) async {
    if (historyText.isEmpty) {
      return 0;
    }
    //ToDo сделать проверку на совпадение
    _database = await database;
    final newHistory = History(historyText: historyText);
    final res = await _database!.insert('history', newHistory.toMap());

    return res;
  }

  ///--------------------------------------------------------------
  /// Получить настройки фильтра категории из бызы данных
  Future<List<FilterCategory>> getListFilterCategoryFromDb() async {
    _database = await database;
    final res = await _database!.query(
      'FilterCategory',
      orderBy: 'orderCategory',
    );

    final list = res.isNotEmpty
        ? res.map(FilterCategory.fromMap).toList()
        : <FilterCategory>[];

    return list;
  }

  ///--------------------------------------------------------------
  /// Соохранить настройки фильтра категории в базу
  Future<void> updateSettingsFilterCategoryInDb(
    final FilterCategory filter,
  ) async {
    _database = await database;
    final res = await _database!.update(
      'FilterCategory',
      filter.toMap(),
      where: 'category=?',
      whereArgs: [filter.category],
    );
  }

  ///--------------------------------------------------------------
  /// Получить настройки фильтра растояния из бызы данных
  Future<List<FilterDistance>> getListFilterDistanceFromDb() async {
    _database = await database;
    final res = await _database!.query(
      'FilterDistance',
    );

    debugPrint('res = ${res.toString()}');
    final list = res.isNotEmpty
        ? res.map(FilterDistance.fromMap).toList()
        : <FilterDistance>[];

    return list;
  }

  ///--------------------------------------------------------------
  /// Соохранить настройки фильтра растояния в базу
  Future<void> updateSettingsFilterDistanceInDb(
    final FilterDistance filter,
  ) async {
    debugPrint('filter.toMap() = ${filter.toMap().toString()}');
    _database = await database;
    final res = await _database!.update(
      'FilterDistance',
      filter.toMap(),
      where: 'distanceCode=?',
      whereArgs: [1],
    );
  }

  ///--------------------------------------------------------------
  /// Удалить список слов истории поиска
  Future<int> deleteTheListOfSearchHistoryWords() async {
    _database = await database;
    final res = await _database!.delete('history');

    return res;
  }

  ///--------------------------------------------------------------
  /// Получить список локальных данных из бызы данных
  Future<List<PlacesLocalData>> getPlacesLocal() async {
    _database = await database;
    final res = await _database!.query(
      'placesLocal',
      orderBy: 'id',
    );

    final list = res.isNotEmpty
        ? res.map(PlacesLocalData.fromSqlite).toList()
        : <PlacesLocalData>[];

    return list;
  }

  ///--------------------------------------------------------------
  /// Получить локальных данных из бызы данных, для одного места
  Future<PlacesLocalData?> getPlacesLocalDataId(int placeId) async {
    _database = await database;
    final res = await _database!.query(
      'placesLocal',
      orderBy: 'id',
      where: 'id = ?',
      whereArgs: [placeId],
    );

    final placesLocalData = PlacesLocalData(placeId);
    if (res.isNotEmpty) {
      placesLocalData.isFavorites = res.first['isFavorites'] as int;
      placesLocalData.wantVisitDate = res.first['wantVisitDate'] as int?;
      placesLocalData.visitedDate = res.first['visitedDate'] as int?;
    }

    return placesLocalData;
  }

  ///--------------------------------------------------------------
  ///
  Future<bool> checkPlacesInLocalDataId(int placeId) async {
    _database = await database;
    final res = await _database!.query(
      'placesLocal',
      orderBy: 'id',
      where: 'id = ?',
      whereArgs: [placeId],
    );
    debugPrint('res = ${res.toString()}');

    return res.isNotEmpty;
  }

  ///--------------------------------------------------------------
  /// Получить список локальных данных из бызы данных
  Future<List<PlacesLocalData>> getPlacesLocalId() async {
    _database = await database;
    final res = await _database!.query(
      'placesLocal',
      orderBy: 'id',
    );

    final list = res.isNotEmpty
        ? res.map(PlacesLocalData.fromSqlite).toList()
        : <PlacesLocalData>[];

    return list;
  }

  ///--------------------------------------------------------------
  /// Добавить в базу, данные о месте
  Future<int> insertPlacesLocalData(Place place) async {
    if (place.id.isNaN) {
      return 0;
    }
    _database = await database;
    final newPlacesLocalData = PlacesLocalData(
      place.id,
      isFavorites: place.isFavorites ? 1 : 0,
      wantVisitDate:
          place.wantVisitDate == null ? 0 : place.wantVisitDate as int,
      visitedDate: place.visitedDate == null ? 0 : place.visitedDate as int,
    );

    final res =
        await _database!.insert('placesLocal', newPlacesLocalData.toMap());

    return res;
  }

  ///--------------------------------------------------------------
  /// Дизменить в базе, данные о месте
  Future<int> updatePlacesLocalData(Place place) async {
    if (place.id.isNaN) {
      return 0;
    }

    debugPrint('place.visitedDate.toString() = ${place.visitedDate}');
    _database = await database;
    final newPlacesLocalData = PlacesLocalData(
      place.id,
      isFavorites: place.isFavorites ? 1 : 0,
      wantVisitDate: place.wantVisitDate == null
          ? null
          : int.tryParse(place.wantVisitDate.toString()),
      visitedDate: place.visitedDate == null
          ? null
          : int.tryParse(place.visitedDate!.millisecondsSinceEpoch.toString()),
    );

    debugPrint(
      'newPlacesLocalData.visitedDate = ${newPlacesLocalData.visitedDate}',
    );

    final res = await _database!.update(
      'placesLocal',
      newPlacesLocalData.toMap(),
      where: 'id = ?',
      whereArgs: <int>[place.id],
    );

    return res;
  }
}
