/// Класс места
class Place111 {
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

  /// Описание достопримечательности
  final String description;

  /// Признак того что место добавлено в избранное
  bool? isFavorites;

  /// Дата когда хочу посетить место
  DateTime? wantVisitDate;

  /// Дата когда посетил
  DateTime? visitedDate;

  /// Отображать в списке после поиска и фильтрации.
  bool visibleFilter = false;

  // /// Фотограции места
  // List<String> photoPlace = <String>[];

  ///
  Place111(
    this.id,
    this.lat,
    this.lon,
    this.name,
    this.urls,
    this.placeType,
    this.description, {
    this.wantVisitDate,
    this.visitedDate,
  });
}
