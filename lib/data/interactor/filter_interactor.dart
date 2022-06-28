import 'package:places/data/model/filter_category.dart';
import 'package:places/data/model/filter_distance.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/filter_repository.dart';

class FilterInteractor {
  /// Получить настройки фильтра категории
  static Future<List<FilterCategory>?> getSettingsFilterCategory() async {
    final listFilter = await FilterRepository.getListFilterCategory();

    return listFilter;
  }

  /// Получить настройки фильтра дистанции до места
  static Future<List<FilterDistance>?> getSettingsFilterDistance() async {
    final listFilter = await FilterRepository.getListFilterDistance();

    return listFilter;
  }

  ///--------------------------------------------------------------
  /// Обновить список настроек фильтра
  static Future<void> updateListFilterCategory(
    List<FilterCategory> listFilter,
  ) async {
    for (final item in listFilter) {
      await FilterRepository.updateFilterCategory(item);
    }
  }

  ///--------------------------------------------------------------
  /// Обновить список настроек фильтра дистанции
  static Future<void> updateListFilterDistance(
    List<FilterDistance> listFilter,
  ) async {
    for (final item in listFilter) {
      await FilterRepository.updateFilterDistance(item);
    }
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
}
