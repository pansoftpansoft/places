import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
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

  ///
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

    return openDatabase(
      path,
      version: 1,
      onOpen: (final db) {
        debugPrint('Открать базу данных');
      },
      onCreate: (
        final database,
        final version,
      ) async {
        await database.execute(
          <String>[
            'CREATE TABLE history (',
            'history_text TEXT PRIMARY KEY NOT NULL UNIQUE,',
            "date_add TEXT DEFAULT (datetime('now', 'localtime'))",
            ')',
          ].join(),
        );
      },
    );
  }

  ///
  Future<List<History>?> getListHistoryFromDb() async {
    _database = await database;
    final res =
        await _database!.query('history', orderBy: 'date_add desc', limit: 10);

    final list =
        res.isNotEmpty ? res.map(History.fromMap).toList() : <History>[];

    return list;
  }

  ///
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
}
