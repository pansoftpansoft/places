import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/type_place.dart';

class FiltersScreenModel extends ChangeNotifier {
  ///Мапа кнопок для фильтрации мест с изночальными значениями
  static final Map<String, bool> _filterMap = <String, bool>{
    'hotel': true,
    'restaurant': true,
    'particularPlace': true,
    'park': true,
    'museum': true,
    'cafe': true,
  };

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  //экран то востановим текущие значения

  static final Map<String, bool> _filterMapOld = <String, bool>{
    'hotel': true,
    'restaurant': true,
    'particularPlace': true,
    'park': true,
    'museum': true,
    'cafe': true,
  };

  ///
  static int countPlace = 0;

  ///
  static RangeValues selectedRange = const RangeValues(100, 1000);

  ///
  static Map<String, bool> get filterMap => _filterMap;

  ///Подсчет отфильтрованных мест
  ///Пометка мест что они попали в фильтр
  void setFilteredPlaces() {
    mocksSearchText.clear();
    var countPlaceFiltered = 0; //Подсчет отфильтрованных мест,
    // для отображения на кнопке
    debugPrint('mocks ${mocks.length}');
    for (final item in mocks) {
      //item.visibleFilter = false;
      // if (_arePointsNear(
      //       item.lat,
      //       item.lon,
      //     ) &&
      //     SearchFilterModel.filterMap[item.placeType]!) {
      item.visibleFilter = true;
      countPlaceFiltered++;
      // }
    }
    countPlace = countPlaceFiltered;
  }

  ///Взводим галочку на кнопке категорий
  void setTypePlaceSelected(final String typePlace) {
    if (_filterMap[typePlace]!) {
      _filterMap[typePlace] = false;
    } else {
      _filterMap[typePlace] = true;
    }
    for (final item in _filterMap.values) {
      debugPrint('$typePlace = ${item.toString()}');
    }
    debugPrint('$typePlace = ${_filterMap[typePlace]}');
  }

  void getDataFromRepository() {
    final listCategory = <String>[];
    for (final item in _filterMap.keys.toList()) {
      if (_filterMap[item] == true) {
        listCategory.add(item);
      }
    }

    PlaceInteractor.getPlaces(
      category: listCategory.isEmpty ? null : listCategory,
    );
    debugPrint(' = ${_filterMap.length}  ${listCategory.length}');

    return;
  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }

  ///Расставить сохраненные настройки фильтра
  void getFilterSettings() {
    for (final k in _filterMapOld.entries) {
      _filterMap[k.key] = k.value;
    }
  }

  void countFilteredPlacesSet() {
    setFilteredPlaces();
    notifyListeners();
  }
}
