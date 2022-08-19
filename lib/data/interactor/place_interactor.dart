import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/db_provider.dart';
import 'package:places/type_place.dart';

/// Слой бизнес логики
class PlaceInteractor extends ChangeNotifier {
  PlaceRepository placeRepository = PlaceRepository();

  ///--------------------------------------------------------------
  /// Получить список отфильтрованных мест
  Future<List<Place>?> getPlacesInteractor({
    RangeValues? radiusRange,
    List<String>? category,
    String? searchString,
  }) async {
    final mocksFromRepository = await placeRepository.getPlacesRepository(
      radiusRange: radiusRange,
      category: category,
      searchString: searchString,
    );
    mocksFiltered = mocksFromRepository;
    debugPrint('Загрузку mocksFiltered завершене = ${mocksFiltered.length}');

    return mocksFiltered;
  }

  Future<Place?> getPlaceDetails(
    int placeId,
    StreamController<Place> streamControllerListPlace,
  ) async {
    return placeRepository.getPlaceId(placeId, streamControllerListPlace);
  }

  Future<Place?> postPlace(
    Place place,
  ) async {
    return placeRepository.postPlace(place);
  }

  /// Установка месту избранное или нет
  Future<void> setFavorites(
    Place place,
    //StreamController<Place> streamControllerListPlace,
  ) async {
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

    mocksFiltered = (await placeRepository.updateMocksFiltered())!;
    await getListWantVisitAndVisited();
  }

  ///-----------------------------------------------
  /// Добавить место в посещенные
  Future<void> setStatusPlaceVisited(
    Place place,
  ) async {
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

  @Deprecated('Не возвращала список. Список необходим для перехода на Bloc')
  Future<void> getListWantVisitAndVisited() async {
    final listAllPlace = await placeRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await placeRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');

    mocksVisited = await placeRepository.getPlacesVisited(listAllPlace);
  }

  Future<List<Place>> getListWantVisitAndVisitedBloc() async {
    final listAllPlace = await placeRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await placeRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');
    final list = await placeRepository.getPlacesVisited(listAllPlace);

    return list;
  }

// ///-----------------------------------------------
// /// Отметить место как посещенное
// Future<void> addToVisitingPlaces(
//   Place place,
//   StreamController<Place> streamControllerListPlace,
// ) async {
//   await placeRepository.postPlace(place, streamControllerListPlace);
//   for (final element in mocks) {
//     if (element.id == place.id) {
//       element.visitedDate = DateTime.now();
//     }
//   }
//   await getListWantVisitAndVisited();
// }
}
