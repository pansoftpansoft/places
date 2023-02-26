import 'package:shared_preferences/shared_preferences.dart';

///SharedPreferences
///функции для доступа
class SPProvider {
  static const String _keyThemeColor = 'keyThemeColor';
  static late SharedPreferences? _prefs;

  static Future<int?> getThemeColor() async {
    final param = await getFromSP<int>(_keyThemeColor);

    return param;
  }

  static Future<void> updateThemeColorInSP(int themeData) async {
    await updateInSP<int>(
      _keyThemeColor,
      themeData,
    );
  }

  ///Получение данных из SharedPreferences
  static Future<T?> getFromSP<T>(String keyValue) async {
    await _initPrefs();

    T value;

    if (T == String) {
      value = _prefs!.getString(keyValue) as T;

      return value;
    }

    if (T == int) {
      value = _prefs!.getInt(keyValue) as T;

      return value;
    }

    if (T == bool) {
      value = _prefs!.getBool(keyValue) as T;

      return value;
    }

    if (T == List<String>) {
      value = _prefs!.getBool(keyValue) as T;

      return value;
    }

    return null;
  }

  ///Обновление данных в SharedPreferences
  static Future<void> updateInSP<T>(
    String keyValue,
    T value,
  ) async {
    await _initPrefs();

    if (T == String) {
      await _prefs!.setString(keyValue, value as String);
    }

    if (T == int) {
      await _prefs!.setInt(keyValue, value as int);
    }

    if (T == double) {
      await _prefs!.setDouble(keyValue, value as double);
    }

    if (T == bool) {
      await _prefs!.setBool(keyValue, value as bool);
    }

    if (T == List<String>) {
      await _prefs!.setStringList(keyValue, value as List<String>);
    }
  }

  static Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
