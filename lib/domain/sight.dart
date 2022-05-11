import 'package:places/type_place.dart';

/// Класс места
class Sight {
  ///ид достопримечательности
  final int id;

  /// Координаты места
  final double lat;

  /// Координаты места
  final double lon;

  /// Название достопримечательности
  final String name;

  /// Пути до фотографии в интернете
  final List<String> urls;

  /// Тип достопримечательности.
  final String placeType;

  /// Описание достопримечательности
  final String details;

  /// Дата когда хочу посетить место
  DateTime? wantVisitDate;

  /// Дата когда посетил
  DateTime? visitedDate;

  /// Отображать в списке после поиска и фильтрации.
  bool visibleFilter = false;

  /// Фотограции места
  List<String> photoPlace = <String>[];

  ///
  Sight(
    this.id,
    this.lat,
    this.lon,
    this.name,
    this.urls,
    this.placeType,
    this.details, {
    this.wantVisitDate,
    this.visitedDate,
  });
}
