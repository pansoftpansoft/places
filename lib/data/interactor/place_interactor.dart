import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/type_place.dart';

/// Слой бизнес логики
class PlaceInteractor {
  ///--------------------------------------------------------------
  /// Получить список отфильтрованных мест
  static Future<List<Place>?> getPlacesInteractor({
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  }) async {
    debugPrint('Старт getPlacesInteractor');
    final mocksFromRepository = await PlaceRepository.getPlacesRepository(
      radiusRange: radiusRange,
      category: category,
      searchString: searchString,
    );
    mocksFiltered = mocksFromRepository;
    debugPrint('Загрузку mocksFiltered завершене = ${mocksFiltered.length}');

    return mocksFiltered;
  }

  static Future<Place?> getPlaceDetails(int placeId) async {
    return PlaceRepository.getPlaceId(placeId);
  }

  /// Установка месту избранное или нет
  static Future<void> setFavorites(Place place) async {
    // Пробуем обновить место

    if (place.isFavorites) {
      place.isFavorites = false;
      debugPrint('Это кнопка "В избранное" remove');
    } else {
      place.isFavorites = true;
      debugPrint('Это кнопка "В избранное" add');
    }

    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await DBProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await DBProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }

    debugPrint('place id = ${place.id} isFavorites = ${place.isFavorites}');

    mocksFiltered = (await PlaceRepository.updateMocksFiltered())!;
    await getListWantVisitAndVisited();
  }

  ///-----------------------------------------------
  /// Отметить место как посещенное
  static Future<void> addToVisitingPlaces(Place place) async {
    await PlaceRepository.postPlace(place);
    for (final element in mocks) {
      if (element.id == place.id) {
        element.visitedDate = DateTime.now();
      }
    }
    await getListWantVisitAndVisited();
  }

  ///-----------------------------------------------
  /// Добавить место в посещенные
  static Future<void> setStatusPlaceVisited(Place place) async {
    place.visitedDate = place.visitedDate == null ? DateTime.now() : null;

    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await DBProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      final countUpdate = await DBProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await DBProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }
    debugPrint('place id = ${place.id} isFavorites = ${place.visitedDate}');

    await getListWantVisitAndVisited();
  }

  static Future<void> getListWantVisitAndVisited() async {
    final listAllPlace = await PlaceRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await PlaceRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');

    mocksVisited = await PlaceRepository.getPlacesVisited(listAllPlace);
  }
}
