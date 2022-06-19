import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter.dart';
import 'package:places/type_place.dart';

class FiltersScreenModel extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<Filter> listFilter = <Filter>[];

  ///Мапа кнопок для фильтрации мест с изночальными значениями
  static Map<String, bool> filterMap = <String, bool>{};

  //Запоминаем старые значения
  //Если нажата кнопка Показать то переписываем значения
  //Если пользователь вернулся на предыдущий
  //экран то востановим текущие значения

  ///
  static int countPlace = 0;

  ///
  static RangeValues selectedRange = const RangeValues(100, 1000);

  ///Расставить сохраненные настройки фильтра
  static Future<void> getFilterSettings() async {
    listFilter = (await PlaceInteractor.getSettingsFilter())!;
    filterMap.clear();
    for (final item in listFilter) {
      filterMap[item.category] = item.categoryValue == 1;
    }
  }

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

  /// TODO переделать на interactor
  void getDataFromRepository() {
    final listCategory = <String>[];
    for (final item in filterMap.keys.toList()) {
      if (filterMap[item] ?? false) {
        listCategory.add(item);
      }
    }

    PlaceInteractor.getPlaces(
      category: listCategory.isEmpty ? null : listCategory,
    );
    debugPrint(' = ${filterMap.length}  ${listCategory.length}');

    return;
  }

  Future<void> saveFilterSettings() async {
    for (var item in listFilter) {
      item.categoryValue = filterMap[item.category]! ? 1 : 0;
    }
    await PlaceInteractor.updateListFilterSettings(listFilter);
  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }

  void countFilteredPlacesSet() {
    setFilteredPlaces();
    notifyListeners();
  }
}
