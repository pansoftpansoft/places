import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/filter_repository.dart';

class FiltersInteractor {
  ///Список истории фильтров

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  //экран то востановим текущие значения

  static List<String> listCategory = <String>[];

  /// Фильтрация списка по категории
  static List<Place> filterListPlacesCategory(
    List<Place> placeList,
    List<String> category,
  ) {
    final listPlaceFiltered =
        placeList.where((place) => category.contains(place.placeType)).toList();

    return listPlaceFiltered;
  }

  /// Получить настройки фильтра категории
  Future<List<String>> getSettingsFilterCategory() async {
    final listFilter = await FilterRepository.getListFilterCategory();

    return listFilter;
  }

  Future<void> saveFilterSettings({
    required FilterSet filterSet,
  }) async {
    // Сохраняем нажатые иконки
    await updateListFilterCategory(filterSet.selectedCategory);

    // Сохраняем дистанцию
    await updateListFilterDistance(filterSet.rangeDistance);
  }

  /// Получить настройки фильтра дистанции до места
  Future<RangeValues> getSettingsFilterDistance() async {
    var rangeDistance = await FilterRepository.getListFilterDistance();
    //Проверяем если пришли из сохраненных значения 0
    if (rangeDistance.start == 0 && rangeDistance.end == 0) {
      rangeDistance = const RangeValues(100, 1000);
    }
    debugPrint('rangeDistance = ${rangeDistance.end.toString()}');

    return rangeDistance;
  }

  /// Обновить список настроек фильтра
  Future<void> updateListFilterCategory(
    Set<String> listCategory,
  ) async {
    await FilterRepository.updateFilterCategory(listCategory);
  }

  /// Обновить список настроек фильтра дистанции
  Future<void> updateListFilterDistance(
    RangeValues distance,
  ) async {
    debugPrint('distance distance = ${distance.end}');
    await FilterRepository.updateFilterDistance(distance);
  }
}
