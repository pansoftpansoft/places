import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/connection_backend_server.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/place_filter_request_dto.dart';
import 'package:places/domain/db_provider.dart';

import 'package:places/ui/res/url_path.dart';

int iii = 0;

/// Слой получения данных
class PlaceRepository {
  static final ConnectionBackendServer _server = ConnectionBackendServer();

  /// ---------------------------------------------------------------
  /// Создать новое место на сервере
  /// ---------------------------------------------------------------
  static Future<Response> postPlace(Place place) async {
    return _server.post(
      pathUrlCreatePlace,
      place.toJson().toString(),
    );
  }

  /// ---------------------------------------------------------------
  /// Получаем список всех мест
  /// ---------------------------------------------------------------
  static Future<List<Place>> getAllPlace() async {
    return ((await _server.get(pathUrlListPlaces)).data as List)
        // ignore: avoid_annotating_with_dynamic
        .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  /// ---------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  /// ---------------------------------------------------------------
  static Future<List<Place>> getPlaces(
    RangeValues? radiusRange,
    List<String>? category,
  ) async {
    final places = <Place>[];

    final placesDto = await getPlacesDto(radiusRange, category);

    final placesLocalData = await DBProvider.dbProvider.getPlacesLocal();

    bool? isFavorites = false;

    DateTime? wantVisitDate;
    DateTime? visitedDate;
    for (final placeDto in placesDto) {
      if (placesLocalData.isNotEmpty) {
        for (final placesLocalDataElement in placesLocalData) {
          if (placesLocalDataElement.id == placeDto.id) {
            isFavorites =
                // ignore: avoid_bool_literals_in_conditional_expressions
                placesLocalDataElement.isFavorites == 1 ? true : false;
            wantVisitDate = placesLocalDataElement.wantVisitDate == null
                ? null
                : placesLocalDataElement.wantVisitDateToDatetime();

            visitedDate = placesLocalDataElement.visitedDate == null
                ? null
                : placesLocalDataElement.visitedDateToDatetime();
          } else {
            isFavorites = false;
            wantVisitDate = null;
            visitedDate = null;
          }
        }
      }

      final place = Place(
        id: placeDto.id,
        lat: placeDto.lat,
        lon: placeDto.lon,
        name: placeDto.name,
        urls: placeDto.urls,
        placeType: placeDto.placeType,
        description: placeDto.description,
        isFavorites: isFavorites ?? false,
        wantVisitDate: wantVisitDate,
        visitedDate: visitedDate,
      );
      places.add(place);
    }

    return places;
  }

  /// ---------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  /// ---------------------------------------------------------------
  static Future<List<PlaceDto>> getPlacesDto(
    RangeValues? radiusRange,
    List<String>? category,
  ) async {
    // Создаем фильтр
    final dynamic filterJson = createFilter(
      radiusRange: radiusRange,
      category: category,
    );

    final response = await _server.post(
      pathUrlFilteredPlaces,
      filterJson,
    );

    final placesDto = (response.data as List)
        // ignore: avoid_annotating_with_dynamic
        .map<PlaceDto>(
          // ignore: avoid_annotating_with_dynamic
          (dynamic e) => PlaceDto.fromJson(e as Map<String, dynamic>),
        )
        .toList();

    return placesDto;
  }

  /// ---------------------------------------------------------------
  /// Получить место по идентификатору
  /// ---------------------------------------------------------------
  static Future<Place> getPlaceId(int placeId) async {
    String mapString;

    //debugPrint('Получить место по иденитификатору placeId = ${placeId}');
    final response = await _server.get('$pathUrlListPlaces/$placeId');

    mapString = response.toString();

    debugPrint('mapString = ${mapString}');

    final mapFull = json.decode(mapString) as Map<String, dynamic>;

    //Добавим значения из локальной базы данных
    final place = Place.fromJson(mapFull);

    final placeLocalData = await DBProvider.dbProvider.getPlacesLocalDataId(
      place.id,
    );

    if (placeLocalData != null) {
      //place.id =  placeLocalData.id;
      place.isFavorites = placeLocalData.isFavoritesToBool();
      place.wantVisitDate = placeLocalData.wantVisitDateToDatetime();
      place.visitedDate = placeLocalData.visitedDateToDatetime();
    }
    return place;
  }

  /// ---------------------------------------------------------------
  /// Создаем JSON фильтр
  /// ---------------------------------------------------------------
  static dynamic createFilter({
    RangeValues? radiusRange,
    List<String>? category,
  }) {
    // Текущие координаты
    const double? lat = null;
    const double? lon = null;
    final radius = radiusRange?.end;
    //final radius = radiusRange == null ? 0.0 : radiusRange.end;
    //final typeFilter = category ?? <String>[];
    const List<String>? typeFilter = null;
    const String? nameFilter = null;

    final dynamic filterJson = PlaceFilterRequestDto(
      // Текущее местоположение телефона
      lat: lat,
      lon: lon,

      radius: radius,
      typeFilter: typeFilter,
      nameFilter: nameFilter,
    ).toJson();

    return filterJson;
  }

  /// ---------------------------------------------------------------
  /// Удалить место на сервере
  /// ---------------------------------------------------------------
  Future<Response> deletePlace(Place place) async {
    return _server.delete(
      '$pathUrlDeletePlace/${place.id.toString()}',
    );
  }

  /// ---------------------------------------------------------------
  /// Обновить данные о месте и олучить место по идентификатору
  /// ---------------------------------------------------------------
  Future<Place> putPlace(Place place) async {
    return Place.fromJson(
      await _server.get('$pathUrlPutPlace/${place.id.toString()}')
          as Map<String, dynamic>,
    );
  }
}
