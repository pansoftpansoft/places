// ignore_for_file: cascade_invocations

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/api/api_urls.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/place_filter_request_dto.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/main.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';

final repositoryMocks = <Place>[];

///--------------------------------------------------------------
/// Слой получения данных
class PlaceRepository {
  /// ---------------------------------------------------------------
  /// Создать новое место на сервере
  static Future<Response> postPlace(Place place) async {
    try {
      return apiClient.post(
        pathUrlCreatePlace,
        place.toJson().toString(),
      );
    } on DioError catch (e) {
      NetworkException.showErrorScreen();
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получаем список всех мест
  static Future<List<Place>> getAllPlace() async {
    try {
      final placesLocalData = await DBProvider.dbProvider.getPlacesLocal();
      final listPlaceAll = ((await apiClient.get(pathUrlListPlaces)).data
              as List)
          // ignore: avoid_annotating_with_dynamic
          .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
          .toList();

      for (final placeOne in listPlaceAll) {
        if (placesLocalData.isNotEmpty) {
          for (final placesLocalDataElement in placesLocalData) {
            if (placesLocalDataElement.id == placeOne.id) {
              placeOne.isFavorites =
                  // ignore: avoid_bool_literals_in_conditional_expressions
                  placesLocalDataElement.isFavorites == 1 ? true : false;
              placeOne.wantVisitDate =
                  placesLocalDataElement.wantVisitDate == null
                      ? null
                      : placesLocalDataElement.wantVisitDateToDatetime();

              debugPrint(
                'placesLocalDataElement.visitedDate = ${placesLocalDataElement.visitedDate}',
              );
              placeOne.visitedDate = placesLocalDataElement.visitedDate == 0
                  ? null
                  : placesLocalDataElement.visitedDateToDatetime();
            }
          }
        }
      }

      return listPlaceAll;
    } on DioError catch (e) {
      NetworkException.showErrorScreen();
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  static Future<List<Place>> getPlacesRepository({
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  }) async {
    placesDtoFilter = await getPlacesDto(radiusRange, category, searchString);
    await createMocks(placesDtoFilter);
    debugPrint('repositoryMocks.length = ${repositoryMocks.length}');

    return repositoryMocks;
  }

  static Future<List<Place>?> updateMocksFiltered() async {
    await createMocks(placesDtoFilter);

    return repositoryMocks;
  }

  static Future<List<Place>> getPlacesWantVisit(
    List<Place> listAllPlaces,
  ) async {
    final returnListWantVisit = listAllPlaces
        .where((element) => element.visitedDate == null && element.isFavorites)
        .toList();

    return returnListWantVisit;
  }

  static Future<List<Place>> getPlacesVisited(List<Place> listAllPlaces) async {
    final returnListVisited =
        listAllPlaces.where((element) => element.visitedDate != null).toList();

    return returnListVisited;
  }

  ///--------------------------------------------------------------
  /// получить объедененный список DTO и LOCAL
  static Future<Stream<Place>> createMocks(List<PlaceDto> placesDto) async {
    repositoryMocks.clear();
    final placesLocalData = await DBProvider.dbProvider.getPlacesLocal();
    bool? isFavorites = false;
    debugPrint('Теперь циклы');
    DateTime? wantVisitDate;
    DateTime? visitedDate;
    debugPrint('placesDto = ${placesDtoFilter.length}');
    for (final placeDto in placesDto) {
      isFavorites = false;
      wantVisitDate = null;
      visitedDate = null;
      if (placesLocalData.isNotEmpty) {
        for (final placesLocalDataElement in placesLocalData) {
          if (placesLocalDataElement.id == placeDto.id) {
            isFavorites = placesLocalDataElement.isFavorites == 1;
            wantVisitDate = placesLocalDataElement.wantVisitDate == null
                ? null
                : placesLocalDataElement.wantVisitDateToDatetime();

            visitedDate = placesLocalDataElement.visitedDate == 0
                ? null
                : placesLocalDataElement.visitedDateToDatetime();
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
      repositoryMocks.add(place);
      debugPrint('place.name = ${place.name}');
      ListPlacesScreenModel.streamControllerListPlace.sink.add(
        place,
      );
    }

    return ListPlacesScreenModel.streamControllerListPlace.stream;
  }

  ///--------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  static Future<List<PlaceDto>> getPlacesDto(
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  ) async {
    try {
      // Создаем фильтр
      final filterJson = createFilter(
        radiusRange: radiusRange,
        category: category,
        searchString: searchString,
      );

      final response = await apiClient.post(
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
    } on DioError catch (e) {
      NetworkException.showErrorScreen();
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получить место по идентификатору
  static Future<Place> getPlaceId(int placeId) async {
    try {
      String mapString;

      //debugPrint('Получить место по иденитификатору placeId = ${placeId}');
      final response = await apiClient.get('$pathUrlListPlaces/$placeId');

      mapString = response.toString();

      debugPrint('mapString = $mapString');

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
    } on DioError catch (e) {
      NetworkException.showErrorScreen();
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Создаем JSON фильтр
  static String createFilter({
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  }) {
    debugPrint('category = ${category.toString()}');
    // Текущие координаты
    const lat = 55.753605;
    const lon = 37.619773;
    final radius = radiusRange == null ? 10000 : radiusRange.end;
    final typeFilter = category ?? <String>[];

    final filterJson = PlaceFilterRequestDto(
      // Текущее местоположение телефона
      lat: lat,
      lon: lon,
      radius: radius,
      typeFilter: typeFilter,
      nameFilter: searchString,
    ).toJson();

    debugPrint('filterJson = $filterJson');

    return filterJson;
  }

  ///--------------------------------------------------------------
  /// Установить что место посетили
  static Future<void> updatePlaceLocalDB(Place place) async {
    debugPrint('place id = ${place.id}  '
        'isFavorites  = ${place.isFavorites}  '
        'wantVisitDate  = ${place.wantVisitDate}  '
        'visitedDate  = ${place.visitedDate}');
    final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
      place,
    );
    debugPrint('updatePlaceLocalDB количество обновленных мест = $countUpdate');
  }

  ///--------------------------------------------------------------
  /// Удалить место на сервере
  Future<Response> deletePlace(Place place) async {
    try {
      return apiClient.delete(
        '$pathUrlDeletePlace/${place.id.toString()}',
      );
    } on DioError catch (e) {
      NetworkException.showErrorScreen();
      throw NetworkException(e);
    }
  }
}
