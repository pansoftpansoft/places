import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';

///Модель для добавления фотографий в карточку места
class ListPlacesScreenModel extends ChangeNotifier {
  StreamController<Place> streamControllerListPlace =
      StreamController<Place>.broadcast();

  PlaceInteractor placeInteractor = PlaceInteractor();

  void openStream() {
    debugPrint('Открыть стрим');
    streamControllerListPlace = StreamController<Place>();
  }

  void closeStream() {
    debugPrint('Закрываем стрим');
    streamControllerListPlace.close();
  }

  ///Управление кнопкой создать
  void updatePlacesList() {
    debugPrint('PlacesListScreenModel');
    notifyListeners();
  }

  Future<void> load() async {
    openStream();
    await placeInteractor.getPlacesInteractor(
      radiusRange: FiltersScreenModel.rangeDistance,
      category: FiltersScreenModel.listCategory.isEmpty
          ? null
          : FiltersScreenModel.listCategory,
      streamControllerListPlace: streamControllerListPlace,
    );
    await placeInteractor.getListWantVisitAndVisited(
      streamControllerListPlace,
    );
  }
}
