import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/filter.dart';
import 'package:places/type_place.dart';

class FiltersScreenModel extends ChangeNotifier {
  ///Список истории поисковых запросов
  static List<Filter> listFilter = <Filter>[];

  ///Мапа кнопок для фильтрации мест с изночальными значениями
  static Map<String, bool> filterMapNew = <String, bool>{};

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
    final listFilter = await PlaceInteractor.getFilter();
    filterMapNew.clear();
    for (final item in listFilter!) {
      filterMapNew[item.category] = item.categoryValue == 1;
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
    if (filterMapNew[typePlace]!) {
      filterMapNew[typePlace] = false;
    } else {
      filterMapNew[typePlace] = true;
    }
    for (final item in filterMapNew.values) {
      debugPrint('$typePlace = ${item.toString()}');
    }
    debugPrint('$typePlace = ${filterMapNew[typePlace]}');
  }

  /// TODO переделать на interactor
  void getDataFromRepository() {
    final listCategory = <String>[];
    for (final item in filterMapNew.keys.toList()) {
      if (filterMapNew[item] ?? false) {
        listCategory.add(item);
      }
    }

    PlaceInteractor.getPlaces(
      category: listCategory.isEmpty ? null : listCategory,
    );
    debugPrint(' = ${filterMapNew.length}  ${listCategory.length}');

    return;
  }

  void saveFilterSettings(){

  }

  void notifyListenersFiltersScreen() {
    notifyListeners();
  }


  void countFilteredPlacesSet() {
    setFilteredPlaces();
    notifyListeners();
  }
}
