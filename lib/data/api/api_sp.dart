import 'package:shared_preferences/shared_preferences.dart';

///ApiSharedPreferences
class ApiSP {
  static late SharedPreferences? _prefs;

  ///Получение данных из SharedPreferences
  static Future<T?> getFromSP<T>(String keyValue) async {
    await _initPrefs();

    T? value;

    if (value is String) {
      value = (_prefs?.getString(keyValue) ?? '') as T;
    }

    if (value is int) {
      value = (_prefs?.getInt(keyValue) ?? 0) as T;
    }

    if (value is bool) {
      value = (_prefs?.getBool(keyValue) ?? false) as T;
    }

    if (value is double) {
      value = (_prefs?.getDouble(keyValue) ?? 0.0) as T;
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

  ///Инициализация SharedPreferences
  static Future<void> _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }
}
