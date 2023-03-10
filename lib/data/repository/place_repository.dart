// ignore_for_file: cascade_invocations

import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:places/data/api/api_urls.dart';
import 'package:places/data/api/network_exception.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/model/place_dto.dart';
import 'package:places/data/model/place_filter_request_dto.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/main.dart';
import 'package:places/type_place.dart';

final repositoryMocks = <Place>[];

///--------------------------------------------------------------
/// Слой получения данных
class PlaceRepository{
  /// ---------------------------------------------------------------
  /// Создать новое место на сервере
  Future<Place?> postPlace(
    Place place,
  ) async {
    try {
      final response = await apiClient.post(
        pathUrlCreatePlace,
        json.encode(place.toJson()),
      );

      switch (response.statusCode) {
        case 200:
          {
            return Place.fromJson(response.data as Map<String, dynamic>);
          }
        case 400:
          {
            throw CustomException400();
          }
        case 409:
          {
            throw CustomException409();
          }
      }

      return Place.fromJson(response.data as Map<String, dynamic>);
    } on DioError catch (e) {
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получаем список всех мест
  Future<List<Place>> getAllPlace() async {
    try {
      final placesLocalData = await DBProvider.dbProvider.getPlacesLocal();
      final listPlaceAll = ((await apiClient.get(pathUrlListPlaces)).data
              as List)
          // ignore: avoid_annotating_with_dynamic
          .map<Place>((dynamic e) => Place.fromJson(e as Map<String, dynamic>))
          .toList();

      var count = 0;
      for (final placeOne in listPlaceAll) {
        if (placesLocalData.isNotEmpty) {
          for (final placesLocalDataElement in placesLocalData) {
            if (placesLocalDataElement.id == placeOne.id) {
              listPlaceAll[count] = placeOne.copyWith(
                isFavorites: placesLocalDataElement.isFavorites == 1,
                wantVisitDate: placesLocalDataElement.wantVisitDate == null
                    ? null
                    : placesLocalDataElement.wantVisitDateToDatetime(),
                visitedDate: placesLocalDataElement.visitedDate == 0
                    ? null
                    : placesLocalDataElement.visitedDateToDatetime(),
              );
            }
          }
        }
        count++;
      }

      return listPlaceAll;
    } on DioError catch (e) {
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  Future<List<Place>> getPlacesRepository({
    FilterSet? filterSet,
    String? searchString,
  }) async {
    placesDtoFilter = await getPlacesDto(
      filterSet,
      searchString,
    );
    await createMocks(placesDtoFilter);

    mocksFiltered = repositoryMocks;

    return repositoryMocks;
  }

  Future<List<Place>?> updateMocksFiltered() async {
    return repositoryMocks;
  }

  Future<List<Place>> getPlacesWantVisit(
    List<Place> listAllPlaces,
  ) async {
    final returnListWantVisit =
        listAllPlaces.where((element) => element.isFavorites).toList();

    return returnListWantVisit;
  }

  Future<List<Place>> getPlacesVisited(List<Place> listAllPlaces) async {
    final returnListVisited =
        listAllPlaces.where((element) => element.visitedDate != null).toList();

    return returnListVisited;
  }

  ///--------------------------------------------------------------
  /// получить объедененный список DTO и LOCAL
  Future<void> createMocks(
    List<PlaceDto> placesDto,
  ) async {
    repositoryMocks.clear();
    final placesLocalData = await DBProvider.dbProvider.getPlacesLocal();
    bool? isFavorites = false;
    DateTime? wantVisitDate;
    DateTime? visitedDate;
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
        lng: placeDto.lon,
        name: placeDto.name,
        urls: placeDto.urls,
        placeType: placeDto.placeType,
        description: placeDto.description,
        isFavorites: isFavorites ?? false,
        wantVisitDate: wantVisitDate,
        visitedDate: visitedDate,
      );
      repositoryMocks.add(place);
    }

    return;
  }

  ///--------------------------------------------------------------
  /// Получаем список отфильтрованных мест с сервера
  Future<List<PlaceDto>> getPlacesDto(
    FilterSet? filterSet,
    String? searchString,
  ) async {
    try {
      // Создаем фильтр
      final filterJson = createFilter(
        filterSet: filterSet,
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
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Получить место по идентификатору
  Future<Place> getPlaceId(
    int placeId,
  ) async {
    try {
      String mapString;
      Place placeReturn;

      final response = await apiClient.get('$pathUrlListPlaces/$placeId');

      mapString = response.toString();

      final mapFull = json.decode(mapString) as Map<String, dynamic>;

      //Добавим значения из локальной базы данных
      final place = Place.fromJson(mapFull);

      final placeLocalData = await DBProvider.dbProvider.getPlacesLocalDataId(
        place.id,
      );

      placeReturn = place;
      if (placeLocalData != null) {
        //place.id =  placeLocalData.id;
        debugPrint(placeLocalData.isFavorites.toString());
        debugPrint(placeLocalData
            .isFavoritesToBool(placeLocalData.isFavorites)
            .toString());

        placeReturn = place.copyWith(
          isFavorites:
              placeLocalData.isFavoritesToBool(placeLocalData.isFavorites),
          wantVisitDate: placeLocalData.wantVisitDateToDatetime(),
          visitedDate: placeLocalData.visitedDateToDatetime(),
        );
      }

      debugPrint(placeReturn.toString());

      return placeReturn;
    } on DioError catch (e) {
      throw NetworkException(e);
    }
  }

  ///--------------------------------------------------------------
  /// Создаем JSON фильтр
  String createFilter({
    FilterSet? filterSet,
    String? searchString,
  }) {
    // Текущие координаты
    const lat = 55.753605;
    const lon = 37.619773;
    final radius = filterSet == null ? 10000 : filterSet.rangeDistance.end;
    final typeFilter =
        filterSet == null ? <String>[] : filterSet.selectedCategory.toList();

    final filterJson = PlaceFilterRequestDto(
      // Текущее местоположение телефона
      lat: lat,
      lon: lon,
      radius: radius,
      typeFilter: typeFilter,
      nameFilter: searchString,
    ).toJson();

    return filterJson;
  }

  ///--------------------------------------------------------------
  /// Установить что место посетили
  Future<void> updatePlaceLocalDB(Place place) async {
    final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
      place,
    );
  }

  ///--------------------------------------------------------------
  /// Удалить место на сервере
  Future<Response> deletePlace(
    Place place,
    StreamController<Place> streamControllerListPlace,
  ) async {
    try {
      return apiClient.delete(
        '$pathUrlDeletePlace/${place.id.toString()}',
      );
    } on DioError catch (e) {
      streamControllerListPlace.addError(NetworkException);
      throw NetworkException(e);
    }
  }
}

class CustomException400 implements Exception {
  String errMsg() => '400';
}

class CustomException409 implements Exception {
  String errMsg() => '409';
}
