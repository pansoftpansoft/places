import 'dart:async';

import 'package:flutter/material.dart';
import 'package:places/data/interactor/place_interactor.dart';
import 'package:places/data/model/place.dart';
import 'package:places/ui/res/svg_icons.dart';
import 'package:places/ui/screen/filters_screen/model/filters_screen_model.dart';
import 'package:places/ui/screen/list_places_screen/models/list_places_screen_model.dart';
import 'package:places/ui/screen/visiting_screen/models/visiting_model.dart';
import 'package:provider/provider.dart';

///Модель для DetailsPlaceModel
class DetailsPlaceModel extends ChangeNotifier {
  StreamController<String> streamControllerDetailsPlace =
      StreamController<String>();

  PlaceInteractor placeInteractor = PlaceInteractor();

  ///Всего отображаемых фотографий
  int countElements = 1;

  ///Индекс отображаемой фотографии
  int index = 0;

  List<String> iconList = <String>[
    SvgIcons.heartTransparent,
    SvgIcons.heartFull,
    SvgIcons.loaderSmall,
  ];

  Place? detailsPlace;

  void openStream() {
    debugPrint('Открываем стрим');
    streamControllerDetailsPlace = StreamController<String>();
  }

  void closeStream() {
    debugPrint('Закрываем стрим');
    streamControllerDetailsPlace.close();
  }

  void updateContext(Place place, BuildContext context) {
    context
        .read<PlaceInteractor>()
        .setFavorites(
          place,
          context.read<ListPlacesScreenModel>().streamControllerListPlace,
        )
        .then((value) {
      streamControllerDetailsPlace.sink.add(
        context.read<DetailsPlaceModel>().iconList[place.isFavorites ? 1 : 0],
      );
      debugPrint(
        'Обновление контекстов при нажатии кнопки Добавить в фавориты',
      );
      context.read<VisitingModel>().updateScreen();
      context.read<FiltersScreenModel>().notifyListenersFiltersScreen();
    });
  }

  void onPressed(Place place, BuildContext context) {
    streamControllerDetailsPlace.sink
        .add(context.read<DetailsPlaceModel>().iconList[2]);
    context.read<DetailsPlaceModel>().updateContext(place, context);
  }

  ///Изменнение положения индикатора
  void changeScrollIndicator(
    final int countPhoto,
    final int indexIndicator,
  ) {
    debugPrint('notifyListeners()');
    countElements = countPhoto;
    index = indexIndicator;
  }

  void updateScreen() {
    notifyListeners();
  }

  Future<void> getPlace(
    int placeId,
    StreamController<Place> streamControllerListPlace,
  ) async {
    detailsPlace = await placeInteractor.getPlaceDetails(
      placeId,
      streamControllerListPlace,
    );
  }
}
