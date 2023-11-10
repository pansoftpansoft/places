import 'dart:async';

import 'package:places/data/model/place.dart';
import 'package:places/data/repository/place_repository_moor.dart';
import 'package:places/type_place.dart';

///Модель для Visiting
class VisitingInteractor {
  PlaceRepositoryMoor placeRepository;

  VisitingInteractor(this.placeRepository);

  ///Удаление из мест которые хотел посетить
  Future<void> deletePlaceWantVisit(
    Place place,
  ) async {
    final placeNew = place.copyWith(isFavorites: false);
    await placeRepository.deleteFromFavorites(
      placeNew,
    );
  }

  ///Удаление из мест которые уже посетил
  // Future<void> deletePlaceVisited(
  //   Place place,
  // ) async {
  //   // await placeInteractor.setStatusPlaceVisited(
  //   //   place,
  //   // );
  // }

  ///Перемещение карточек внутри списка
  void sortedPlaceWantVisit(int sours, int target) {
    final placeTarget = mocksWantVisit[target];
    mocksWantVisit[target] = mocksWantVisit[sours];
    mocksWantVisit[sours] = placeTarget;
  }

  ///Установка или изменение даты заплонированного посещения интересног места
  Future<void> dateWantVisit(Place place) async {
    await placeRepository.insertUpdateFavorites(
      place,
    );
  }

  ///Установка места признака что оно посещено
  Future<void> wantVisitUpdateToVisit(Place place) async {

    await placeRepository.setPlacesVisited(place);

  }

  Future<List<Place>> getListWantVisitAndVisited() async {
    mocksWantVisit = await placeRepository.getPlacesWantVisit();

    return mocksWantVisit;
  }
}
