import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/domain/sql_provider.dart';
import 'package:places/type_place.dart';

/// Слой бизнес логики
class PlaceInteractor {
  PlaceRepository placeRepository = PlaceRepository();

  ///--------------------------------------------------------------

  Future<Place?> getPlaceDetails(
    int placeId,
  ) async {
    return placeRepository.getPlaceId(placeId);
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

    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await SqlProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      debugPrint('addInLocalDB place.isFavorites = ${place.isFavorites}');
      final countUpdate = await SqlProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await SqlProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }

    debugPrint(
      'newPlace id = ${place.id} isFavorites = ${place.isFavorites}',
    );

    mocksFiltered = (await placeRepository.updateMocksFiltered())!;
    await getListWantVisitAndVisitedBloc();
  }

  ///-----------------------------------------------
  /// Добавить место в посещенные
  Future<void> setStatusPlaceVisited(
    Place place,
  ) async {
    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await SqlProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    debugPrint('addInLocalDB = $addInLocalDB');

    if (addInLocalDB) {
      final countUpdate = await SqlProvider.dbProvider.updatePlacesLocalData(
        place,
      );
      debugPrint('countUpdate = $countUpdate');
    } else {
      final countInsert = await SqlProvider.dbProvider.insertPlacesLocalData(
        place,
      );
      debugPrint('countInsert = $countInsert');
    }
    debugPrint('place id = ${place.id} isFavorites = ${place.visitedDate}');

    await getListWantVisitAndVisitedBloc();
  }

  /// Добавить место в посещенные
  Future<void> setStatusPlaceWantVisitDate(
    Place place,
  ) async {
    // проверяем есть токое место в лакальной базе, если нет добавляем.
    final addInLocalDB = await SqlProvider.dbProvider.checkPlacesInLocalDataId(
      place.id,
    );

    late int countUpdate;
    late int countInsert;
    if (addInLocalDB) {
      countUpdate = await SqlProvider.dbProvider.updatePlacesLocalData(
        place,
      );
    } else {
      countInsert = await SqlProvider.dbProvider.insertPlacesLocalData(
        place,
      );
    }

    debugPrint('countUpdate = $countUpdate, countInsert = $countInsert');

    await getListWantVisitAndVisitedBloc();
  }

  Future<List<Place>> getListWantVisitAndVisitedBloc() async {
    final listAllPlace = await placeRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await placeRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');
    final list = await placeRepository.getPlacesVisited(listAllPlace);

    return list;
  }
}
