import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
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
            'wantVisitDate DATETIME,',
            'visitedDate DATETIME',
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
            'CREATE TABLE placesLocal (',
            'id INTEGER  PRIMARY KEY NOT NULL UNIQUE,',
            'isFavorites BOOLEAN,',
            'wantVisitDate DATETIME,',
            'visitedDate DATETIME',
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

  /// Добавить в историю поиска новый поисковый запрос
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

  ///
  Future<int> clearHistory() async {
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


  /// Добавить в историю поиска новый поисковый запрос
  Future<int>insertPlacesLocalData(
    int id, {
    bool isFavorites = false,
    DateTime? wantVisitDate,
    DateTime? visitedDate,
  }) async {
    if (id.isNaN) {
      return 0;
    }
    _database = await database;
    final newPlacesLocalData = PlacesLocalData(
      id,
      isFavorites: isFavorites,
      wantVisitDate: wantVisitDate,
      visitedDate: visitedDate,
    );

    final res =
        await _database!.insert('placesLocal', newPlacesLocalData.toMap());

    return res;
  }

  /// Добавить в историю поиска новый поисковый запрос
  Future<int> updatePlacesLocalData(
      int id, {
        bool? isFavorites,
        DateTime? wantVisitDate,
        DateTime? visitedDate,
      }) async {
    if (id.isNaN) {
      return 0;
    }




    _database = await database;
    final newPlacesLocalData = PlacesLocalData(
      id,
      isFavorites: isFavorites,
      wantVisitDate: wantVisitDate,
      visitedDate: visitedDate,
    );

    final res =
    await _database!.update('placesLocal', newPlacesLocalData.toMap());

    return res;
  }
}
