/// Класс места
class PlaceDto {
  /// Id достопримечательности
  final int id;

  /// Координаты места
  final double lat;

  /// Координаты места
  final double lon;

  /// Растояние до точки
  final double distance;

  /// Название достопримечательности
  final String name;

  /// Тип достопримечательности.
  final String placeType;

  /// Тип описание
  final String description;

  /// Пути до фотографиЙ в интернете
  final List<String> urls;

  /// Конструктор
  PlaceDto({
    this.id = 0,
    this.lat = 0,
    this.lon = 0,
    this.distance = 0,
    required this.name,
    this.urls = const <String>[],
    required this.placeType,
    this.description = '',
  });

  /// Парсинг из json
  PlaceDto.fromJson(
    Map<String, dynamic> json,
  )   : id = json['id'] as int,
        lat = json['lat'] as double,
        lon = json['lng'] as double,
        distance = json['lng'] as double,
        name = json['name'] as String,
        urls = (json['urls'] as List<dynamic>).whereType<String>().toList(),
        placeType = json['placeType'] as String,
        description = json['description'] as String;

  /// Создание мапы для добавление в json
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'lat': lat,
        'lon': lon,
        'name': name,
        'urls': urls,
        'placeType': placeType,
        'description': description,
      };
}
