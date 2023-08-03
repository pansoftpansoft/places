import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';

part 'place.g.dart';

/// Класс места
@freezed
class Place with _$Place {
  /// Id достопримечательности
  //final int id;

  /// Координаты места
  //final double lat;

  /// Координаты места
  //final double lon;

  /// Название достопримечательности
  //final String name;

  /// Пути до фотографиЙ в интернете
  //final List<String> urls;

  /// Тип достопримечательности.
  //final String placeType;

  /// Тип описание
  //final String description;

  /// Растояние до точки
  //final double? distance;

  /// Признак того что место добавлено в избранное
  //final bool isFavorites;

  /// Дата когда хочу посетить место
  //final DateTime? wantVisitDate;

  /// Дата когда посетил
  //final DateTime? visitedDate;

  ///Конструктор
  const factory Place({
    @JsonKey()
    @Default(0) int id,
    @Default(0) double lat,
    @Default(0) double lng,
    @Default('') String name,
    @Default(<String>[]) List<String> urls,
    @Default('') String placeType,
    @Default('') String description,
    @Default(false) bool isFavorites,
    DateTime? wantVisitDate,
    DateTime? visitedDate,
    @Default(0) double distance,
  }) = _Place;

  factory Place.fromJson(Map<String, dynamic> json) => _$PlaceFromJson(json);
}
