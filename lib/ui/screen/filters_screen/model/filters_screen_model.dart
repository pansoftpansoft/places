// ignore_for_file: prefer_final_in_for_each

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/type_place.dart';

class FiltersScreenModel extends ChangeNotifier {
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

  ///Расставить сохраненные настройки фильтра
  static Future<void> getFilterSettings() async {
    listFilterCategory = (await PlaceInteractor.getSettingsFilterCategory())!;
    filterMap.clear();
    for (final item in listFilterCategory) {
      filterMap[item.category] = item.categoryValue == 1;
    }

    listFilterDistance = (await PlaceInteractor.getSettingsFilterDistance())!;
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
    for (final item in filterMap.values) {
      debugPrint('$typePlace = ${item.toString()}');
    }
    debugPrint('$typePlace = ${filterMap[typePlace]}');
  }

  Future<void> restoreFilterSettings() => getFilterSettings();

  Future<void> getDataFromRepository() async {
    mocksSearchText.clear();
    final listCategory = <String>[];
    for (final item in filterMap.keys.toList()) {
      if (filterMap[item] ?? false) {
        listCategory.add(item);
      }
    }

    mocksFiltered = (await PlaceInteractor.getPlacesInteractor(
      radiusRange: rangeDistance,
      category: listCategory.isEmpty ? null : listCategory,
    ))!;

    debugPrint(' countPlace 3  = ${mocksFiltered.length}');

    return;
  }

  Future<void> saveFilterSettings() async {
    // Сохраняем категории
    for (var item in listFilterCategory) {
      item.categoryValue = filterMap[item.category]! ? 1 : 0;
    }
    await PlaceInteractor.updateListFilterCategory(listFilterCategory);
    // Сохраняем дистанцию

    for (var item in listFilterDistance) {
      item.distanceStart = rangeDistance.start;
      item.distanceEnd = rangeDistance.end;
    }
    await PlaceInteractor.updateListFilterDistance(listFilterDistance);
  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }

  void countFilteredPlacesSet() {
    notifyListeners();
  }
}
