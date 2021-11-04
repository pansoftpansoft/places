import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:places/domain/history.dart';
import 'package:sqflite/sqflite.dart';

/// Класс для работы с SQLite Сохраняем историю поиска
class DBProvider {
  DBProvider._();

  ///
  static final DBProvider db = DBProvider._();

  static Database? _database;

  ///
  static const String _databaseName = '/placeDB.db';

  ///
  static Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }

    return initDB();
  }

  ///
  static Future<Database> initDB() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    final String path = '${documentsDirectory.path}$_databaseName';

    return openDatabase(
      path,
      version: 1,
      onOpen: (final Database db) {
        if (kDebugMode) {
          print('Открать базу данных');
        }
      },
      onCreate: (
        final Database db,
        final int version,
      ) async {
        await db.execute(
          <String>[
            "CREATE TABLE history (",
            "history_text TEXT PRIMARY KEY NOT NULL UNIQUE,",
            "date_add TEXT DEFAULT (datetime('now', 'localtime'))",
            ")",
          ].join(),
        );
      },
    );
  }

  ///
  Future<List<History>?> getListHistory() async {
    final Database? db = await database;
    final List<Map<String, Object?>> res =
        await db!.query("history", orderBy: 'date_add desc', limit: 10);

    final List<History> list = res.isNotEmpty
        ? res.map((final Map<String, Object?> c) => History.fromMap(c)).toList()
        : <History>[];

    return list;
  }

  ///
  Future<int> addHistory(final String historyText) async {
    if (historyText.isEmpty) {
      return 0;
    }
    final Database? db = await database;
    final History newHistory = History(historyText: historyText);
    final int res = await db!.insert("history", newHistory.toMap());

    return res;
  }

  ///
  Future<int> clearHistory() async {
    final Database? db = await database;
    final int res = await db!.delete("history");

    return res;
  }

  ///
  static Future<int> deleteHistory(final String historyText) async {
    final Database? db = await database;
    final int res = await db!.delete(
      "history",
      where: 'history_text = ?',
      whereArgs: <String>[historyText],
    );

    return res;
  }
}
