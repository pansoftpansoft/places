// ignore_for_file: prefer_final_in_for_each

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/filter_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

class FiltersScreenInteractor extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<FilterCategory> listFilterCategory = <FilterCategory>[];
  static List<FilterDistance> listFilterDistance = <FilterDistance>[];

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

  ///Расставить сохраненные настройки фильтра
  static Future<void> getFilterSettings() async {
    listFilterCategory = (await FilterInteractor.getSettingsFilterCategory())!;
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

    listFilterDistance = (await FilterInteractor.getSettingsFilterDistance())!;
    for (final item in listFilterDistance) {
      rangeDistance = RangeValues(item.distanceStart, item.distanceEnd);
    }
  }

  ///Взводим галочку на кнопке категорий
  void setTypePlaceSelected(final String typePlace) {
    if (filterMap[typePlace]!) {
      filterMap[typePlace] = false;
    } else {
      filterMap[typePlace] = true;
    }
  }

  Future<void> restoreFilterSettings() => getFilterSettings();

  Future<void> getDataFromRepository(
  ) async {
    mocksSearchText.clear();
    listCategory = <String>[];
    for (final item in filterMap.keys.toList()) {
      if (filterMap[item] ?? false) {
        listCategory.add(item);
      }
    }

    mocksFiltered = await placeInteractor.getPlacesInteractor(
      radiusRange: rangeDistance,
      category: listCategory.isEmpty ? null : listCategory,
    ) as List<Place>;

    debugPrint(' countPlace 3  = ${mocksFiltered.length}');

    return;
  }

  Future<void> saveFilterSettings() async {
    // Сохраняем категории
    for (var item in listFilterCategory) {
      item.categoryValue = filterMap[item.category]! ? 1 : 0;
    }
    await FilterInteractor.updateListFilterCategory(listFilterCategory);
    // Сохраняем дистанцию

    for (var item in listFilterDistance) {
      item
        ..distanceStart = rangeDistance.start
        ..distanceEnd = rangeDistance.end;
    }
    await FilterInteractor.updateListFilterDistance(listFilterDistance);
  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }

  void countFilteredPlacesSet() {
    notifyListeners();
  }
}
