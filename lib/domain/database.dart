import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:places/domain/history.dart';
import 'package:sqflite/sqflite.dart';


/*
Класс для работы с SQLite
Сохраняем историю поиска
*/
class DBProvider {
  static final DBProvider? db = DBProvider._();

  static Database? _database;
  static String _databaseName = '/placeDB.db';

  DBProvider._();

  static Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  static Future<Database> initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String? path = '${documentsDirectory.path}$_databaseName';
    print('path = $path');
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {
        // db.execute(
        //   'drop table history'
        // );
      },
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE history ("
          "history_text TEXT PRIMARY KEY NOT NULL UNIQUE,"
          "date_add TEXT DEFAULT (datetime('now', 'localtime'))"
          ")",
        );
      },
    );
  }

  Future<List<History>> getListHistory() async {
    final db = await database;
    var res = await db!.query("history", orderBy: 'date_add desc', limit: 10);

    List<History>? list =
        res.isNotEmpty ? res.map((c) => History.fromMap(c)).toList() : [];
    return list;
  }

  Future<int> addHistory(String historyText) async {
    if (historyText.isEmpty) return 0;
    final db = await database;
    History newHistory = History(historyText: historyText);
    var res = await db!.insert("history", newHistory.toMap());
    return res;
  }

  Future<int> ClearHistory() async {
    final db = await database;
    var res = await db!.delete("history");
    return res;
  }

  static Future<int> DeleteHistory(String historyText) async {
    final db = await database;
    var res = await db!
        .delete("history", where: 'history_text = ?', whereArgs: [historyText]);
    print(res);
    return res;
  }
}
