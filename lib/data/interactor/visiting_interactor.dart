import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository.dart';
import 'package:places/type_place.dart';

///Модель для Visiting
class VisitingInteractor extends ChangeNotifier {
  PlaceInteractor placeInteractor = PlaceInteractor();
  PlaceRepository placeRepository = PlaceRepository();

  ///Удаление из мест которые хотел посетить
  Future<void> deletePlaceWantVisit(
    Place place,
    //StreamController<Place> streamControllerListPlace,
  ) async {
    final placeNew= place.copyWith(isFavorites: false);
    await placeInteractor.setFavorites(
      placeNew,
    );
  }

  ///Удаление из мест которые уже посетил
  Future<void> deletePlaceVisited(
    Place place,
  ) async {
    await placeInteractor.setStatusPlaceVisited(
      place,
    );
    notifyListeners();
  }

  ///Перемещение карточек внутри списка
  void sortedPlaceWantVisit(int sours, int target) {
    final placeTarget = mocksWantVisit[target];
    mocksWantVisit[target] = mocksWantVisit[sours];
    mocksWantVisit[sours] = placeTarget;
    notifyListeners();
  }

  ///Установка или изменение даты заплонированного посещения интересног места
  void dateWantVisit(int sours, DateTime dateWantVisitNew) {
    mocksWantVisit[sours].copyWith(wantVisitDate: dateWantVisitNew);
    notifyListeners();
  }

  ///Установка места признака что оно посещено
  Future<void> wantVisitUpdateToVisit(Place place) async {
    await placeInteractor.setStatusPlaceVisited(place);
  }

  Future<void> getListWantVisitAndVisited() async {


    final listAllPlace = await placeRepository.getAllPlace();
    debugPrint('listAllPlace = ${listAllPlace.length}');
    mocksWantVisit = await placeRepository.getPlacesWantVisit(listAllPlace);
    debugPrint('mocksWantVisit = ${mocksWantVisit.length}');

    mocksVisited = await placeRepository.getPlacesVisited(listAllPlace);
    debugPrint('mocksVisited = ${mocksVisited.length}');
  }
}
