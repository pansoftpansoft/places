import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences
///функции для доступа
class SPProvider {
  ///Ключи значений
  static const _listFilterCategory = 'listFilterCategory';
  static const _distanceStart = 'distanceStart';
  static const _distanceEnd = 'distanceEnd';
  static const _keyThemeColor = 'keyThemeColor';
  static const _keyShowTutorial = 'keyShowTutorial';
  static late SharedPreferences? _prefs;

  static Future<int?> getThemeColor() async {
    final param = await getFromSP<int>(_keyThemeColor);

    return param;
  }

  static Future<void> updateThemeColor(int themeData) async {
    await updateInSP<int>(
      _keyThemeColor,
      themeData,
    );
  }

  static Future<bool?> getShowOnboarding() async {
    final param = await getFromSP<bool>(_keyShowTutorial);

    return param;
  }

  static Future<void> updateShowOnboarding() async {
    await updateInSP<bool>(
      _keyShowTutorial,
      true,
    );
  }

  static Future<List<String>?> getListFilter() {
    final param = getFromSP<List<String>>(_listFilterCategory);

    return param;
  }

  static Future<double?> getDistanceStart() {
    final param = getFromSP<double>(_distanceStart);

    return param;
  }

  static Future<double?> getDistanceEnd() {
    final param = getFromSP<double>(_distanceEnd);

    return param;
  }


  ///Получение данных из SharedPreferences
  static Future<T?> getFromSP<T>(String keyValue) async {
    await _initPrefs();

    T? value;

    if (value is String) {
      value = (_prefs!.getString(keyValue) ?? '') as T;
    }

    if (value is int) {
      value = (_prefs?.getInt(keyValue) ?? 0) as T;
    }

    if (value is bool) {
      value = (_prefs?.getBool(keyValue) ?? false) as T;
    }

    if (value is List<String>) {
      value = (_prefs?.getStringList(keyValue) ?? <String>[]) as T;
    }

    return value;
  }

  ///Обновление данных в SharedPreferences
  static Future<void> updateInSP<T>(
    String keyValue,
    T value,
  ) async {
    await _initPrefs();

    if (value is String) {
      await _prefs!.setString(keyValue, value);
    }

    if (value is int) {
      await _prefs!.setInt(keyValue, value);
    }

    if (value is double) {
      await _prefs!.setDouble(keyValue, value);
    }

    if (value is bool) {
      await _prefs!.setBool(keyValue, value);
    }

    if (value is List<String>) {
      await _prefs!.setStringList(keyValue, value);
    }
  }

  static Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
