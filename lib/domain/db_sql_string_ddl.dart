// ignore_for_file: missing_whitespace_between_adjacent_strings

class DbSqlStringDdl {
  static String dropTableHistory = 'DROP TABLE IF EXISTS history;';
  static String createTableHistory = 'CREATE TABLE history ('
      'history_text TEXT PRIMARY KEY NOT NULL UNIQUE,'
      "date_add TEXT DEFAULT (datetime('now', 'localtime'))"
      ');';

  static String dropTablePlacesLocal = 'DROP TABLE IF EXISTS placesLocal;';
  static String createTablePlacesLocal = 'CREATE TABLE placesLocal ('
      'id INTEGER  PRIMARY KEY NOT NULL UNIQUE,'
      'isFavorites BOOLEAN,'
      'wantVisitDate INTEGER,'
      'visitedDate INTEGER'
      ');';

  static String dropTableFilter = 'DROP TABLE IF EXISTS filter;';
  static String createTableFilter = 'CREATE TABLE filter ('
      'category STRING  PRIMARY KEY UNIQUE NOT NULL, '
      'orderCategory INTEGER ,'
      'categoryValue INTEGER NOT NULL DEFAULT (1)'
      ');';

  static Map<String, String> insertValueFilter = {
    'hotel': 'INSERT INTO [filter] (category, orderCategory) VALUES ("hotel",0);',
    'restaurant': 'INSERT INTO [filter] (category, orderCategory) VALUES ("restaurant",1);',
    'particularPlace':
        'INSERT INTO [filter] (category, orderCategory) VALUES ("particularPlace",2);',
    'park': 'INSERT INTO [filter] (category, orderCategory) VALUES ("park",3);',
    'museum': 'INSERT INTO [filter] (category, orderCategory) VALUES ("museum",4);',
    'cafe': 'INSERT INTO [filter] (category, orderCategory) VALUES ("cafe",5);',
  };
}
