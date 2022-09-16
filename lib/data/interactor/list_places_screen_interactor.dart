import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:places/data/interactor/filters_screen_interactor.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';

class ListPlacesScreenInteractor extends ChangeNotifier {

  PlaceInteractor placeInteractor = PlaceInteractor();


  ///Управление кнопкой создать
  void updatePlacesList() {
    debugPrint('PlacesListScreenModel');
    notifyListeners();
  }

  @Deprecated('В связи с рефакторингом на блок. Актуальна loadBloc')
  Future<void> load() async {

    await placeInteractor.getPlacesInteractor(
      radiusRange: FiltersScreenInteractor.rangeDistance,
      category: FiltersScreenInteractor.listCategory.isEmpty
          ? null
          : FiltersScreenInteractor.listCategory,
    );
    await placeInteractor.getListWantVisitAndVisitedBloc();
  }

  Future<List<Place>> loadBloc() async {
    final list = await placeInteractor.getPlacesInteractor(
      radiusRange: FiltersScreenInteractor.rangeDistance,
      category: FiltersScreenInteractor.listCategory.isEmpty
          ? null
          : FiltersScreenInteractor.listCategory,
    );

    debugPrint('list.toString() = ${list.length}');

    return list;
  }
}
