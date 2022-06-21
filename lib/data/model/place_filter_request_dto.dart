import 'dart:convert';

/// Класс места
class PlaceFilterRequestDto {
  /// Координаты места
  final num lat;

  /// Координаты места
  final num lon;

  /// Растояние до точки
  final num radius;

  /// Список типов мест для фильтрации
  final List<String> typeFilter;

  /// Строка для фильтрации по названию
  final String? nameFilter;

  /// Конструктор
  PlaceFilterRequestDto({
    this.lat = 0,
    this.lon = 0,
    this.radius = 0,
    this.typeFilter = const <String>[],
    this.nameFilter,
  });

  /// Парсинг из json
  PlaceFilterRequestDto.fromJson(
    Map<String, dynamic> json,
  )   : lat = json['lat'] as double,
        lon = json['lng'] as double,
        radius = json['radius'] as double,
        typeFilter =
            (json['typeFilter'] as List<dynamic>).whereType<String>().toList(),
        nameFilter = json['nameFilter'] as String;

  /// создание мапы для добавление в json
  String toJson() {
    final returnMap = <String, dynamic>{};

    if (radius>0) {
      returnMap['lat'] = lat;
      returnMap['lng'] = lon;
      returnMap['radius'] = radius+0.1;
    }

    if (typeFilter.isNotEmpty) {
      returnMap['typeFilter'] = typeFilter;
    }

    if ((nameFilter??'').isNotEmpty) {
      returnMap['nameFilter'] = nameFilter;
    }


    return jsonEncode(returnMap);
  }
}
