import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_set.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/filter_repository.dart';

class FiltersScreenInteractor extends ChangeNotifier {
  ///Список истории фильтров

  ///Мапа кнопок для фильтрации мест с изночальными значениями
  static Map<String, bool> filterMap = <String, bool>{};

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  //экран то востановим текущие значения

  ///
  static RangeValues rangeDistance = const RangeValues(100, 1000);
  static List<String> listCategory = <String>[];

  PlaceInteractor placeInteractor = PlaceInteractor();


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

  ///Расставить сохраненные настройки фильтра
  Future<void> getFilterSettings() async {
    listCategory = await getSettingsFilterCategory();
    rangeDistance = await getSettingsFilterDistance();
  }


  Future<void> restoreFilterSettings() => getFilterSettings();

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
    final listFilter = await FilterRepository.getListFilterDistance();

    return listFilter;
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
