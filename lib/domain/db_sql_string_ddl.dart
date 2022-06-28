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
  static String dropTableFilterCategory =
      'DROP TABLE IF EXISTS FilterCategory;';
  static String createTableFilterCategory = 'CREATE TABLE FilterCategory ('
      'category STRING  PRIMARY KEY UNIQUE NOT NULL, '
      'orderCategory INTEGER ,'
      'categoryValue INTEGER NOT NULL DEFAULT (1)'
      ');';

  static Map<String, String> insertValueFilterCategory = {
    'hotel':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("hotel",0);',
    'restaurant':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("restaurant",1);',
    'particularPlace':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("particularPlace",2);',
    'park':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("park",3);',
    'museum':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("museum",4);',
    'cafe':
        'INSERT INTO [FilterCategory] (category, orderCategory) VALUES ("cafe",5);',
  };

  static String dropTableFilterDistance =
      'DROP TABLE IF EXISTS FilterDistance;';
  static String createTableFilterDistance = 'CREATE TABLE FilterDistance ('
      'distanceCode INTEGER PRIMARY KEY UNIQUE NOT NULL DEFAULT (1), '
      'distanceStart STRING DEFAULT (100), '
      'distanceEnd STRING DEFAULT (1000)'
      ');';

  static Map<int, String> insertValueFilterDistance = {
    1: 'INSERT INTO [FilterDistance] (distanceCode) VALUES (1);',
  };

  static String dropTableSettingsApp = 'DROP TABLE IF EXISTS SettingsApp;';
  static String createTableSettingsApp = 'CREATE TABLE SettingsApp ('
      'settingsName STRING PRIMARY KEY UNIQUE NOT NULL , '
      'settingsValue STRING NOT NULL '
      ');';

  static Map<String, String> insertValueSettingsApp = {
    'SettingTheme': 'INSERT INTO [SettingsApp] '
        '(settingsName,settingsValue) VALUES ("themes","0");',
  };
}
