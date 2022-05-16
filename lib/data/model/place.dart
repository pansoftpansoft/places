/// Класс места
class Place {
  /// Id достопримечательности
  final int id;

  /// Координаты места
  final double lat;

  /// Координаты места
  final double lon;

  /// Название достопримечательности
  final String name;

  /// Пути до фотографиЙ в интернете
  final List<String> urls;

  /// Тип достопримечательности.
  final String placeType;

  /// Тип описание
  final String description;

  /// Растояние до точки
  final double? distance;

  /// Признак того что место добавлено в избранное
  bool isFavorites = false;

  /// Дата когда хочу посетить место
  DateTime? wantVisitDate;

  /// Дата когда посетил
  DateTime? visitedDate;

  ///отображать в списке после поиска и фильтрации.
  bool visibleFilter = false;

  ///Конструктор
  Place({
    this.id = 0,
    this.lat = 0,
    this.lon = 0,
    required this.name,
    this.urls = const <String>[],
    required this.placeType,
    this.description = '',
    this.wantVisitDate,
    this.visitedDate,
    this.distance,
  });

  /// парсинг из json
  Place.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        lat = json['lat'] as double,
        lon = json['lng'] as double,
        name = json['name'] as String,
        urls = (json['urls'] as List<dynamic>).whereType<String>().toList(),
        placeType = json['placeType'] as String,
        description = json['description'] as String,
        distance = json['distance'] as double;

  /// создание мапы для добавление в json
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
