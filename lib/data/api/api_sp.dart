import 'package:shared_preferences/shared_preferences.dart';

///ApiSharedPreferences
class ApiSP {
  static late SharedPreferences? _prefs;

  ///Получение данных из SharedPreferences
  static Future<T?> getFromSP<T>(String keyValue) async {
    await _initPrefs();

    T? value;

    if (T == String) {
      value = (_prefs?.getString(keyValue) ?? '') as T;
    }

    if (T == int) {
      value = (_prefs?.getInt(keyValue) ?? 0) as T;
    }

    if (T == bool) {
      value = (_prefs?.getBool(keyValue) ?? false) as T;
    }

    if (T == double) {
      value = (_prefs?.getDouble(keyValue) ?? 0.0) as T;
    }

    if (T == List<String>) {
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
