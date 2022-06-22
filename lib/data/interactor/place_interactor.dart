import 'dart:math';

import 'package:flutter/material.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/type_place.dart';

/// Слой бизнес логики
class PlaceInteractor {
  /// Временный список хранения данных полученных из сети,
  /// пото хранить будем в базе данных

  static PlaceRepository? placeRepository;

  // /// Получить список отфильтрованных мест
  // static Future<List<Place>?> getAllPlaces() async {
  //   mocksFiltered = await PlaceRepository.getAllPlace();
  //
  //   return mocksFiltered;
  // }

  /// Получить настройки фильтра категории
  static Future<List<FilterCategory>?> getSettingsFilterCategory() async {
    final listFilter = await PlaceRepository.getListFilterCategory();

    return listFilter;
  }

  /// Получить настройки фильтра дистанции до места
  static Future<List<FilterDistance>?> getSettingsFilterDistance() async {
    final listFilter = await PlaceRepository.getListFilterDistance();

    return listFilter;
  }

  ///--------------------------------------------------------------
  /// Обновить список настроек фильтра
  static Future<void> updateListFilterCategory(
      List<FilterCategory> listFilter,) async {
    for (final item in listFilter) {
      await PlaceRepository.updateFilterCategory(item);
    }
  }

  ///--------------------------------------------------------------
  /// Обновить список настроек фильтра дистанции
  static Future<void> updateListFilterDistance(
      List<FilterDistance> listFilter,) async {
    for (final item in listFilter) {
      await PlaceRepository.updateFilterDistance(item);
    }
  }

  ///--------------------------------------------------------------
  /// Получить список отфильтрованных мест
  static Future<List<Place>?> getPlacesInteractor({
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  }) async {
    final mocksFromRepository = await PlaceRepository.getPlacesRepository(
      radiusRange: radiusRange,
      category: category,
      searchString: searchString,
    );

    return mocksFromRepository;
  }

  /// Фильтрация списка по категории
  static List<Place> filterListPlacesCategory(
    List<Place> placeList,
    List<String> category,
  ) {
    final listPlaceFiltered =
        placeList.where((place) => category.contains(place.placeType)).toList();

    return listPlaceFiltered;
  }

  static Future<Place?> getPlaceDetails(int placeId) async {
    return PlaceRepository.getPlaceId(placeId);
  }

  /// Установка месту избранное или нет
  static Future<void> setFavorites(Place place) async {
    // Пробуем обновить место

    if (place.isFavorites) {
      place.isFavorites = false;
      debugPrint('Это кнопка "В избранное" remove');
    } else {
      place.isFavorites = true;
      debugPrint('Это кнопка "В избранное" add');
    }

    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await DBProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await DBProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }

    debugPrint('place id = ${place.id} isFavorites = ${place.isFavorites}');

    await getListWantVisitAndVisited();
  }

  ///-----------------------------------------------
  /// Отметить место как посещенное
  static Future<void> addToVisitingPlaces(Place place) async {
    await PlaceRepository.postPlace(place);
    for (final element in mocks) {
      if (element.id == place.id) {
        element.visitedDate = DateTime.now();
      }
    }
    await getListWantVisitAndVisited();
  }

  ///-----------------------------------------------
  /// Добавить место в посещенные
  static Future<void> setStatusPlaceVisited(Place place) async {
    place.visitedDate = place.visitedDate == null ? DateTime.now() : null;

    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await DBProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await DBProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }
    // проверяем есть токое место в лакальной базе, если нет добавляем.
    // final addInLocalDB1 = await DBProvider.dbProvider.checkPlacesInLocalDataId(
    //   place.id,
    // );
    debugPrint('place id = ${place.id} isFavorites = ${place.visitedDate}');

    await getListWantVisitAndVisited();
  }

  static Future<void> getListWantVisitAndVisited() async {
    final listAllPlace = await PlaceRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await PlaceRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');

    mocksVisited = await PlaceRepository.getPlacesVisited(listAllPlace);
  }

  /// Получить список избранных мест, отсортированных по удаленности
  Future<List<Place>> getFavoritesPlaces() async {
    return mocks.where((element) => element.isFavorites).toList()
      ..sort((a, b) => _distanceCalculate(a).compareTo(_distanceCalculate(b)));
  }

  /// Дистанция до объекта от точки
  static double _distanceCalculate(Place place) {
    //TODO Здесь необходимо получить свои координаты
    const centerPointLat = 55.753605;
    const centerPointLon = 37.619773;

    const kyPoint = 40000000 / 360; //40000000 - длина окружности земли в метрах
    final kxPoint = cos(pi * centerPointLat / 180.0) * kyPoint;
    final dxPoint = (centerPointLon - place.lon).abs() * kxPoint;
    final dyPoint = (centerPointLat - place.lat).abs() * kyPoint;

    return sqrt(dxPoint * dxPoint + dyPoint * dyPoint);
  }
}
