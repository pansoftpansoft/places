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

  /// Получить список отфильтрованных мест
  static Future<List<Place>?> getAllPlaces() async {
    mocksFiltered = await PlaceRepository.getAllPlace();

    return mocksFiltered;
  }

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
  /// Обновить список настроик фильтра
  static Future<void> updateListFilterCategory(List<FilterCategory> listFilter) async {
    for (final item in listFilter) {
      await PlaceRepository.updateFilterCategory(item);
    }
  }

  ///--------------------------------------------------------------
  /// Обновить список настроик фильтра
  static Future<void> updateListFilterDistance(List<FilterDistance> listFilter) async {
    for (final item in listFilter) {
      await PlaceRepository.updateFilterDistance(item);
    }
  }

  /// Получить список отфильтрованных мест
  static Future<List<Place>?> getPlaces({
    RangeValues? radiusRange,
    List<String>? category,
  }) async {
    await PlaceRepository.getPlaces(
      radiusRange: radiusRange,
      category: category,
    );

    ///TODO
    mocksFiltered = mocks; //await PlaceRepository.getPlaces(radius, category);

    return mocksFiltered;
  }

  /// Фильтрация списка по  радиусу
  static List<Place> filterListPlacesRadius(
    List<Place> placeList,
    RangeValues radius,
  ) {
    final listPlaceFiltered =
        placeList.where((element) => _arePointsNear(element, radius)).toList();

    return listPlaceFiltered;
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

  /// Получить список отфильтрованных мест
  static Future<List<Place>> getPlacesFiltered(
    List<Place> listPlace, {
    RangeValues? radius,
    List<String>? category,
  }) async {
    List<Place> listPlaceFiltered;
    //Проверка на пустой список
    listPlaceFiltered = listPlace.isEmpty ? mocks : listPlace;

    //Фильтруем места по радиусу
    if (radius != null) {
      listPlaceFiltered = filterListPlacesRadius(listPlace, radius);
    }
    //Фильтруем места по категории
    if (category != null) {
      listPlaceFiltered = filterListPlacesCategory(listPlaceFiltered, category);
    }

    /// Запишем в локальную очередь
    mocks = listPlaceFiltered;

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

    await updateAllList(place);
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
    await updateAllList(place);
  }

  ///-----------------------------------------------
  /// Добавить место в посещенные
  static Future<void> updateStatusThePlaceVisited(Place place) async {
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

    await updateAllList(place);
  }

  static Future<void> updateAllList(Place place) async {
    await createListMocksFromLocalDB();
    updateListMocksFilteredFromLocalDB(place);
    createListVisitedFromLocalDB();
    createListWantVisitFromLocalDB();
  }

  static void createListVisitedFromLocalDB() {
    mocksVisited =
        mocks.where((element) => element.visitedDate != null).toList();
  }

  static Future<void> createListMocksFromLocalDB() async {
    await PlaceRepository.createMocks();
  }

  /// Создать список для экрана Хочу посетить
  static void createListWantVisitFromLocalDB() {
    mocksWantVisit = mocks
        .where((element) => element.visitedDate == null && element.isFavorites)
        .toList();
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');
  }

  static void updateListMocksFilteredFromLocalDB(Place place) {
    mocksFiltered.where((element) => element.id == place.id).map((e) => place);
  }

  /// Получить список избранных мест, отсортированных по удаленности
  Future<List<Place>> getFavoritesPlaces() async {
    return mocks.where((element) => element.isFavorites).toList()
      ..sort((a, b) => _distanceCalculate(a).compareTo(_distanceCalculate(b)));
  }

  /// Получить список мест которые уже посетили
  Future<List<Place>> getVisitPlaces() async {
    return mocks
        // ignore: avoid_bool_literals_in_conditional_expressions
        .where((element) => element.visitedDate == null ? false : true)
        .toList();
  }

  /// Вхождение места в площаь между двумя радиусами
  static bool _arePointsNear(Place place, RangeValues rangeValues) {
    //TODO Здесь необходимо получить свои координаты
    const centerPointLat = 55.753605;
    const centerPointLon = 37.619773;

    const kyPoint = 40000000 / 360; //40000000 - длина окружности земли в метрах
    final kxPoint = cos(pi * centerPointLat / 180.0) * kyPoint;
    final dxPoint = (centerPointLon - place.lon).abs() * kxPoint;
    final dyPoint = (centerPointLat - place.lat).abs() * kyPoint;

    return sqrt(dxPoint * dxPoint + dyPoint * dyPoint) <= rangeValues.end &&
        sqrt(dxPoint * dxPoint + dyPoint * dyPoint) >= rangeValues.start;
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
