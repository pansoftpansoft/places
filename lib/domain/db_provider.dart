import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:path_provider/path_provider.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/places_local_data.dart';
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
      version: 1,
      onOpen: (final db) async {
        debugPrint('Открать базу данных');
      },
      onCreate: (
        final database,
        final version,
      ) async {
        debugPrint('Создать базу данных');
        await database.execute(
          <String>[
            'CREATE TABLE history (',
            'history_text TEXT PRIMARY KEY NOT NULL UNIQUE,',
            "date_add TEXT DEFAULT (datetime('now', 'localtime'))",
            ');',
          ].join(),
        );
        await database.execute(
          <String>[
            'CREATE TABLE placesLocal (',
            'id INTEGER  PRIMARY KEY NOT NULL UNIQUE,',
            'isFavorites BOOLEAN,',
            'wantVisitDate INTEGER,',
            'visitedDate INTEGER',
            ');',
          ].join(),
        );
      },
      onUpgrade: (final database, final oldVersion, final newVersion) async {
        debugPrint('Обновить базу данных');
        await database.execute(
          <String>[
            'CREATE TABLE history (',
            'history_text TEXT PRIMARY KEY NOT NULL UNIQUE,',
            "date_add TEXT DEFAULT (datetime('now', 'localtime'))",
            ');',
          ].join(),
        );
        await database.execute(
          <String>[
            'CREATE TABLE placesLocal (',
            'id INTEGER  PRIMARY KEY NOT NULL UNIQUE,',
            'isFavorites BOOLEAN,',
            'wantVisitDate INTEGER,',
            'visitedDate INTEGER',
            ');',
          ].join(),
        );
      },
    );
  }

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

  ///-------------------------------------------------------
  /// Удалить список слов истории поиска
  Future<int> deleteTheListOfSearchHistoryWords() async {
    _database = await database;
    final res = await _database!.delete('history');

    return res;
  }

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

  Future<bool> checkPlacesInLocalDataId(int placeId) async {
    _database = await database;
    final res = await _database!.query(
      'placesLocal',
      orderBy: 'id',
      where: 'id = ?',
      whereArgs: [placeId],
    );
    debugPrint('res = ${res.toString()}');
    return res.length > 0 ? true : false;
  }

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
        'newPlacesLocalData.visitedDate = ${newPlacesLocalData.visitedDate}');

    final res = await _database!.update(
      'placesLocal',
      newPlacesLocalData.toMap(),
      where: 'id = ?',
      whereArgs: <int>[place.id],
    );

    return res;
  }
}
