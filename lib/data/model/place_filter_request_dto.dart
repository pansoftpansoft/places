/// Класс места
class PlaceFilterRequestDto {
  /// Координаты места
  final double? lat;

  /// Координаты места
  final double? lon;

  /// Растояние до точки
  final double? radius;

  /// Список типов мест для фильтрации
  final List<String>? typeFilter;

  /// Строка для фильтрации по названию
  final String? nameFilter;

  /// Конструктор
  PlaceFilterRequestDto({
    this.lat = 0,
    this.lon = 0,
    this.radius = 0,
    this.typeFilter = const <String>[],
    this.nameFilter = '',
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
  Map<String, dynamic> toJson() {
    final returnMap = <String, dynamic>{};

    if (lat != null && lon != null && radius != null) {
      returnMap['lat'] = lat;
      returnMap['lon'] = lon;
      returnMap['radius'] = radius;
    }

    if (typeFilter != null) {
      returnMap['typeFilter'] = typeFilter;
    }

    if (nameFilter != null) {
      returnMap['nameFilter'] = nameFilter;
    }

    return returnMap;
  }
}
