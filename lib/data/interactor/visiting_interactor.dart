import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/type_place.dart';

///Модель для Visiting
class VisitingInteractor extends ChangeNotifier {
  PlaceInteractor placeInteractor = PlaceInteractor();

  ///Удаление из мест которые хотел посетить
  Future<void> deletePlaceWantVisit(
    Place place,
    StreamController<Place> streamControllerListPlace,
  ) async {
    await placeInteractor.setFavorites(place, streamControllerListPlace);
    notifyListeners();
  }

  ///Удаление из мест которые уже посетил
  Future<void> deletePlaceVisited(
    Place place,
    StreamController<Place> streamControllerListPlace,
  ) async {
    await placeInteractor.setStatusPlaceVisited(
        place, streamControllerListPlace,);
    notifyListeners();
  }

  ///Перемещение карточек внутри списка
  void sortedPlaceWantVisit(final int sours, final int target) {
    final placeTarget = mocksWantVisit[target];
    mocksWantVisit[target] = mocksWantVisit[sours];
    mocksWantVisit[sours] = placeTarget;
    notifyListeners();
  }

  ///Установка или изменение даты заплонированного посещения интересног места
  void dateWantVisit(final int sours, final DateTime dateWantVisitNew) {
    mocksWantVisit[sours].wantVisitDate = dateWantVisitNew;
    notifyListeners();
  }

  ///Установка места признака что оно посещено
  void updateScreen() {
    notifyListeners();
  }
}