

/// Класс места
class Place {
  ///ид достопримечательности
  final int id;

  ///координаты места
  final double lat;

  ///координаты места
  final double lon;

  ///название достопримечательности
  final String name;

  ///список фоток
  final List<String> urls;

  //TODO исправить тип placeType со String на TypePlace
  ///тип места.
  final String placeType;

  /// Тип описание
  final String description;

  /// Признак того что место добавлено в избранное
  bool? isFavorites;

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
  });

  /// парсинг из json
  Place.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int,
        lat = json['lat'] as double,
        lon = json['lng'] as double,
        name = json['name'] as String,
        urls = (json['urls'] as List<dynamic>).whereType<String>().toList(),
        placeType = json['placeType'] as String,
        description = json['description'] as String;

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
