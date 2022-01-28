import 'package:places/mocks.dart';

/// Класс места
class Sight {
  ///название достопримечательности
  final String name;

  ///координаты места
  final String lat;

  ///координаты места
  final String lon;

  ///путь до фотографии в интернете
  final String url;

  ///описание достопримечательности
  final String details;

  ///тип достопримечательности.
  final TypePlace type;

  /// Дата когда хочу посетить место
  DateTime? wantVisitDate;

  /// Дата когда посетил
  DateTime? visitedDate;

  ///отображать в списке после поиска и фильтрации.
  bool visibleFilter = false;

  /// Фотограции места
  List<String> photoPlace = <String>[];

  ///
  Sight(
    this.name,
    this.lat,
    this.lon,
    this.url,
    this.details,
    this.type, {
    this.wantVisitDate,
    this.visitedDate,
  });

}
