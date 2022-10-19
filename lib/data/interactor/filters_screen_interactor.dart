// ignore_for_file: prefer_final_in_for_each
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/filter_repository.dart';
import 'package:places/type_place.dart';
import 'package:places/ui/res/labels.dart';

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

  /// Обновить список настроек фильтра дистанции
  static Future<void> updateListFilterDistance(
    FilterDistance distance,
  ) async {
    debugPrint('distance distance = ${distance.distanceEnd}');
    await FilterRepository.updateFilterDistance(distance);
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

  /// Получить настройки фильтра категории
  Future<List<FilterCategory>> getSettingsFilterCategory() async {
    final listFilter = await FilterRepository.getListFilterCategory();

    return listFilter;
  }

  ///Расставить сохраненные настройки фильтра
  Future<void> getFilterSettings() async {
    final listFilterCategory = await getSettingsFilterCategory();
    filterMap.clear();
    for (final item in listFilterCategory) {
      filterMap[item.category] = item.categoryValue == 1;
    }

    listCategory = <String>[];
    for (final item in filterMap.keys.toList()) {
      if (filterMap[item] ?? false) {
        listCategory.add(item);
      }
    }

    final listFilterDistance = await getSettingsFilterDistance();
    rangeDistance = RangeValues(
      listFilterDistance.distanceStart,
      listFilterDistance.distanceEnd,
    );
  }

  Future<void> restoreFilterSettings() => getFilterSettings();

  Future<int> getDataFromRepository({
    Map<String, bool>? filterMap,
    FilterDistance? rangeDistance,
  }) async {
    mocksSearchText.clear();

    listCategory = <String>[];
    if (filterMap != null) {
      for (final item in filterMap.keys.toList()) {
        if (filterMap[item] ?? false) {
          listCategory.add(item);
        }
      }
    }

    mocksFiltered = await placeInteractor.getPlacesInteractor(
      radiusRange: RangeValues(
        rangeDistance == null ? 100 : rangeDistance.distanceStart,
        rangeDistance == null ? 1000 : rangeDistance.distanceEnd,
      ),
      category: listCategory.isEmpty ? null : listCategory,
    );

    debugPrint(' countPlace 3  = ${mocksFiltered.length}');

    return mocksFiltered.length;
  }

  Future<void> saveFilterSettings({
    required Map<String, bool> filterMap,
    required FilterDistance filterDistance,
  }) async {
    final listCategory = <FilterCategory>[];

    for (final item in filterMap.keys.toList()) {
      listCategory.add(FilterCategory(
        item,
        1,
        filterMap[item] ?? false ? 1 : 0,
      ));
    }

    await updateListFilterCategory(listCategory);

    // Сохраняем дистанцию
    await updateListFilterDistance(filterDistance);
  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }

  void countFilteredPlacesSet() {
    notifyListeners();
  }

  /// Получить настройки фильтра дистанции до места
  Future<FilterDistance> getSettingsFilterDistance() async {
    final listFilter = await FilterRepository.getListFilterDistance();

    return listFilter;
  }

  /// Обновить список настроек фильтра
  Future<void> updateListFilterCategory(
    List<FilterCategory> listFilter,
  ) async {
    for (final item in listFilter) {
      await FilterRepository.updateFilterCategory(item);
    }
  }
}
