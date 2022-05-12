import 'dart:math';
import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';

class PlaceInteractor {
  /// Временный список хранения данных полученных из сети,
  /// пото хранить будем в базе данных
  static List<Place> placeFromNet = [];

  static PlaceRepository? placeRepository;

  /// Получить список отфильтрованных мест
  static Future<List<Place>?> getPlaces({
    RangeValues? radius,
    List<String>? category,
  }) async {
    placeFromNet = await PlaceRepository.getPlace();

    placeFromNet = await getPlacesFiltered(
      placeFromNet,
      radius: radius,
      category: category,
    );

    return placeFromNet;
  }

  /// Добавить новое место
  static void addToVisitingPlaces(Place place) {
    PlaceRepository.postPlace(place);
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
    listPlaceFiltered = listPlace.isEmpty ? placeFromNet : listPlace;

    //Фильтруем места по радиусу
    if (radius != null) {
      listPlaceFiltered = filterListPlacesRadius(listPlace, radius);
    }
    //Фильтруем места по категории
    if (category != null) {
      listPlaceFiltered = filterListPlacesCategory(listPlaceFiltered, category);
    }

    /// Запишем в локальную очередь
    placeFromNet = listPlaceFiltered;

    return listPlaceFiltered;
  }

  static Future<Place?> getPlaceDetails(Place place) async {
    return PlaceRepository.getPlaceId(place);
  }

  /// Получить список избранных мест, отсортированных по удаленности
  Future<List<Place>> getFavoritesPlaces() async {
    return placeFromNet
        .where((element) => element.isFavorites ?? false)
        .toList()
      ..sort((a, b) => _distanceCalculate(a).compareTo(_distanceCalculate(b)));
  }

  /// Добавит место в избранные
  void addToFavorites(Place place) {
    for (final element in placeFromNet) {
      if (element.id == place.id) {
        element.isFavorites = true;
      }
    }
  }

  /// Удалить место в избранные
  void removeFromFavorites(Place place) {
    for (final element in placeFromNet) {
      if (element.id == place.id) {
        element.isFavorites = false;
      }
    }
  }

  /// Получить список мест которые уже посетили
  Future<List<Place>> getVisitPlaces() async {
    return placeFromNet
        // ignore: avoid_bool_literals_in_conditional_expressions
        .where((element) => element.visitedDate == null ? false : true)
        .toList();
  }

  /// Добавить место в посещенные
  void addNewPlace(Place place) {
    for (final element in placeFromNet) {
      if (element.id == place.id) {
        element.visitedDate = DateTime.now();
      }
    }
  }

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

  /// Дистанция до объекта
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
